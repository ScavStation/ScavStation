/obj/abstract/map_data/valSal_port
	height = 2

/datum/level_data/main_level/valSal_port
	use_global_exterior_ambience = FALSE
	base_area = null
	base_turf = /turf/floor/dirt
	abstract_type = /datum/level_data/main_level/valSal_port
	ambient_light_level = 1
	ambient_light_color = "#f3e6ca"
	strata = /decl/strata/valSal_port
	exterior_atmosphere = list(
		/decl/material/gas/oxygen =   MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)
	daycycle_type = /datum/daycycle/valSal_port
	daycycle_id = "daycycle_valSal_port"
	template_edge_padding = 0 // we use a strictly delineated subarea, no need for this guard
	var/submap_budget   = 0
	var/submap_category = null
	var/submap_area
	var/list/mobs_to_spawn = list()

/datum/daycycle/valSal_port
	cycle_duration = 1 HOURS // 1 hour of daylight, 1 hour of night

// Randomized time of day to start at.
/datum/daycycle/valSal_port/New()
	time_in_cycle = rand(cycle_duration)
	..()

/datum/level_data/main_level/valSal_port/get_subtemplate_areas(template_category, blacklist, whitelist)
	return submap_area ? (islist(submap_area) ? submap_area : list(submap_area)) : null

/datum/level_data/main_level/valSal_port/get_subtemplate_budget()
	return submap_budget

/datum/level_data/main_level/valSal_port/get_subtemplate_category()
	return submap_category

/datum/level_data/main_level/valSal_port/after_generate_level()
	. = ..()
	if(length(mobs_to_spawn))
		for(var/list/mob_category in mobs_to_spawn)
			var/list/mob_types = mob_category[1]
			var/mob_turf  = mob_category[2]
			var/mob_count = mob_category[3]
			var/sanity = 1000
			while(mob_count && sanity)
				sanity--
				var/turf/place_mob_at = locate(rand(level_inner_min_x, level_inner_max_x), rand(level_inner_min_y, level_inner_max_y), level_z)
				if(istype(place_mob_at, mob_turf) && !(locate(/mob/living) in place_mob_at))
					var/mob_type = pickweight(mob_types)
					new mob_type(place_mob_at)
					mob_count--
					CHECK_TICK

/datum/level_data/main_level/valSal_port/town
	name = "ValSalian Port - Town"
	level_id = "valSal_port_town"
	level_generators = list(
		/datum/random_map/noise/ore/poor,
		/datum/random_map/noise/valSal_port/woods,
		/datum/random_map/noise/forage/valSal_port/woods
	)
	connected_levels = list(
		"valSal_port_enclave" = WEST
	)

	mobs_to_spawn = list(
		list(
			list(
				/mob/living/simple_animal/passive/mouse        = 9,
				/mob/living/simple_animal/passive/rabbit       = 3,
				/mob/living/simple_animal/passive/rabbit/brown = 3,
				/mob/living/simple_animal/passive/rabbit/black = 3,
				/mob/living/simple_animal/opossum              = 5
			),
			/turf/floor/grass,
			10
		)
	)


/datum/level_data/main_level/valSal_port/enclave
	name = "ValSalian Port - Enclave"
	level_id = "valSal_port_enclave"
	connected_levels = list(
		"valSal_port_town" = EAST
	)
	level_generators = list(
		/datum/random_map/noise/ore/poor,
		/datum/random_map/noise/valSal_port/woods,
		/datum/random_map/noise/forage/valSal_port/woods
	)

	mobs_to_spawn = list(
		list(
			list(
				/mob/living/simple_animal/passive/mouse        = 6,
				/mob/living/simple_animal/passive/rabbit       = 2,
				/mob/living/simple_animal/passive/rabbit/brown = 2,
				/mob/living/simple_animal/passive/rabbit/black = 2,
				/mob/living/simple_animal/frog                 = 3,
				/mob/living/simple_animal/frog/brown           = 2,
				/mob/living/simple_animal/frog/yellow          = 2,
				/mob/living/simple_animal/frog/purple          = 1
			),
			/turf/floor/grass,
			5
		),
		list(
			list(
				/mob/living/simple_animal/frog                 = 3,
				/mob/living/simple_animal/frog/brown           = 2,
				/mob/living/simple_animal/frog/yellow          = 2,
				/mob/living/simple_animal/frog/purple          = 1
			),
			/turf/floor/mud,
			10
		)
	)

/datum/level_data/main_level/valSal_port/caverns
	name = "ValSalian Port - caverns"
	level_id = "caverns"
	level_generators = list(
		/datum/random_map/noise/ore/rich
	)

/obj/abstract/level_data_spawner/valSal_port_town
	level_data_type = /datum/level_data/main_level/valSal_port/town

/obj/abstract/level_data_spawner/valSal_port_enclave
	level_data_type = /datum/level_data/main_level/valSal_port/enclave

/obj/abstract/level_data_spawner/valSal_port_caverns
	level_data_type = /datum/level_data/main_level/valSal_port/caverns