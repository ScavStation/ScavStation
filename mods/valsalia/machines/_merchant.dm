// Merchant framework. The merchant objects are in merchant.dm - you almost
// never need to touch this file to add one.
//
// Val Salia has no power grid, so the usual vending machines are a no go and
// instead we use merchants. A credstick is still accepted as fallback. Since merchants are not
// machines, anything with wiring / emags won't work.
//
// SELLING (merchant -> player):
//   Every product needs an entry in `product_prices` giving a flat price in whole
//   crowns. There is no worth-based fallback as the item worth model is
//   calibrated for the station credit economy and produces absurd numbers in a
//   coin economy where the average player carries ~50 crowns. A product with no
//   price entry logs a stack trace and falls back to 1 crown so no runtimes.
//
// BUYING (player -> merchant):
//   A merchant with a non-empty `buy_prices` list will purchase items off players.
//   The actual offer is: base * material multiplier * condition multiplier.
//   Material multiplier is the item material's own value (~1.0 for iron/steel/
//   plastic, ~1.6 for gold, ~1.8 for diamond, <1 for soft organics).
//   Condition scales the offer down for damaged goods.
//
// Layout of this file:
//   /datum/vendor                       - all the vend/pay/buy bookkeeping
//   get_merchant_voicelines()           - loads merchant_voicelines.txt (ambient chatter, kept out of .dm files)
//   /obj/structure/merchant             - the static body that owns a vendor datum
//   /obj/abstract/landmark/merchant_post - optional timed come-and-go spawner

// Buy-price tuning.
#define VENDOR_MAT_MULT_MIN       0.5
#define VENDOR_MAT_MULT_MAX       3
#define VENDOR_CONDITION_MULT_MIN 0.3

// /datum/vendor - the trade logic, kept off /obj so it can be reused by other things

/datum/vendor
	var/atom/holder                        // Atom products spawn at and the NanoUI is hosted on.
	var/name = "merchant"                  // Shown as the UI title.
	var/list/products = list()             // Assoc list of (type path = stock count). Init only.
	var/list/product_prices               // Assoc (type path = flat price in crowns). Every product should be listed. Init only.
	var/list/product_records = list()      // Runtime list of /datum/stored_items/vending_products.
	var/list/buy_prices                    // Optional assoc (type path = base buy offer in crowns). Non-empty => merchant buys. Init only.
	var/list/reagent_buy_prices            // Optional assoc (reagent decl type = crowns per unit). Priced on top of the container's own buy_prices entry, if any.
	var/buy_budget                         // Optional coin-on-hand cap for buying. Null = unlimited. Drains as the merchant buys.
	var/grow_buy_budget_from_sales = FALSE // If TRUE, every crown a customer pays the merchant tops buy_budget back up.
	var/vendor_currency                    // /decl/currency path. Defaults to the map currency.
	var/categories = CAT_NORMAL            // Bitmask of product categories currently shown.
	var/datum/stored_items/vending_products/currently_vending // Item awaiting payment, if any.
	var/obj/item/currently_buying          // Item the merchant has quoted a standing offer on, if any. The offer itself is recomputed on the closing touch so it can't be gamed.
	var/status_message = ""
	var/status_error = FALSE
	var/vend_ready = TRUE
	var/vend_delay = 10

/datum/vendor/New(atom/_holder)
	holder = _holder
	if(!istype(holder))
		CRASH("[type] created without a holder atom.")
	if(!ispath(vendor_currency, /decl/currency))
		vendor_currency = global.using_map.default_currency
	..()

/datum/vendor/Destroy()
	QDEL_NULL_LIST(product_records)
	currently_vending = null
	currently_buying = null
	holder = null
	. = ..()

