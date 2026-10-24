#include "casino_areas.dm"
#include "../mining/mining_areas.dm"

/obj/effect/overmap/visitable/ship/casino
	name = "passenger liner"
	desc = "Sensors detect an undamaged vessel without any signs of activity."
	color = "#bd6100"
	vessel_mass = 5000
	max_speed = 1/(2 SECONDS)
	instant_contact = TRUE
	burn_delay = 1 SECOND
	initial_generic_waypoints = list(
		"nav_casino_1",
		"nav_casino_2",
		"nav_casino_3",
		"nav_casino_4",
		"nav_casino_antag",
		"nav_casino_dock",
	)
	initial_restricted_waypoints = list(
		/datum/shuttle/autodock/overmap/casino_cutter = list("nav_casino_hangar"),
	)

/obj/effect/overmap/visitable/ship/casino/Initialize()
	name = "IPV [pick("Fortuna","Gold Rush","Ebisu","Lucky Paw","Four Leaves")], \a [name]"
	. = ..()

/datum/map_template/ruin/away_site/casino
	name = "Casino"
	description = "A casino ship!"
	suffixes = list("casino/casino.dmm")
	cost = 1
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/casino_cutter)
	area_usage_test_exempted_root_areas = list(/area/casino)
	template_flags = TEMPLATE_FLAG_TEST_DUPLICATES
	apc_test_exempt_areas = list(
		/area/casino/casino_hangar = NO_SCRUBBER,
		/area/casino/casino_cutter = NO_SCRUBBER|NO_VENT,
		/area/casino/casino_solar_control = NO_SCRUBBER|NO_VENT,
		/area/casino/casino_maintenance = NO_SCRUBBER|NO_VENT
	)

/obj/effect/shuttle_landmark/nav_casino/nav1
	name = "Casino Ship Navpoint #1"
	landmark_tag = "nav_casino_1"

/obj/effect/shuttle_landmark/nav_casino/nav2
	name = "Casino Ship Navpoint #2"
	landmark_tag = "nav_casino_2"

/obj/effect/shuttle_landmark/nav_casino/nav3
	name = "Casino Ship Navpoint #3"
	landmark_tag = "nav_casino_3"

/obj/effect/shuttle_landmark/nav_casino/nav4
	name = "Casino Ship Navpoint #4"
	landmark_tag = "nav_casino_4"

/obj/effect/shuttle_landmark/nav_casino/nav5
	name = "Casino Ship Navpoint #5"
	landmark_tag = "nav_casino_antag"


/obj/effect/shuttle_landmark/nav_casino/dock
	name = "Casino Ship Docking Port"
	landmark_tag = "nav_casino_dock"

/datum/shuttle/autodock/overmap/casino_cutter
	name = "Casino Cutter"
	warmup_time = 15
	move_time = 60
	shuttle_area = /area/casino/casino_cutter
	current_location = "nav_casino_hangar"
	landmark_transition = "nav_casino_transit"
	fuel_consumption = 0.5//it's small
	range = 1
	defer_initialisation = TRUE

/obj/effect/shuttle_landmark/nav_casino/cutter_hangar
	name = "Casino Hangar"
	landmark_tag = "nav_casino_hangar"
	base_area = /area/casino/casino_hangar
	base_turf = /turf/floor/plating

/obj/effect/shuttle_landmark/nav_casino/cutter_transit
	name = "In transit"
	landmark_tag = "nav_casino_transit"

/obj/machinery/computer/shuttle_control/explore/casino_cutter
	name = "cutter control console"
	shuttle_tag = "Casino Cutter"

// Standard European single-zero layout. 0 is green; everything else not listed here is black.
var/global/list/roulette_red_numbers = list(1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36)

// Total return per unit staked (stake included) for each bet type - i.e. "35 to 1" on a
// straight number is written here as 36 (you get your stake back plus 35x on top).
var/global/list/roulette_bet_payouts = list(
	"number" = 36,
	"color"  = 2,
	"parity" = 2,
	"range"  = 2
)

