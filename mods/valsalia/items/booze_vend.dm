/obj/machinery/vending/boozeomat/Initialize()
	products = products || list()
	products[/obj/item/chems/drinks/bottle/agedwhiskey] = products[/obj/item/chems/drinks/bottle/agedwhiskey] || 5
	. = ..()
