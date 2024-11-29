/obj/machinery/smartfridge/seeds
	name = "\improper MegaSeed Servitor"
	desc = "When you need seeds fast!"

/obj/machinery/smartfridge/seeds/accept_check(var/obj/item/O)
	if(istype(O,/obj/item/seeds/))
		return 1
	return 0