// One player's stake on one outcome. Multiple bets (even from the same player) can be active
// at once - a whole table's worth of people can bet on a single spin.
/datum/roulette_bet
	var/weakref/better_ref  // Who placed it - weak so a DC'd/gibbed player can't hold anything open.
	var/better_name         // Cached for messaging if better_ref no longer resolves.
	var/better_ckey         // Stable identity for the winnings ledger - survives death/relog
	var/bet_type            // "number", "color", "parity", "range"
	var/bet_value           // 0-36 / "red" or "black" / "even" or "odd" / "low" or "high"
	var/amount              // Absolute-worth staked
	var/currency            // /decl/currency path.

/datum/roulette_bet/proc/matches(n, result_color)
	if(n == 0 && bet_type != "number") // 0 loses every outside bet, same as a real table.
		return FALSE
	switch(bet_type)
		if("number")
			return n == bet_value
		if("color")
			return result_color == bet_value
		if("parity")
			return (n % 2 == 0) == (bet_value == "even")
		if("range")
			return (bet_value == "low") ? (n <= 18) : (n >= 19)
	return FALSE

/datum/roulette_bet/proc/describe()
	if(bet_type == "range")
		return (bet_value == "low") ? "1 to 18" : "19 to 36"
	return "[bet_value]"

/obj/structure/casino/roulette
	name = "roulette"
	desc = "Spin the roulette to try your luck."
	icon = 'maps/away/casino/casino_sprites.dmi'
	icon_state = "roulette_r"
	density = TRUE
	anchored = TRUE
	var/busy = FALSE
	var/currency // Currency this table deals in; bets in anything else are refused.
	var/list/active_bets = list() // Every active /datum/roulette_bet riding on the next spin.
	var/list/winnings_owed = list() // ckey = absolute-worth this player has won and not yet withdrawn.
	var/min_bet = 5
	var/max_bet = 500

/obj/structure/casino/roulette/Initialize()
	. = ..()
	if(!ispath(currency, /decl/currency))
		currency = global.using_map.default_currency

/obj/structure/casino/roulette/Destroy()
	QDEL_NULL_LIST(active_bets)
	. = ..()

