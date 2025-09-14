/obj/structure/fire_source/kiln
	name = "kiln"
	desc = "A hulking oven intended for firing clay or melting ore."
	icon = 'icons/obj/structures/kiln.dmi'
	icon_state = ICON_STATE_WORLD
	density = TRUE
	cap_last_fuel_burn = null

	var/list/pottery
	var/maximum_items = 3
	var/firebox_open = TRUE

/obj/structure/fire_source/kiln/oven
	name = "oven"
	desc = "A hulking oven intended for baking and cooking."

/obj/structure/fire_source/kiln/high_temperature
	material = /decl/material/solid/stone/pottery

/obj/structure/fire_source/kiln/Exited(atom/movable/thing)
	. = ..()
	LAZYREMOVE(pottery, thing)

/obj/structure/fire_source/kiln/get_removable_atoms()
	. = pottery?.Copy() || list()
	if(firebox_open)
		. |= ..()

/obj/structure/fire_source/kiln/on_update_icon()
	. = ..()
	if(!firebox_open)
		add_overlay("[icon_state]_door")

/obj/structure/fire_source/kiln/get_fire_exposed_atoms()
	. = get_contained_external_atoms()
	if(firebox_open)
		var/other = ..()
		if(length(other))
			LAZYDISTINCTADD(., other)

/obj/structure/fire_source/kiln/attackby(obj/item/used_item, mob/user)
	if(firebox_open)
		return ..()
	if(length(pottery) >= maximum_items)
		to_chat(user, SPAN_WARNING("\The [src] is full, take something out first."))
	else if(user.try_unequip(used_item, src))
		user.visible_message("\The [user] slides \the [used_item] into \the [src].")
		LAZYADD(pottery, used_item)
	return TRUE

/obj/structure/fire_source/kiln/get_alt_interactions(var/mob/user)
	. = ..()
	LAZYADD(., /decl/interaction_handler/open_firebox)

/decl/interaction_handler/open_firebox
	name = "Open Firebox"
	expected_target_type = /obj/structure/fire_source/kiln
	incapacitation_flags = INCAPACITATION_DISRUPTED

/decl/interaction_handler/open_firebox/is_possible(atom/target, mob/user, obj/item/prop)
	. = ..() && ishuman(user)

/decl/interaction_handler/open_firebox/invoked(atom/target, mob/user, obj/item/prop)
	var/obj/structure/fire_source/kiln/kiln = target
	kiln.firebox_open = !kiln.firebox_open
	to_chat(usr, SPAN_NOTICE("You [kiln.firebox_open ? "open" : "close"] \the [kiln]'s firebox."))
	kiln.update_icon()
