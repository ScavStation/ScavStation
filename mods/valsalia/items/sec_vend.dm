/obj/machinery/vending/security/Initialize()
	products = products || list()
	products[/obj/item/clothing/suit/jacket/redcoat/officer] = products[/obj/item/clothing/suit/jacket/redcoat/officer] || 4
	. = ..()
/obj/machinery/vending/security/Initialize()
	products = products || list()
	products[/obj/item/mollusc] = products[/obj/item/mollusc] || 8
	products -= /obj/item/food/donut
	. = ..()
/obj/machinery/vending/security/Initialize()
	products = products || list()
	products[/obj/item/flashlight/maglight] = products[/obj/item/flashlight/maglight] || 6
	. = ..()
/obj/machinery/vending/security/Initialize()
	products = products || list()
	products[/obj/item/radio/headset/headset_sec] = products[/obj/item/radio/headset/headset_sec] || 4
	. = ..()