// Insert cash or a charge-stick to place a bet before the next spin.
/obj/structure/casino/roulette/attackby(obj/item/W, mob/user)
	if(busy)
		to_chat(user, SPAN_WARNING("\The [src] is already spinning - no more bets."))
		return TRUE

	var/decl/currency/cur = GET_DECL(currency)
	var/obj/item/charge_stick/CS = W.GetChargeStick()
	var/available = 0
	if(CS)
		if(CS.currency != currency)
			to_chat(user, SPAN_WARNING("\The [src] doesn't take that currency."))
			return TRUE
		if(CS.is_locked())
			to_chat(user, SPAN_WARNING("Unlock \the [CS] first."))
			return TRUE
		// An unlocked stick automatically collects any standing winnings before betting continues.
		var/owed = winnings_owed[user.ckey]
		if(owed)
			CS.adjust_worth(owed)
			winnings_owed -= user.ckey
			to_chat(user, SPAN_NOTICE("You collect [cur.format_value(owed)] in winnings onto \the [CS]."))
		available = CS.loaded_worth
	else if(istype(W, /obj/item/cash))
		var/obj/item/cash/cash = W
		if(cash.currency != currency)
			to_chat(user, SPAN_WARNING("\The [src] doesn't take that currency."))
			return TRUE
		available = cash.absolute_worth
	else
		return ..()

	if(available < min_bet)
		to_chat(user, SPAN_WARNING("You need at least [cur.format_value(min_bet)] to place a bet."))
		return TRUE

	var/bet_choice = input(user, "What do you want to bet on?", "Place a Bet") as null|anything in list("A number", "Red", "Black", "Even", "Odd", "1 to 18", "19 to 36")
	if(!bet_choice || busy)
		return TRUE

	var/bet_type, bet_value
	switch(bet_choice)
		if("A number")
			var/n = input(user, "Which number (0-36)?", "Place a Bet", 0) as null|num
			if(isnull(n) || n < 0 || n > 36)
				return TRUE
			bet_type = "number"
			bet_value = round(n)
		if("Red", "Black")
			bet_type = "color"
			bet_value = lowertext(bet_choice)
		if("Even", "Odd")
			bet_type = "parity"
			bet_value = lowertext(bet_choice)
		if("1 to 18")
			bet_type = "range"
			bet_value = "low"
		if("19 to 36")
			bet_type = "range"
			bet_value = "high"

	var/cap = min(available, max_bet)
	var/amount = input(user, "How much do you want to bet? (from [min_bet] to [cap])", "Place a Bet", cap) as null|num
	if(isnull(amount) || busy)
		return TRUE
	amount = round(clamp(amount, min_bet, cap))

	// Re-check everything live - both dialogs above can sit open a long time, during which
	// the item could be spent elsewhere, deleted, or the wheel could have started spinning.
	if(busy || QDELETED(W))
		return TRUE
	if(CS)
		if(CS.loaded_worth < amount)
			to_chat(user, SPAN_WARNING("\The [CS] doesn't have that much on it anymore."))
			return TRUE
		CS.adjust_worth(-amount)
	else
		var/obj/item/cash/cash = W
		if(QDELETED(cash) || cash.absolute_worth < amount)
			to_chat(user, SPAN_WARNING("\The [W] isn't worth that much anymore."))
			return TRUE
		if(amount >= cash.absolute_worth)
			if(!user.try_unequip(W))
				return TRUE
			qdel(cash)
		else
			cash.adjust_worth(-amount)

	var/datum/roulette_bet/bet = new
	bet.better_ref = weakref(user)
	bet.better_name = user.name
	bet.better_ckey = user.ckey
	bet.bet_type = bet_type
	bet.bet_value = bet_value
	bet.amount = amount
	bet.currency = currency
	LAZYADD(active_bets, bet) // active_bets goes back to null after every resolved spin (QDEL_NULL_LIST) - plain += would crash on the next round's first bet.

	to_chat(user, SPAN_NOTICE("You place a bet of [cur.format_value(amount)] on [bet.describe()]."))
	visible_message(SPAN_NOTICE("\The [user] places a bet on \the [src]."))
	return TRUE

/obj/structure/casino/roulette/attack_hand(mob/user)

	if(user.a_intent == I_HURT || !user.check_dexterity(DEXTERITY_SIMPLE_MACHINES, TRUE))
		return ..()

	if(busy)
		to_chat(user, SPAN_WARNING("\The [src] is already spinning."))
		return TRUE

	visible_message(SPAN_NOTICE("\The [user] spins \the [src] and tosses the ball inside."))
	busy = TRUE
	var/n = rand(0,36)
	var/result_color
	if(n == 0)
		result_color = "green"
	else if(n in global.roulette_red_numbers)
		result_color = "red"
	else
		result_color = "black"
	add_fingerprint(user)
	announce_result(n, result_color)
	return TRUE

/obj/structure/casino/roulette/proc/announce_result(n, result_color)
	set waitfor = FALSE
	sleep(5 SECONDS)
	visible_message("<span class='notice'>\The [src] stops spinning, the ball landing on [n], [result_color].</span>")
	resolve_bets(n, result_color)
	busy = FALSE

// Pay out (or clear) every bet riding on this spin, individually, by whoever placed it.
// Winnings are credited to a per-player ledger rather than dropped as loose charge-sticks
/obj/structure/casino/roulette/proc/resolve_bets(n, result_color)
	if(!length(active_bets))
		return
	var/decl/currency/cur = GET_DECL(currency)
	for(var/datum/roulette_bet/bet as anything in active_bets)
		var/mob/living/better = bet.better_ref?.resolve()
		if(bet.matches(n, result_color))
			var/payout = bet.amount * global.roulette_bet_payouts[bet.bet_type]
			winnings_owed[bet.better_ckey] = (winnings_owed[bet.better_ckey] || 0) + payout
			if(better && !QDELETED(better))
				to_chat(better, SPAN_NOTICE("Your bet on [bet.describe()] wins! [cur.format_value(payout)] is waiting for you at \the [src] - use Collect Winnings to claim it."))
			visible_message(SPAN_NOTICE("[bet.better_name]'s bet on [bet.describe()] wins [cur.format_value(payout)]!"))
		else if(better && !QDELETED(better))
			to_chat(better, SPAN_WARNING("Your bet on [bet.describe()] doesn't win."))
	QDEL_NULL_LIST(active_bets)

