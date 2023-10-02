/datum/level_data/main_level/shelltooth
	level_max_width = 114
	level_max_height = 114
	origin_is_world_center = FALSE
	exterior_atmos_temp = T20C
	exterior_atmosphere = list(
		/decl/material/gas/oxygen = MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)
	ambient_light_level = 0.9
	ambient_light_color = COLOR_BEIGE
	use_global_exterior_ambience = FALSE
	border_filler = /turf/unsimulated/dark_filler
	strata = /decl/strata/sedimentary

/datum/level_data/main_level/shelltooth/wetland
	name             = "shelltooth wetland"
	level_id         = "shelltooth_wetland"
	base_area        = /area/shelltooth/wetland
	base_turf        = /turf/exterior/mud
	level_generators = list(
		/datum/random_map/noise/shelltooth_wetland
	)
	connected_levels = list("shelltooth_surface" = WEST)

/datum/level_data/main_level/shelltooth/sky
	name             = "shelltooth sky"
	level_id         = "shelltooth_sky"
	base_area        = /area/shelltooth/heights/sky
	base_turf        = /turf/exterior/open

/datum/level_data/main_level/shelltooth/heights
	name             = "shelltooth heights"
	level_id         = "shelltooth_heights"
	base_area        = /area/shelltooth/heights
	base_turf        = /turf/exterior/open

/datum/level_data/main_level/shelltooth/surface
	name             = "shelltooth surface"
	level_id         = "shelltooth_surface"
	base_area        = /area/shelltooth/surface
	base_turf        = /turf/exterior/barren
	level_generators = list(
		/datum/random_map/noise/shelltooth_wasteland
	)
	connected_levels = list("shelltooth_wetland" = EAST)

/datum/level_data/main_level/shelltooth/underground
	name             = "shelltooth underground"
	level_id         = "shelltooth_underground"
	base_area        = /area/shelltooth/underground
	base_turf        = /turf/exterior/barren
	ambient_light_level = 0
	level_generators = list(
		/datum/random_map/automata/cave_system,
		/datum/random_map/noise/ore
	)

/datum/level_data/main_level/shelltooth/abyss
	name      = "shelltooth depths"
	level_id  = "shelltooth_abyssal_depths"
	base_area = /area/shelltooth/underground/abyss
	base_turf = /turf/exterior/volcanic
	ambient_light_level = 0
	level_generators = list(
		/datum/random_map/automata/cave_system,
		/datum/random_map/noise/ore
	)

/obj/abstract/level_data_spawner/shelltooth/sky
	level_data_type = /datum/level_data/main_level/shelltooth/sky

/obj/abstract/level_data_spawner/shelltooth/heights
	level_data_type = /datum/level_data/main_level/shelltooth/heights

/obj/abstract/level_data_spawner/shelltooth/surface
	level_data_type = /datum/level_data/main_level/shelltooth/surface

/obj/abstract/level_data_spawner/shelltooth/underground
	level_data_type = /datum/level_data/main_level/shelltooth/underground

/obj/abstract/level_data_spawner/shelltooth/bottom
	level_data_type = /datum/level_data/main_level/shelltooth/abyss

/obj/abstract/level_data_spawner/shelltooth/wetland
	level_data_type = /datum/level_data/main_level/shelltooth/wetland

/datum/random_map/noise/shelltooth_wasteland
	descriptor = "wasteland"
	wall_type = /turf/exterior/dry
	floor_type = /turf/exterior/sand
	target_turf_type = /turf/unsimulated/mask
	smoothing_iterations = 4

/datum/random_map/noise/shelltooth_wasteland/get_additional_spawns(var/value, var/turf/T)
	..()
	var/v = noise2value(value)
	if(v > 6 && prob(10))
		new/obj/effect/quicksand(T)

/datum/random_map/noise/shelltooth_wasteland/get_appropriate_path(var/value)
	if(noise2value(value) >= 8)
		return /turf/exterior/dry
	if(noise2value(value) >= 5)
		return /turf/exterior/barren
	return /turf/exterior/sand

/datum/random_map/noise/shelltooth_wetland
	descriptor = "wetland"
	wall_type = /turf/exterior/mud
	floor_type = /turf/exterior/dry
	target_turf_type = /turf/unsimulated/mask
	smoothing_iterations = 4

/datum/random_map/noise/shelltooth_wetland/get_appropriate_path(var/value)
	if(noise2value(value) >= 8)
		return /turf/exterior/water
	if(noise2value(value) >= 5)
		return /turf/exterior/mud
	return /turf/exterior/dry
