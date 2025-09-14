
/obj/machinery/smartfridge/secure/medbay
	name = "\improper Refrigerated Medicine Storage"
	desc = "A refrigerated storage unit for storing medicine and chemicals."
	overlay_contents_icon = 'icons/obj/machines/smartfridges/contents_chem.dmi'
	initial_access = list(list(access_medical, access_chemistry))

/obj/machinery/smartfridge/secure/medbay/accept_check(var/obj/item/O)
	if(istype(O,/obj/item/chems/glass))
		return 1
	if(istype(O,/obj/item/pill_bottle))
		return 1
	if(istype(O,/obj/item/chems/pill))
		return 1
	return 0
