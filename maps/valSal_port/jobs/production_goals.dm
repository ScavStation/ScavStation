var/global/list/valSal_port_produce_bins = list()
var/global/list/valSal_port_game_bins = list()
var/global/list/valSal_port_resource_bins = list()

/obj/structure/storage_bin/valSal_port
	abstract_type = /obj/structure/storage_bin/valSal_port
	icon = 'icons/obj/closets/bases/crate.dmi' // placeholder art
	icon_state = "crate"
	density = TRUE
	anchored = TRUE
	material = /decl/material/solid/organic/wood
	var/accepted_material
	var/deposited_count = 0
	var/goal_type

/obj/structure/storage_bin/valSal_port/attackby(obj/item/I, mob/user)
	var/deposit_value = get_deposit_value(I)
	if(deposit_value)
		if(!user.try_unequip(I, src))
			return TRUE
		qdel(I)
		deposited_count += deposit_value
		to_chat(user, SPAN_NOTICE("You add \the [I] to \the [src]. [get_progress_string()]"))
		return TRUE
	return ..()

/obj/structure/storage_bin/valSal_port/proc/get_deposit_value(obj/item/I)
	if(accepted_material && istype(I.material, accepted_material))
		return 1
	return null

/obj/structure/storage_bin/valSal_port/proc/get_progress_string()
	var/datum/goal/department/valSal_port/deposit_count/goal = find_matching_goal()
	if(goal)
		return "([deposited_count]/[goal.required_amount] stored)"
	return "([deposited_count] stored)"

// Searches every department's active goals for one matching type_override (or goal_type if not given),
// since goals are randomly picked each round and may not be the one currently running for this bin.
/obj/structure/storage_bin/valSal_port/proc/find_matching_goal(var/type_override)
	var/search_type = type_override || goal_type
	if(!search_type)
		return null
	for(var/decl/department/dept as anything in decls_repository.get_decls_of_type_unassociated(/decl/department))
		. = locate(search_type) in dept.goals
		if(.)
			return

/obj/structure/storage_bin/valSal_port/produce
	name = "produce bin"
	desc = "A woven bin for storing the enclave's harvested crops."
	icon = 'icons/obj/structures/produce_bin.dmi'
	icon_state = ICON_STATE_WORLD
	accepted_material = /decl/material/solid/organic/plantmatter
	goal_type = /datum/goal/department/valSal_port/deposit_count/produce

/obj/structure/storage_bin/valSal_port/produce/Initialize()
	. = ..()
	LAZYADD(global.valSal_port_produce_bins, src)

/obj/structure/storage_bin/valSal_port/produce/Destroy()
	LAZYREMOVE(global.valSal_port_produce_bins, src)
	return ..()

/obj/structure/storage_bin/valSal_port/game
	name = "game bin"
	desc = "A sturdy bin for storing the enclave's hunted meat and fish. Only accepts haunches, slabs, chunks, and fillets of meat."
	icon = 'icons/obj/structures/produce_bin.dmi'
	icon_state = ICON_STATE_WORLD
	goal_type = /datum/goal/department/valSal_port/deposit_count/game
	var/haunch_value = 4
	var/fillet_value = 3
	var/slab_value   = 2
	var/chunk_value  = 1

/obj/structure/storage_bin/valSal_port/game/get_deposit_value(obj/item/I)
	if(istype(I, /obj/item/food/butchery/haunch))
		return haunch_value
	if(istype(I, /obj/item/food/butchery/meat/fish))
		return fillet_value
	if(istype(I, /obj/item/food/butchery/meat))
		return slab_value
	if(istype(I, /obj/item/food/butchery/cutlet))
		return chunk_value
	return null

/obj/structure/storage_bin/valSal_port/game/Initialize()
	. = ..()
	LAZYADD(global.valSal_port_game_bins, src)

/obj/structure/storage_bin/valSal_port/game/Destroy()
	LAZYREMOVE(global.valSal_port_game_bins, src)
	return ..()

// Tracks wood and ore separately, since they're two distinct goals sharing one bin.
/obj/structure/storage_bin/valSal_port/resource
	name = "resource bin"
	desc = "A stout bin for storing the enclave's gathered wood and ore. Only accepts raw logs (not planks) and ore (not coal)."
	icon = 'icons/obj/structures/produce_bin.dmi'
	icon_state = ICON_STATE_WORLD
	var/wood_deposited = 0
	var/ore_deposited = 0
	var/wood_value = 1
	var/list/ore_values = list(
		/obj/item/stack/material/ore/iron        = 1,
		/obj/item/stack/material/ore/aluminium   = 1,
		/obj/item/stack/material/ore/rutile      = 1,
		/obj/item/stack/material/ore/galena      = 1,
		/obj/item/stack/material/ore/phosphorite = 1,
		/obj/item/stack/material/ore/slag        = 1,
		/obj/item/stack/material/ore/silver      = 2,
		/obj/item/stack/material/ore/gold        = 3,
		/obj/item/stack/material/ore/osmium      = 3,
		/obj/item/stack/material/ore/uranium     = 3,
		/obj/item/stack/material/ore/diamond     = 4
	)
	var/default_ore_value = 1

