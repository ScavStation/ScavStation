/obj/machinery/smartfridge/sheets
	name = "raw material storage"
	desc = "A storage unit for bundles of material sheets, ingots and other shapes."

/obj/machinery/smartfridge/sheets/accept_check(var/obj/item/O)
	return istype(O, /obj/item/stack/material)
