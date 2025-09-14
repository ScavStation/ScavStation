
/obj/machinery/vending/security
	name = "SecTech"
	desc = "A security equipment vendor."
	product_ads = "Crack capitalist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?"
	icon = 'icons/obj/machines/vending/security.dmi'
	vend_delay = 14
	markup = 0
	base_type = /obj/machinery/vending/security
	initial_access = list(access_security)
	products = list(
		/obj/item/handcuffs = 8,
		/obj/item/grenade/flashbang = 4,
		/obj/item/grenade/chem_grenade/teargas = 4,
		/obj/item/flash = 5,
		/obj/item/food/donut = 12,
		/obj/item/box/evidence = 6
	)
	contraband = list(/obj/item/clothing/glasses/sunglasses = 2,/obj/item/box/fancy/donut = 2)
