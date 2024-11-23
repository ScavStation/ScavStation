/obj/machinery/smartfridge/produce
	name = "produce smartfridge"
	desc = "A refrigerated storage unit for fruits and vegetables."

/obj/machinery/smartfridge/produce/accept_check(var/obj/item/O)
	return istype(O, /obj/item/food/grown)