// Withdraw whatever the calling player is personally owed onto their held charge-stick if they're holding one, otherwise a freshly dispensed one.
/obj/structure/casino/roulette/verb/collect_winnings()
	set name = "Collect Winnings"
	set category = "Object"
	set src in oview(1)

	if(!isliving(usr) || !CanPhysicallyInteract(usr))
		return

	var/owed = winnings_owed[usr.ckey]
	if(!owed)
		to_chat(usr, SPAN_WARNING("\The [src] doesn't owe you anything."))
		return

	var/decl/currency/cur = GET_DECL(currency)
	var/obj/item/charge_stick/held = usr.get_active_held_item()?.GetChargeStick()
	if(held)
		if(held.is_locked())
			to_chat(usr, SPAN_WARNING("Unlock \the [held] first."))
			return
		if(held.currency != currency)
			to_chat(usr, SPAN_WARNING("\The [held] doesn't take that currency."))
			return
		held.adjust_worth(owed)
		to_chat(usr, SPAN_NOTICE("You load [cur.format_value(owed)] onto \the [held]."))
	else
		var/obj/item/charge_stick/payout = new(get_turf(src))
		payout.currency = currency
		payout.update_name_desc()
		payout.adjust_worth(owed)
		usr.put_in_hands(payout)
		to_chat(usr, SPAN_NOTICE("\The [src] hands you a charge-stick loaded with [cur.format_value(owed)]."))
	winnings_owed -= usr.ckey

/obj/structure/casino/roulette_chart
	name = "roulette chart"
	desc = "Roulette chart. Place your bets! "
	icon = 'maps/away/casino/casino_sprites.dmi'
	icon_state = "roulette_l"
	density = TRUE
	anchored = TRUE

// Feed it cash or a charge-stick to load money in. Alt-click it, or use the "Spin"
// entry from its right-click menu, to pull the arm. Left-click cashes out
// whatever's currently loaded as a fresh charge-stick, or into current credstick if holding one.
/obj/structure/casino/oh_bandit
	name = "one armed bandit"
	desc = "A coin-operated slot machine. Feed it money, then give the arm a pull."
	icon = 'maps/away/casino/casino_sprites.dmi'
	icon_state = "slot_machine"
	density = TRUE
	anchored = TRUE

	var/currency // Currency this machine deals in - sales/payouts in any other currency are refused.
	var/pool = 0 // Absolute-worth currently loaded
	var/bet_amount = 10 // Cost of a single pull, same unit as pool.
	var/busy = FALSE // TRUE while the reels are "spinning" - blocks another pull or a cash-out.
	var/static/list/reel_symbols = list("cherry", "bell", "star", "bar", "lemon", "seven") // Cosmetic reel symbols, purely for flavor text.
	/// Spin outcome = relative odds of landing on it. Tune freely; doesn't need to add to 100.
	var/static/list/payout_odds = list(
		"jackpot"   = 2,
		"big win"   = 6,
		"small win" = 17,
		"push"      = 20,
		"bust"      = 55
	)
	/// Spin outcome = payout as a multiple of bet_amount. 0 = the bet is simply lost.
	var/static/list/payout_multipliers = list(
		"jackpot"   = 10,
		"big win"   = 5,
		"small win" = 2,
		"push"      = 1,
		"bust"      = 0
	)

/obj/structure/casino/oh_bandit/Initialize()
	. = ..()
	if(!ispath(currency, /decl/currency))
		currency = global.using_map.default_currency

