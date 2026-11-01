/datum/merchant/books
	name = "Yinglet book merchant"

/datum/merchant/books/get_item_value(atom/movable/item, transaction_direction, mob/user)
  . = ..()
  if(istype(item, /obj/item/mollusc/clam))
  		. *= 50
