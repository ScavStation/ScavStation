/datum/seed/algae/bruisegrass
	name = "bruisegrass"
	seed_name = "bruisegrass"
	display_name = "bruisegrass patch"
	chems = list(/decl/material/liquid/nutriment = list(1,20), /decl/material/liquid/painkillers = list(1,10))
	kitchen_tag = "bruisegrass"
	exude_gasses = null

/datum/seed/algae/bruisegrass/New()
	..()
	set_trait(TRAIT_PRODUCT_COLOUR,"#8a2546")
	set_trait(TRAIT_PLANT_COLOUR,"#8a2546")

/obj/item/seeds/bruisegrassseed
	seed_type = "bruisegrass"

/obj/machinery/vending/hydroseeds/Initialize()
	products = products || list()
	products[/obj/item/seeds/bruisegrassseed] = products[/obj/item/seeds/poppyseed] || 3
	products -= /obj/item/seeds/poppyseed
	. = ..()

/obj/machinery/seed_storage/garden/Initialize()
	starting_seeds = starting_seeds || list()
	starting_seeds[/obj/item/seeds/bruisegrassseed] = starting_seeds[/obj/item/seeds/poppyseed] || 15
	starting_seeds -= /obj/item/seeds/poppyseed
	. = ..()

/obj/machinery/seed_storage/xenobotany/Initialize()
	starting_seeds = starting_seeds || list()
	starting_seeds[/obj/item/seeds/bruisegrassseed] = starting_seeds[/obj/item/seeds/poppyseed] || 15
	starting_seeds -= /obj/item/seeds/poppyseed
	. = ..()
