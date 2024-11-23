/obj/machinery/smartfridge/drying_oven
	name = "drying oven"
	desc = "A machine for drying plants."
	icon = 'icons/obj/machines/smartfridges/drying_oven.dmi'
	overlay_contents_icon = 'icons/obj/machines/smartfridges/contents_plants.dmi'
	obj_flags = OBJ_FLAG_ANCHORABLE
	atom_flags = ATOM_FLAG_CLIMBABLE

/obj/machinery/smartfridge/drying_oven/accept_check(var/obj/item/O)
	return istype(O) && O.is_dryable()

/obj/machinery/smartfridge/drying_oven/Process()
	..()
	if(inoperable())
		return
	var/do_update = FALSE
	for(var/obj/item/thing in get_contained_external_atoms())
		var/obj/item/product = thing.dry_out(src, silent = TRUE)
		if(product)
			product.dropInto(loc)
			do_update = TRUE
			if(QDELETED(thing) || !(thing in contents))
				for(var/datum/stored_items/I in item_records)
					I.instances -= thing
	if(do_update)
		update_icon()

/obj/machinery/smartfridge/drying_oven/on_update_icon()
	if(!inoperable())
		for(var/datum/stored_items/I in item_records)
			if(I.get_amount())
				cut_overlays()
				icon_state = "[initial(icon_state)]-closed"
				return
	return ..()
