/datum/seed/algae/bruisegrass
	name = "bruisegrass"
	product_name = "bruisegrass"
	display_name = "bruisegrass patch"
	grown_tag = "bruisegrass"
	exude_gasses = null

/datum/seed/algae/bruisegrass/New()
	..()

	clear_chemical_composition()
	set_chemical_amount(/decl/material/liquid/nutriment, list(1,20))
	set_chemical_amount(/decl/material/liquid/painkillers, list(1,10))
	set_trait(TRAIT_PRODUCT_COLOUR,"#8a2546")
	set_trait(TRAIT_PLANT_COLOUR,"#8a2546")

/obj/item/seeds/bruisegrassseed
	seed = "bruisegrass"