// Call once after `products`/`product_prices`/`buy_prices`/`name` have been set.
/datum/vendor/proc/build_inventory()
	var/decl/currency/cur = GET_DECL(vendor_currency)
	for(var/datum/stored_items/vending_products/stale in product_records)
		qdel(stale)
	product_records.Cut()
	for(var/entry in products)
		var/datum/stored_items/vending_products/product = new(holder, entry)
		var/flat_price = LAZYACCESS(product_prices, entry)
		if(isnull(flat_price))
			PRINT_STACK_TRACE("[holder?.type || "vendor"]: no price set for product [entry]; defaulting to 1 crown.")
			flat_price = 1
		product.price = max(0, round(flat_price * cur.absolute_value))
		product.category = CAT_NORMAL
		product.amount = products[entry] || 1
		if(ispath(product.item_path, /obj/item/stack/material))
			var/obj/item/stack/material/M = product.item_path
			var/decl/material/mat = GET_DECL(initial(M.material))
			if(mat)
				var/mat_amt = initial(M.amount)
				product.item_name = "[mat.solid_name] [mat_amt == 1 ? initial(M.singular_name) : initial(M.plural_name)] ([mat_amt]x)"
		product_records += product

// Builds the NanoUI. Hosted on `holder` so hrefs route back through it.
/datum/vendor/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, datum/nanoui/master_ui = null, datum/topic_state/state = global.default_topic_state)
	var/decl/currency/cur = GET_DECL(vendor_currency)
	var/list/data = list()
	if(currently_vending)
		data["mode"] = 1
		data["product"] = currently_vending.item_name
		data["price"] = cur.format_value(currently_vending.price)
		data["price_num"] = floor(currently_vending.price / cur.absolute_value)
		data["message"] = status_message
		data["message_err"] = status_error
	else
		data["mode"] = 0
		var/list/listed_products = list()
		for(var/key = 1 to product_records.len)
			var/datum/stored_items/vending_products/I = product_records[key]
			if(!(I.category & categories))
				continue
			listed_products.Add(list(list(
				"key"       = key,
				"name"      = I.item_name,
				"price"     = cur.format_value(I.price),
				"price_num" = floor(I.price / cur.absolute_value),
				"color"     = I.display_color,
				"amount"    = I.get_amount()
			)))
		data["products"] = listed_products

	ui = SSnano.try_update_ui(user, holder, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, holder, ui_key, "vending_machine.tmpl", name, 520, 600)
		ui.set_initial_data(data)
		ui.open()

/datum/vendor/proc/OnTopic(mob/user, list/href_list, datum/topic_state/state)
	if(href_list["vend"] && !currently_vending)
		var/key = text2num(href_list["vend"])
		if(!is_valid_index(key, product_records))
			return TOPIC_REFRESH
		var/datum/stored_items/vending_products/R = product_records[key]
		if(!istype(R) || !(R.category & categories))
			return TOPIC_REFRESH
		if(R.get_amount() <= 0)
			to_chat(user, SPAN_WARNING("\The [name] has none of that left."))
			return TOPIC_REFRESH
		if(R.price <= 0)
			vend(R, user)
		else if(issilicon(user))
			to_chat(user, SPAN_WARNING("\The [name] recoils and refuses to deal with the likes of you."))
		else
			var/decl/currency/cur = GET_DECL(vendor_currency)
			currently_vending = R
			status_message = "Hand over [cur.name] to complete the purchase."
			status_error = FALSE
		return TOPIC_REFRESH

	if(href_list["cancelpurchase"])
		currently_vending = null
		status_message = ""
		status_error = FALSE
		return TOPIC_REFRESH

	return TOPIC_NOACTION

