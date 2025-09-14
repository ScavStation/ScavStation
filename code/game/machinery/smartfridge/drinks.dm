/obj/machinery/smartfridge/drinks
	name = "\improper Drink Showcase"
	desc = "A refrigerated storage unit for tasty tasty alcohol."
	icon = 'icons/obj/machines/smartfridges/dark.dmi'
	overlay_contents_icon = 'icons/obj/machines/smartfridges/contents_drink.dmi'

/obj/machinery/smartfridge/drinks/accept_check(var/obj/item/O)
	if(istype(O,/obj/item/chems/glass) || istype(O,/obj/item/chems/drinks) || istype(O,/obj/item/chems/condiment))
		return 1
