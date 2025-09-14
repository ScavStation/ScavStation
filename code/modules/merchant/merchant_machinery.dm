/obj/machinery/merchant_pad
	name = "Teleportation Pad"
	desc = "Place things here to trade."
	icon = 'icons/obj/machines/teleporter.dmi'
	icon_state = "tele0"
	anchored = TRUE
	density = FALSE

	uncreated_component_parts = null
	construct_state = /decl/machine_construction/default/panel_closed

/obj/machinery/merchant_pad/proc/get_target()
	var/turf/T = get_turf(src)
	for(var/a in T)
		if(!is_valid_target(a))
			continue
		return a

/obj/machinery/merchant_pad/proc/get_targets()
	. = list()
	var/turf/T = get_turf(src)
	for(var/a in T)
		if(!is_valid_target(a))
			continue
		. += a

/obj/machinery/merchant_pad/proc/is_valid_target(atom/movable/thing)
	if(!istype(thing))
		return FALSE
	if(thing == src)
		return FALSE
	return thing.is_valid_merchant_pad_target()