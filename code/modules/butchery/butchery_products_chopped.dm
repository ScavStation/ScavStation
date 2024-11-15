/obj/item/food/butchery/chopped
	name          = "chopped meat"
	desc          = "A handful of chopped meat."
	icon          = 'icons/obj/food/butchery/chopped.dmi'
	bitesize      = 2
	nutriment_amt = 1
	w_class       = ITEM_SIZE_TINY
	filling_color = "#ff1c1c"
	slice_path    = null
	slice_num     = 0 // null means autoset, 0 means none

/obj/item/food/butchery/chopped/set_meat_name(new_meat_name)
	meat_name = new_meat_name
	if(cooked_food == FOOD_RAW)
		SetName("chopped raw [new_meat_name]")
	else
		SetName("chopped [new_meat_name]")
