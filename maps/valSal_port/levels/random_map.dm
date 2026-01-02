/datum/random_map/automata/cave_system/valSal_port
	descriptor          = "ValSalian Port caves"
	floor_type          = /turf/floor/rock/basalt
	wall_type           = /turf/wall/natural/basalt/valSal_port
	sparse_mineral_turf = /turf/wall/natural/random/basalt/valSal_port
	rich_mineral_turf   = /turf/wall/natural/random/high_chance/basalt/valSal_port

/datum/random_map/noise/valSal_port
	abstract_type = /datum/random_map/noise/valSal_port
	smoothing_iterations = 1
	smooth_single_tiles  = TRUE
	target_turf_type = /turf/unsimulated/mask

/datum/random_map/noise/valSal_port/swamp
	descriptor           = "ValSalian Port Bog"

/datum/random_map/noise/valSal_port/swamp/get_appropriate_path(var/value)
	value = noise2value(value)
	if(value <= 3)
		return /turf/floor/mud/water/deep
	if(value <= 5)
		return /turf/floor/mud/water
	if(value <= 7)
		return /turf/floor/mud
	return /turf/floor/grass

/datum/random_map/noise/valSal_port/woods
	descriptor = "ValSalian Port Woods"

/datum/random_map/noise/valSal_port/woods/get_appropriate_path(var/value)
	value = noise2value(value)
	if(value <= 6)
		return /turf/floor/grass/wild
	return /turf/floor/grass

// TODO
/datum/random_map/noise/forage/valSal_port
	abstract_type = /datum/random_map/noise/forage/valSal_port

/datum/random_map/noise/forage/valSal_port/grassland/New()
	forage["grass"] |= list(
		"yarrow",
		"valerian"
	)
	..()

/datum/random_map/noise/forage/valSal_port/swamp
	tree_weight = 4
	trees = list(
		/obj/structure/flora/tree/hardwood/walnut = 1,
		/obj/structure/flora/tree/dead/walnut = 2,
		/obj/structure/flora/bush = 4,
		/obj/structure/flora/bush/leafybush = 5,
		/obj/structure/flora/bush/grassybush = 5,
		/obj/structure/flora/bush/stalkybush = 5,
		/obj/structure/flora/bush/reedbush = 6,
		/obj/structure/flora/bush/fernybush = 6,
	)

/datum/random_map/noise/forage/valSal_port/swamp/New()
	forage["grass"] |= list(
		"aloe",
		"foxglove"
	)
	forage["riverbed"] = list(
		// the swamp doesn't really have enough flowing water for molluscs to live here or for flint to wash up
		"algae"
	)
	forage["riverbank"] = list(
		"harebells",
		"lavender",
		"nettle",
		"algae",
		"mushrooms"
	)
	return ..()

/datum/random_map/noise/forage/valSal_port/woods
	tree_weight = 2
	trees = list(
		/obj/structure/flora/tree/hardwood/walnut = 8,
		/obj/structure/flora/tree/hardwood/yew = 8,
		/obj/structure/flora/tree/hardwood/mahogany = 8,
		/obj/structure/flora/bush/pointybush = 5,
		/obj/structure/flora/tree/dead/walnut = 1,
		/obj/structure/flora/tree/dead/yew = 1,
		/obj/structure/flora/tree/dead/mahogany = 1,
		/obj/structure/flora/bush/genericbush = 1,
		/obj/structure/flora/bush/grassybush = 1,
		/obj/structure/flora/bush/stalkybush = 1,
		/obj/structure/flora/bush/reedbush = 1,
		/obj/structure/flora/bush/fernybush = 1,
	)

/datum/random_map/noise/forage/valSal_port/woods/New()
	forage["grass"] |= list(
		"ginseng",
		"foxglove"
	)
	..()