// Called by the holder from its attackby. Returns TRUE if the item was consumed
// as an interaction (payment, or a sale to the merchant), FALSE to let the holder handle it.
/datum/vendor/proc/attackby(obj/item/W, mob/user)
	if(!currently_vending)
		// Not mid-sale: the merchant may want to buy this off the player instead.
		if(user.a_intent != I_HURT && LAZYLEN(buy_prices) && istype(W))
			return handle_player_sale(W, user)
		return FALSE

	if(!vend_ready)
		to_chat(user, SPAN_WARNING("\The [name] is still counting out the last sale."))
		return TRUE

	// Stock can hit zero between selecting the item and paying (someone else, or
	// the same person spamming coin at the body). Never take money for nothing.
	if(currently_vending.get_amount() <= 0)
		to_chat(user, SPAN_WARNING("\The [name] has none of \the [currently_vending.item_name] left, and waves your coin away."))
		currently_vending = null
		status_message = ""
		status_error = FALSE
		SSnano.update_uis(holder)
		return TRUE

	var/paid = FALSE
	var/handled = FALSE
	var/obj/item/charge_stick/CS = W.GetChargeStick()
	if(istype(W, /obj/item/cash)) // Coin first
		paid = pay_with_cash(W, user)
		handled = TRUE
	else if(CS) // Salvaged credstick still works, for the scav who has one.
		paid = pay_with_charge_card(CS, user)
		handled = TRUE

	if(paid)
		vend(currently_vending, user)
		return TRUE
	if(handled)
		SSnano.update_uis(holder)
		return TRUE
	return FALSE

/datum/vendor/proc/pay_with_cash(obj/item/cash/cashmoney, mob/user)
	if(currently_vending.price > cashmoney.absolute_worth)
		to_chat(user, SPAN_WARNING("[html_icon(cashmoney)] That is not enough coin."))
		return FALSE
	cashmoney.adjust_worth(-(currently_vending.price))
	credit_purchase("(cash)")
	return TRUE

/datum/vendor/proc/pay_with_charge_card(obj/item/charge_stick/wallet, mob/user)
	if(wallet.is_locked())
		status_message = "Unlock \the [wallet] before using it."
		status_error = TRUE
	else if(currently_vending.price > wallet.loaded_worth)
		status_message = "Insufficient funds on \the [wallet]."
		status_error = TRUE
	else
		wallet.adjust_worth(-(currently_vending.price))
		credit_purchase("[wallet.id]")
		return TRUE
	if(status_message && status_error)
		to_chat(user, SPAN_WARNING(status_message))
	return FALSE

/datum/vendor/proc/credit_purchase(target as text)
	if(global.vendor_account && !global.vendor_account.suspended)
		global.vendor_account.deposit(currently_vending.price, "Purchase of [currently_vending.item_name]", target)
	if(grow_buy_budget_from_sales && !isnull(buy_budget))
		buy_budget += currently_vending.price

/datum/vendor/proc/vend(datum/stored_items/vending_products/R, mob/user)
	if(!vend_ready)
		return
	currently_buying = null // A standing buy offer lapses once the player commits to a purchase.
	vend_ready = FALSE
	status_message = "Trading..."
	status_error = FALSE
	SSnano.update_uis(holder)
	addtimer(CALLBACK(src, PROC_REF(finish_vending), R), vend_delay)

/datum/vendor/proc/finish_vending(datum/stored_items/vending_products/R)
	if(QDELETED(src))
		return
	if(R && holder)
		if(R.get_product(get_turf(holder)))
			holder.visible_message(SPAN_NOTICE("\The [name] hands over \the [R.item_name]."))
		else
			holder.visible_message(SPAN_WARNING("\The [name] rummages, but comes up empty."))
	status_message = ""
	status_error = FALSE
	vend_ready = TRUE
	currently_vending = null
	SSnano.update_uis(holder)

// Buying logic
// Most specific matching entry in buy_prices, or 0 if the merchant won't buy it.
/datum/vendor/proc/base_buy_price(obj/item/W)
	. = 0
	var/best_depth = -1
	for(var/ptype in buy_prices)
		if(!istype(W, ptype))
			continue
		var/depth = length(splittext("[ptype]", "/"))
		if(depth > best_depth)
			best_depth = depth
			. = buy_prices[ptype]

// Material value as a price multiplier. 1.0 for an item with no material.
/datum/vendor/proc/material_price_mult(obj/item/W)
	var/decl/material/mat = W.get_material()
	if(!istype(mat))
		return 1
	return clamp(mat.get_value(), VENDOR_MAT_MULT_MIN, VENDOR_MAT_MULT_MAX)

