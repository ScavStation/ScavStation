/obj/machinery/vending/medical/Initialize()
//	products = products || list()
	products -= /obj/item/chems/glass/bottle/sedatives
//	products[/obj/item/chems/glass/bottle/sedatives] = products[/obj/item/chems/glass/bottle/sedatives] || 1
	. = ..()

/obj/machinery/vending/medical/Initialize()
//	products = products || list()
	products -= /obj/item/chems/glass/bottle/bromide
	. = ..()