/obj/structure/storage_bin/valSal_port/resource/Initialize()
	. = ..()
	LAZYADD(global.valSal_port_resource_bins, src)

/obj/structure/storage_bin/valSal_port/resource/Destroy()
	LAZYREMOVE(global.valSal_port_resource_bins, src)
	return ..()

/obj/structure/storage_bin/valSal_port/resource/attackby(obj/item/I, mob/user)
	var/is_wood = istype(I, /obj/item/stack/material/log)
	var/is_ore  = !is_wood && istype(I, /obj/item/stack/material/ore) && !istype(I, /obj/item/stack/material/ore/coal)
	if(!is_wood && !is_ore)
		return ..()
	var/obj/item/stack/material/stack = I
	var/units = stack.get_amount()
	if(!units || !user.try_unequip(I, src))
		return TRUE
	qdel(I)
	if(is_wood)
		wood_deposited += units * wood_value
	else
		ore_deposited += units * (ore_values[I.type] || default_ore_value)
	to_chat(user, SPAN_NOTICE("You add \the [I] to \the [src]. [get_progress_string()]"))
	return TRUE

/obj/structure/storage_bin/valSal_port/resource/get_progress_string()
	var/datum/goal/department/valSal_port/deposit_count/wood/wood_goal = find_matching_goal(/datum/goal/department/valSal_port/deposit_count/wood)
	var/datum/goal/department/valSal_port/deposit_count/ore/ore_goal = find_matching_goal(/datum/goal/department/valSal_port/deposit_count/ore)
	var/wood_str = wood_goal ? "[wood_deposited]/[wood_goal.required_amount] wood" : "[wood_deposited] wood"
	var/ore_str = ore_goal ? "[ore_deposited]/[ore_goal.required_amount] ore" : "[ore_deposited] ore"
	return "([wood_str], [ore_str] stored)"

// Goals that check a running deposit tally against every bin of the matching type on the map.
/datum/goal/department/valSal_port/deposit_count
	abstract_type = /datum/goal/department/valSal_port/deposit_count
	var/required_amount
	var/noun_singular
	var/noun_plural
	var/verb = "store"

/datum/goal/department/valSal_port/deposit_count/proc/get_deposited_count()
	return 0

/datum/goal/department/valSal_port/deposit_count/update_strings()
	description = "[capitalize(verb)] at least [required_amount] [required_amount == 1 ? noun_singular : noun_plural] this shift."

/datum/goal/department/valSal_port/deposit_count/get_summary_value()
	return " ([get_deposited_count()]/[required_amount] [noun_plural])"

/datum/goal/department/valSal_port/deposit_count/check_success()
	return get_deposited_count() >= required_amount

/datum/goal/department/valSal_port/deposit_count/produce
	noun_singular = "plant"
	noun_plural   = "plants"
	verb          = "grow and store"

/datum/goal/department/valSal_port/deposit_count/produce/New()
	required_amount = rand(35, 50)
	..()

/datum/goal/department/valSal_port/deposit_count/produce/get_deposited_count()
	. = 0
	for(var/obj/structure/storage_bin/valSal_port/produce/B in global.valSal_port_produce_bins)
		. += B.deposited_count

/datum/goal/department/valSal_port/deposit_count/game
	noun_singular = "point"
	noun_plural   = "points"
	verb          = "hunt and store"

/datum/goal/department/valSal_port/deposit_count/game/New()
	required_amount = rand(20, 32)
	..()

/datum/goal/department/valSal_port/deposit_count/game/get_deposited_count()
	. = 0
	for(var/obj/structure/storage_bin/valSal_port/game/B in global.valSal_port_game_bins)
		. += B.deposited_count

/datum/goal/department/valSal_port/deposit_count/wood
	noun_singular = "wood"
	noun_plural   = "wood"
	verb          = "gather and store"

/datum/goal/department/valSal_port/deposit_count/wood/New()
	required_amount = rand(40, 60)
	..()

/datum/goal/department/valSal_port/deposit_count/wood/get_deposited_count()
	. = 0
	for(var/obj/structure/storage_bin/valSal_port/resource/B in global.valSal_port_resource_bins)
		. += B.wood_deposited

/datum/goal/department/valSal_port/deposit_count/ore
	noun_singular = "ore"
	noun_plural   = "ore"
	verb          = "mine and store"

/datum/goal/department/valSal_port/deposit_count/ore/New()
	required_amount = rand(20, 35)
	..()

/datum/goal/department/valSal_port/deposit_count/ore/get_deposited_count()
	. = 0
	for(var/obj/structure/storage_bin/valSal_port/resource/B in global.valSal_port_resource_bins)
		. += B.ore_deposited