// Most specific matching entry in reagent_buy_prices for a single reagent type, or 0.
/datum/vendor/proc/reagent_buy_price_per_unit(reagent_type)
	. = 0
	var/best_depth = -1
	for(var/rtype in reagent_buy_prices)
		if(!ispath(reagent_type, rtype))
			continue
		var/depth = length(splittext("[rtype]", "/"))
		if(depth > best_depth)
			best_depth = depth
			. = reagent_buy_prices[rtype]

// What's actually in the bottle/jar/whatever is worth on top of the container itself - e.g. a
// jar of yarrow tincture is priced as "empty jar" (base_buy_price) plus whatever the tincture's
// per-unit rate * volume comes to (reagent_buy_prices), not just whichever container type it is.
/datum/vendor/proc/get_reagent_buy_offer(obj/item/W)
	. = 0
	if(!LAZYLEN(reagent_buy_prices) || !istype(W, /obj/item/chems) || !W.reagents?.total_volume)
		return
	for(var/rtype in W.reagents.reagent_volumes)
		var/per_unit = reagent_buy_price_per_unit(rtype)
		if(per_unit > 0)
			. += per_unit * REAGENT_VOLUME(W.reagents, rtype)

// Final crown offer for an item, or 0 if the merchant has no use for it (or what's in it).
/datum/vendor/proc/get_buy_offer(obj/item/W)
	var/base = base_buy_price(W)
	. = base > 0 ? (base * material_price_mult(W)) : 0
	. += get_reagent_buy_offer(W)
	if(. <= 0)
		return 0
	. *= max(VENDOR_CONDITION_MULT_MIN, W.get_percent_health() / 100)
	. = max(1, round(.))

/datum/vendor/proc/handle_player_sale(obj/item/W, mob/user)
	var/decl/currency/cur = GET_DECL(vendor_currency)
	var/offer = get_buy_offer(W)
	if(offer <= 0)
		return FALSE // Not something this merchant buys - let the holder handle the click.

	if(!vend_ready)
		to_chat(user, SPAN_WARNING("\The [name] is busy. Wait a moment."))
		return TRUE

	if(!isnull(buy_budget) && buy_budget < offer)
		to_chat(user, SPAN_WARNING("\The [name] shows you an empty purse. \"Can't cover that just now.\""))
		currently_buying = null
		return TRUE

	// First touch with a given item: make a standing offer. Second touch: sell.
	if(QDELETED(currently_buying) || currently_buying != W)
		currently_buying = W
		to_chat(user, SPAN_NOTICE("\The [name] turns \the [W] over. \"[cur.format_value(offer)]. Give it to me again if that'll do.\""))
		return TRUE

	if(!user.try_unequip(W))
		to_chat(user, SPAN_WARNING("You can't seem to hand \the [W] over."))
		return TRUE

	var/item_desc = "\a [W]"
	if(!isnull(buy_budget))
		buy_budget -= offer
	if(global.vendor_account && !global.vendor_account.suspended)
		global.vendor_account.withdraw(offer, "Bought [W.name]", name)
	qdel(W)

	var/obj/item/cash/payout = new(user, null, offer)
	payout.set_currency(vendor_currency)
	user.put_in_hands_or_store_or_drop(payout)

	currently_buying = null
	vend_ready = FALSE
	addtimer(CALLBACK(src, PROC_REF(reset_vend_ready)), vend_delay)
	holder.visible_message(SPAN_NOTICE("\The [name] takes [item_desc] and counts out [cur.format_value(offer)]."))
	return TRUE

/datum/vendor/proc/reset_vend_ready()
	if(QDELETED(src))
		return
	vend_ready = TRUE
	SSnano.update_uis(holder)


// Ambient voicelines are kept out of the .dm files entirely - see merchant_voicelines.txt
// (same folder as this file). Loaded once and cached; edit the .txt and restart the server
// (no recompile needed) to pick up changes.
//
// Format: a line matching one of MERCHANT_VOICELINE_KEYS (case-insensitive, trailing ":"
// optional) starts that merchant's section; every non-blank, non-"//" line after it belongs
// to that merchant until the next recognised header. Lines before the first header, or under
// an unrecognised header, are ignored. e.g.:
//
//   Tailor:
//   Lovely bolts of cloth, fresh off the loom!
//   Need a new coat? You've come to the right stall.
//
//   General
//   Tools, trinkets, whatever you need.
//
#define MERCHANT_VOICELINE_KEYS list("tailor", "general", "apothecary", "butcher", "farmer", "roadside")

