/obj/machinery/smartfridge/foods
	name = "\improper Hot Foods Display"
	desc = "A heated storage unit for piping hot meals."
	icon = 'icons/obj/machines/smartfridges/food.dmi'
	overlay_contents_icon = 'icons/obj/machines/smartfridges/contents_food.dmi'

/obj/machinery/smartfridge/foods/accept_check(var/obj/item/O)
	var/static/list/_food_types = list(
		/obj/item/food,
		/obj/item/utensil,
		/obj/item/chems/glass/bowl,
		/obj/item/chems/glass/handmade/bowl
	)
	return istype(O) && O.reagents?.total_volume && is_type_in_list(O, _food_types)
