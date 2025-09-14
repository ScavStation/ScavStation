/obj/machinery/smartfridge/chemistry
	name = "\improper Smart Chemical Storage"
	desc = "A refrigerated storage unit for medicine and chemical storage."
	overlay_contents_icon = 'icons/obj/machines/smartfridges/contents_chem.dmi'

/obj/machinery/smartfridge/chemistry/accept_check(var/obj/item/O)
	if(istype(O,/obj/item/pill_bottle) || istype(O,/obj/item/chems))
		return 1
	return 0