var/global/list/merchant_voicelines_by_key

// Strips a decorative trailing comma and a single wrapping pair of quotes (straight or curly) -
// leftovers from voicelines pasted in from a DM-list-style draft, e.g. `"Some line,”,`.
/proc/clean_voiceline_text(text)
	text = trim(text)
	if(copytext(text, -1) == ",")
		text = trim(copytext(text, 1, -1))
	if(length(text) >= 2)
		var/first_char = copytext(text, 1, 2)
		var/last_char = copytext(text, -1)
		if((first_char == "\"" && last_char == "\"") || (first_char == "“" && last_char == "”"))
			text = copytext(text, 2, -1)
	return text

// Returns the list of lines for the given merchant key (see /obj/structure/merchant/voiceline_key), or null.
/proc/get_merchant_voicelines(key)
	if(isnull(global.merchant_voicelines_by_key))
		global.merchant_voicelines_by_key = list()
		var/list/known_keys = MERCHANT_VOICELINE_KEYS
		var/current_key
		var/raw_text = safe_file2text("mods/valsalia/machines/merchant_voicelines.txt", FALSE)
		for(var/line in splittext(raw_text, "\n"))
			line = trim(line)
			if(!length(line) || copytext(line, 1, 3) == "//")
				continue
			var/header_check = lowertext(line)
			if(copytext(header_check, -1) == ":")
				header_check = copytext(header_check, 1, -1)
			if(header_check in known_keys)
				current_key = header_check
				continue
			if(current_key)
				var/cleaned = clean_voiceline_text(line)
				if(length(cleaned))
					LAZYADD(global.merchant_voicelines_by_key[current_key], cleaned)
	return key ? global.merchant_voicelines_by_key[lowertext(key)] : null

#undef MERCHANT_VOICELINE_KEYS

// /obj/structure/merchant - the static body. Subtype it (in merchant.dm)
// the bare type is abstract and shouldn't be mapped.

/obj/structure/merchant
	abstract_type = /obj/structure/merchant
	name = "merchant"
	desc = "A weathered trader, planted behind their wares and unwilling to move from the spot."
	icon = 'mods/valsalia/icons/mobs/merchants/general_merchant.dmi' // Default only; every concrete merchant below sets its own dedicated sheet.
	icon_state = ICON_STATE_WORLD
	anchored = TRUE
	density = TRUE
	max_health = 200                     // Sturdier than furniture; a merchant shouldn't fall over to one stray hit.
	var/vendor_name                      // Displayed name for the trade UI, defaults to the structure's name.
	var/list/vendor_products = list()    // Assoc list of items this merchant sells. Used directly when vendor_stock_pool is unset
	var/list/vendor_stock_pool           // Optional: wider catalogue to draw a rotating selection from. vendor_prices must cover every entry.
	var/vendor_stock_slots = 4           // How many distinct products to carry when drawing from vendor_stock_pool
	var/list/vendor_prices               // Prices for all items, every product AND every stock-pool entry should be listed here.
	var/list/vendor_buys                 // Optional: Non-empty => this merchant buys from players.
	var/list/vendor_reagent_buys         // Optional: reagent decl type = crowns per unit, priced on top of the container's own vendor_buys entry (if any).
	var/vendor_buy_budget                // Optional: coin-on-hand cap for buying. Null = unlimited. Always reset to this on a stock reroll.
	var/vendor_buy_budget_grows = FALSE  // If TRUE, sales top the budget back up within a visit (still resets to vendor_buy_budget on reroll).
	var/datum/vendor/shop
	var/travel_anim_time = 0.5 SECONDS   // Deciseconds the "arrival"/"leaving" icon animations run for
	var/death_linger_time = 5 SECONDS    // Deciseconds a "world-dead" corpse lingers before the body is cleared away.
	var/leaving = FALSE // TRUE while death anim/icon is playing - blocks all trade until the body is gone.
	/// This merchant's section header in merchant_voicelines.txt (case-insensitive). Null = no ambient chatter.
	var/voiceline_key
	var/voiceline_range = 2 // Tiles a living mob has to wander within before the merchant might say something
	var/voiceline_cooldown = 30 SECONDS // Minimum deciseconds between ambient voicelines, so a lingering player doesn't get spammed.
	var/tmp/next_voiceline_time = 0 // world.time of the next voiceline this merchant is allowed to say.

