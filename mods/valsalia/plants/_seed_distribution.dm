// Wires all valsalia plant seeds into the hydroponics vendor/seed storage machines
/obj/machinery/vending/hydroseeds/Initialize()
	products = products || list()
	products[/obj/item/seeds/bruisegrassseed] = products[/obj/item/seeds/poppyseed] || 3
	products[/obj/item/seeds/eggtreeseed] = 3
	products[/obj/item/seeds/whitebloodstalkseed] = 2
	products[/obj/item/seeds/syrupbloomseed] = 3
	products -= /obj/item/seeds/poppyseed
	. = ..()

/obj/machinery/seed_storage/garden/Initialize()
	starting_seeds = starting_seeds || list()
	starting_seeds[/obj/item/seeds/bruisegrassseed] = starting_seeds[/obj/item/seeds/poppyseed] || 15
	starting_seeds[/obj/item/seeds/eggtreeseed] = 15
	starting_seeds[/obj/item/seeds/whitebloodstalkseed] = 5
	starting_seeds[/obj/item/seeds/syrupbloomseed] = 15
	starting_seeds -= /obj/item/seeds/poppyseed
	. = ..()

/obj/machinery/seed_storage/xenobotany/Initialize()
	starting_seeds = starting_seeds || list()
	starting_seeds[/obj/item/seeds/bruisegrassseed] = starting_seeds[/obj/item/seeds/poppyseed] || 15
	starting_seeds[/obj/item/seeds/eggtreeseed] = 15
	starting_seeds[/obj/item/seeds/whitebloodstalkseed] = 5
	starting_seeds[/obj/item/seeds/syrupbloomseed] = 15
	starting_seeds -= /obj/item/seeds/poppyseed
	. = ..()