/obj/structure/casino/oh_bandit/examine(mob/user, distance)
	. = ..()
	if(distance <= 3)
		var/decl/currency/cur = GET_DECL(currency)
		to_chat(user, SPAN_NOTICE("It holds [cur.format_value(pool)]. A pull costs [cur.format_value(bet_amount)]."))

// Insert money.
/obj/structure/casino/oh_bandit/attackby(obj/item/W, mob/user)
	var/decl/currency/cur = GET_DECL(currency)
	var/obj/item/charge_stick/CS = W.GetChargeStick()

	if(CS)
		if(CS.currency != currency)
			to_chat(user, SPAN_WARNING("\The [src] doesn't take that currency."))
			return TRUE
		// An empty stick used against a machine that's actually holding a payout reads as
		// "cash me out", not "deposit nothing" - so try that first instead of dead-ending here.
		if(CS.loaded_worth <= 0 && pool > 0)
			return withdraw_into(CS, user)
		if(CS.loaded_worth <= 0)
			to_chat(user, SPAN_WARNING("\The [CS] doesn't have any funds loaded, and \the [src] has nothing to give you either."))
			return TRUE
		if(CS.is_locked())
			to_chat(user, SPAN_WARNING("Unlock \the [CS] first."))
			return TRUE
		var/amount = CS.loaded_worth
		CS.adjust_worth(-amount)
		pool += amount
		to_chat(user, SPAN_NOTICE("You feed [cur.format_value(amount)] from \the [CS] into \the [src]. It now holds [cur.format_value(pool)]."))
		return TRUE

	if(istype(W, /obj/item/cash))
		var/obj/item/cash/cash = W
		if(cash.currency != currency)
			to_chat(user, SPAN_WARNING("\The [src] doesn't take that currency."))
			return TRUE
		if(!user.try_unequip(W))
			return TRUE
		pool += cash.absolute_worth
		to_chat(user, SPAN_NOTICE("You feed \the [cash] into \the [src]. It now holds [cur.format_value(pool)]."))
		playsound(loc, 'sound/effects/coin_flip.ogg', 50, 1)
		qdel(cash)
		return TRUE

	return ..()

// Plain left-click: cash out.
/obj/structure/casino/oh_bandit/attack_hand(mob/user)
	if(user.a_intent == I_HURT || !user.check_dexterity(DEXTERITY_SIMPLE_MACHINES, TRUE))
		return ..()
	if(busy)
		to_chat(user, SPAN_WARNING("\The [src] is still spinning."))
		return TRUE
	if(pool <= 0)
		to_chat(user, SPAN_WARNING("\The [src] is empty."))
		return TRUE

	// Holding a charge-stick already? Empty straight into that instead of dispensing a new one.
	var/obj/item/charge_stick/held = user.get_active_held_item()?.GetChargeStick()
	if(held)
		return withdraw_into(held, user)

	var/decl/currency/cur = GET_DECL(currency)
	var/obj/item/charge_stick/payout = new(get_turf(src))
	payout.currency = currency
	payout.update_name_desc()
	payout.adjust_worth(pool)
	user.put_in_hands(payout)
	visible_message(SPAN_NOTICE("\The [src] dispenses a charge-stick loaded with [cur.format_value(pool)]."))
	pool = 0
	return TRUE

// Shared cash-out path for an existing charge-stick, used by both a bare-handed click while
// holding one and an empty stick fed in via attackby; same rules and messaging either way.
/obj/structure/casino/oh_bandit/proc/withdraw_into(obj/item/charge_stick/CS, mob/user)
	if(busy)
		to_chat(user, SPAN_WARNING("\The [src] is still spinning."))
		return TRUE
	if(pool <= 0)
		to_chat(user, SPAN_WARNING("\The [src] is empty."))
		return TRUE
	if(CS.is_locked())
		to_chat(user, SPAN_WARNING("Unlock \the [CS] first."))
		return TRUE
	if(CS.currency != currency)
		to_chat(user, SPAN_WARNING("\The [CS] doesn't take that currency."))
		return TRUE

	var/decl/currency/cur = GET_DECL(currency)
	CS.adjust_worth(pool)
	visible_message(SPAN_NOTICE("\The [src] empties [cur.format_value(pool)] into \the [CS]."))
	pool = 0
	return TRUE