/obj/structure/merchant/Initialize()
	. = ..()
	shop = new(src)
	shop.name = vendor_name || name
	shop.product_prices = vendor_prices?.Copy()
	shop.buy_prices = vendor_buys?.Copy()
	shop.reagent_buy_prices = vendor_reagent_buys?.Copy()
	shop.grow_buy_budget_from_sales = vendor_buy_budget_grows
	roll_stock()
	START_PROCESSING(SSobj, src)

// Pick what this merchant is carrying and refill their coin. Called on spawn;
// safe to call again later to rotate stock on the same body (travelling merchant).
/obj/structure/merchant/proc/roll_stock()
	var/list/chosen
	if(LAZYLEN(vendor_stock_pool))
		chosen = list()
		var/list/pool = vendor_stock_pool.Copy()
		for(var/i = 1 to min(vendor_stock_slots, length(pool)))
			var/picked = pick(pool)
			chosen[picked] = pool[picked]
			pool -= picked
	else
		chosen = vendor_products?.Copy() || list()
	shop.products = chosen
	shop.buy_budget = vendor_buy_budget // Always reset on reroll - sales grow the budget within a visit, but a fresh visit starts from scratch.
	shop.build_inventory()

/obj/structure/merchant/Destroy()
	STOP_PROCESSING(SSobj, src)
	QDEL_NULL(shop)
	. = ..()

// Ambient chatter: say a random line whenever a player wanders
// within voiceline_range, paired with voiceline_cooldown so a lingering player isn't spammed.
/obj/structure/merchant/Process()
	if(leaving || !voiceline_key || world.time < next_voiceline_time)
		return
	var/list/lines = get_merchant_voicelines(voiceline_key)
	if(!length(lines))
		return
	for(var/mob/living/nearby_mob in view(voiceline_range, src))
		if(!nearby_mob.client)
			continue
		visible_message(SPAN_NOTICE("\The [src] says, \"[pick(lines)]\""))
		next_voiceline_time = world.time + voiceline_cooldown
		break

// Play the "arrival" animation if the icon has that state. Called by the spawner
// right after the body is created; a directly-mapped merchant just skips it.
/obj/structure/merchant/proc/animate_arrival()
	if(check_state_in_icon("arrival", icon))
		flick("arrival", src)

// Play the "leaving" animation, lock out trade, then delete the body. Idempotent.
/obj/structure/merchant/proc/depart_and_vanish()
	if(leaving)
		return
	leaving = TRUE
	set_density(FALSE)
	SSnano.close_uis(src) // Shoo anyone out of the trade window.
	if(check_state_in_icon("leaving", icon))
		flick("leaving", src)
		QDEL_IN(src, travel_anim_time)
	else
		qdel(src)

// Death: play "leaving" if the sheet has it, else "world-dead" if the sheet has it, else fall
// back to the default structure dismantle. Either way `leaving` locks out trade right away
/obj/structure/merchant/physically_destroyed(skip_qdel)
	if(leaving)
		return
	var/has_leaving_anim = check_state_in_icon("leaving", icon)
	var/has_dead_state = check_state_in_icon("world-dead", icon)
	if(!has_leaving_anim && !has_dead_state)
		return ..() // No world-dead state yet for this merchant; use the default structure dismantle.

	leaving = TRUE
	set_density(FALSE)
	SSnano.close_uis(src)

	if(has_leaving_anim)
		visible_message(SPAN_DANGER("\The [src] goes down, and is hastily dragged out of sight."))
		flick("leaving", src)
		addtimer(CALLBACK(src, PROC_REF(dismantle_structure)), travel_anim_time)
	else
		visible_message(SPAN_DANGER("\The [src] falls still."))
		icon_state = "world-dead"
		addtimer(CALLBACK(src, PROC_REF(dismantle_structure)), death_linger_time)

