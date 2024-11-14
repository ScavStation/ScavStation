/decl/flooring/wood
	name               = "wooden floor"
	desc               = "A stretch of closely-fitted wooden planks."
	icon               = 'icons/turf/flooring/wood.dmi'
	icon_base          = "wood"
	has_base_range     = 4
	damage_temperature = T0C+200
	descriptor         = "planks"
	build_type         = /obj/item/stack/tile/wood
	flooring_flags     = TURF_IS_FRAGILE | TURF_REMOVE_SCREWDRIVER
	footstep_type      = /decl/footsteps/wood
	color              = /decl/material/solid/organic/wood::color
	force_material     = /decl/material/solid/organic/wood
	constructed        = TRUE
	gender             = NEUTER
	broken_states      = list(
		"broken0",
		"broken1",
		"broken2",
		"broken3",
		"broken4",
		"broken5",
		"broken6"
	)

/decl/flooring/wood/mahogany
	color              = /decl/material/solid/organic/wood/mahogany::color
	build_type         = /obj/item/stack/tile/mahogany
	force_material     = /decl/material/solid/organic/wood/mahogany

/decl/flooring/wood/maple
	color              = /decl/material/solid/organic/wood/maple::color
	build_type         = /obj/item/stack/tile/maple
	force_material     = /decl/material/solid/organic/wood/maple

/decl/flooring/wood/ebony
	color              = /decl/material/solid/organic/wood/ebony::color
	build_type         = /obj/item/stack/tile/ebony
	force_material     = /decl/material/solid/organic/wood/ebony

/decl/flooring/wood/walnut
	color              = /decl/material/solid/organic/wood/walnut::color
	build_type         = /obj/item/stack/tile/walnut
	force_material     = /decl/material/solid/organic/wood/walnut

/decl/flooring/wood/bamboo
	color              = /decl/material/solid/organic/wood/bamboo::color
	build_type         = /obj/item/stack/tile/bamboo
	force_material     = /decl/material/solid/organic/wood/bamboo

/decl/flooring/wood/yew
	color              = /decl/material/solid/organic/wood/yew::color
	build_type         = /obj/item/stack/tile/yew
	force_material     = /decl/material/solid/organic/wood/yew