// Alt-click to spin.
/obj/structure/casino/oh_bandit/AltClick(mob/user)
	if(!CanPhysicallyInteract(user))
		return ..()
	do_spin(user)

// Same action via the right-click verb menu.
/obj/structure/casino/oh_bandit/verb/spin()
	set name = "Spin"
	set category = "Object"
	set src in oview(1)

	if(!isliving(usr) || !CanPhysicallyInteract(usr))
		return
	do_spin(usr)

/obj/structure/casino/oh_bandit/proc/do_spin(mob/user)
	if(user.a_intent == I_HURT || !user.check_dexterity(DEXTERITY_SIMPLE_MACHINES, TRUE))
		return
	if(busy)
		to_chat(user, SPAN_WARNING("\The [src] is still spinning."))
		return
	var/decl/currency/cur = GET_DECL(currency)
	if(pool < bet_amount)
		to_chat(user, SPAN_WARNING("\The [src] needs at least [cur.format_value(bet_amount)] loaded to pull the arm."))
		return

	busy = TRUE
	pool -= bet_amount
	add_fingerprint(user)
	visible_message(SPAN_NOTICE("\The [user] pulls the arm on \the [src]. The reels spin..."))
	playsound(loc, 'sound/machines/button1.ogg', 50, 1)
	addtimer(CALLBACK(src, PROC_REF(resolve_spin)), 2 SECONDS)

/obj/structure/casino/oh_bandit/proc/resolve_spin()
	if(QDELETED(src))
		return
	busy = FALSE
	var/outcome = pickweight(payout_odds.Copy())
	var/multiplier = payout_multipliers[outcome]
	var/payout = bet_amount * multiplier
	pool += payout

	var/decl/currency/cur = GET_DECL(currency)
	var/reels = "[pick(reel_symbols)] - [pick(reel_symbols)] - [pick(reel_symbols)]"
	switch(outcome)
		if("jackpot")
			playsound(loc, 'sound/weapons/gunshot/money_launcher_jackpot.ogg', 75, 1)
			visible_message(SPAN_NOTICE("\The [src]'s reels land on [reels] - JACKPOT! It pays out [cur.format_value(payout)]!"))
		if("big win")
			visible_message(SPAN_NOTICE("\The [src]'s reels land on [reels] - a big win of [cur.format_value(payout)]!"))
		if("small win")
			visible_message(SPAN_NOTICE("\The [src]'s reels land on [reels] - a small win of [cur.format_value(payout)]."))
		if("push")
			visible_message(SPAN_NOTICE("\The [src]'s reels land on [reels] - just enough to break even."))
		else
			visible_message(SPAN_WARNING("\The [src]'s reels land on [reels] - nothing. Better luck next time."))
	visible_message(SPAN_NOTICE("\The [src] now holds [cur.format_value(pool)]."))

 // TODO: add functionality to these
/obj/structure/casino/bj_table
	name = "blackjack table"
	desc = "This is a blackjack table. "
	icon = 'maps/away/casino/casino_sprites.dmi'
	icon_state = "bj_left"
	density = FALSE
	anchored = TRUE

/obj/structure/casino/bj_table/bj_right
	icon_state = "bj_right"

/obj/structure/casino/craps
	name = "craps table"
	desc = "Craps table: roll dice!"
	icon = 'maps/away/casino/casino_sprites.dmi'
	icon_state = "craps_top"
	density = FALSE
	anchored = TRUE

/obj/structure/casino/craps/craps_down
	icon_state = "craps_down"

//========================used bullet casings=======================
/obj/item/ammo_casing/rifle/used/Initialize()
	. = ..()
	expend()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)


/obj/item/ammo_casing/pistol/used/Initialize()
	. = ..()
	expend()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)

/obj/item/ammo_casing/pistol/magnum/used/Initialize()
	. = ..()
	expend()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)