/obj/structure/merchant/attack_hand(mob/user)
	if(leaving || !CanPhysicallyInteract(user))
		return ..()
	ui_interact(user)
	return TRUE

// NanoUI refreshes (SSnano.update_uis) call ui_interact on the holder, not on the
// vendor datum - without this delegate the trade window would never re-render
// after it first opened, so stock counts would look frozen.
/obj/structure/merchant/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, datum/nanoui/master_ui = null, datum/topic_state/state = global.default_topic_state)
	return shop.ui_interact(user, ui_key, ui, force_open, master_ui, state)

/obj/structure/merchant/attackby(obj/item/W, mob/user)
	if(!leaving && shop.attackby(W, user))
		return TRUE
	return ..()

/obj/structure/merchant/OnTopic(mob/user, list/href_list, datum/topic_state/state)
	. = shop.OnTopic(user, href_list, state)
	if(. == TOPIC_NOACTION)
		return ..()


// /obj/abstract/landmark/merchant_post - optional timed come-and-go spawner.
// Place on the map where a merchant should appear. It spawns the merchant,
// leaves them for `present_time`, removes them for `absent_time`, then brings
// them back with freshly rolled stock and a full purse

/obj/abstract/landmark/merchant_post
	name = "merchant post"
	var/merchant_type = /obj/structure/merchant/roadside  // Merchant body to spawn here.
	var/present_time = 15 MINUTES    // How long the merchant stays each visit.
	var/absent_time = 10 MINUTES     // How long the spot sits empty between visits.
	var/first_delay = 1 MINUTE       // Wait before the first arrival, so posts don't all pop at once on roundstart
	var/start_present = FALSE        // Set to skip the opening wait and have the merchant present from the start
	var/obj/structure/merchant/active_merchant

/obj/abstract/landmark/merchant_post/Initialize()
	. = ..()
	if(. == INITIALIZE_HINT_QDEL)
		return
	addtimer(CALLBACK(src, PROC_REF(arrive)), start_present ? 1 : rand(first_delay, first_delay + absent_time))

/obj/abstract/landmark/merchant_post/Destroy()
	QDEL_NULL(active_merchant)
	return ..()

/obj/abstract/landmark/merchant_post/proc/arrive()
	if(QDELETED(src))
		return
	if(QDELETED(active_merchant))
		var/turf/T = get_turf(src)
		if(T)
			active_merchant = new merchant_type(T)
			active_merchant.animate_arrival()
			active_merchant.visible_message(SPAN_NOTICE("\The [active_merchant] arrives and lays out their wares."))
	else
		active_merchant.roll_stock() // Already here somehow - just refresh.
	addtimer(CALLBACK(src, PROC_REF(depart)), present_time)

/obj/abstract/landmark/merchant_post/proc/depart(retries = 3)
	if(QDELETED(src))
		return
	if(!QDELETED(active_merchant))
		// Don't yank the merchant out from under a deal, give extra time to finish
		var/datum/vendor/shop = active_merchant.shop
		if(retries > 0 && shop && (shop.currently_vending || shop.currently_buying || !shop.vend_ready))
			addtimer(CALLBACK(src, PROC_REF(depart), retries - 1), 1 MINUTE)
			return
		active_merchant.visible_message(SPAN_NOTICE("\The [active_merchant] packs up the blanket and trudges off."))
		active_merchant.depart_and_vanish() // Plays the "leaving" animation, then deletes itself.
		active_merchant = null
	addtimer(CALLBACK(src, PROC_REF(arrive)), absent_time)

#undef VENDOR_MAT_MULT_MIN
#undef VENDOR_MAT_MULT_MAX
#undef VENDOR_CONDITION_MULT_MIN
