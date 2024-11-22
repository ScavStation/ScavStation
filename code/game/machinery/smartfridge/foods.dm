/obj/machinery/smartfridge/foods
	name = "\improper Hot Foods Display"
	desc = "A heated storage unit for piping hot meals."
	icon = 'icons/obj/machines/smartfridges/food.dmi'
	overlay_contents_icon = 'icons/obj/machines/smartfridges/contents_food.dmi'

/obj/machinery/smartfridge/foods/accept_check(var/obj/item/O)
	if(istype(O,/obj/item/food) || istype(O,/obj/item/utensil))
		return 1
