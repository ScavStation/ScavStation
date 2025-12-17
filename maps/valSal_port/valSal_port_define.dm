/datum/map/valSal_port
	name          = "valSal_port"
	full_name     = "Frontier Enclave"
	path          = "valSal_port"
	station_name  = "Frontier Enclave"
	station_short = "Frontier Enclave"
	dock_name     = "Frontier Enclave"
	boss_name     = "The High Elders"
	boss_short    = "The Elders"
	company_name  = "The Central Enclaves"
	company_short = "Central Enclaves"
	system_name   = "Southlands"
	default_spawn = /decl/spawnpoint/arrivals

	lobby_screens = list('maps/valSal_port/valSal_port_lobby.png')

	allowed_latejoin_spawns = list(
		/decl/spawnpoint/arrivals
	)
	map_tech_level          = MAP_TECH_LEVEL_MEDIEVAL
	survival_box_choices    = list()
	passport_type           = null
	_available_backpacks    = list(
		/decl/backpack_outfit/sack
	)
	lobby_tracks = list(
		/decl/music_track/dhaka,
		/decl/music_track/teller,
		/decl/music_track/suonatore
	)
	credit_sound = list(
		'sound/music/Miris-Magic-Dance.ogg'
	)
	game_year = -666 // in 2025, the year should be around 1359, the setting of the Out of Placers Web Comic by ValSalian

	char_preview_bgstate_options = list(
		"000",
		"midgrey",
		"FFF",
		"wood"  = /turf/floor/wood::color,
		"mud",
		"grass" = /turf/floor/grass::color,
		"rock"  = /turf/floor/rock/basalt::color,
		"brick" = /turf/wall/brick/sandstone::color
	)

/decl/backpack_outfit/sack
	is_default = TRUE

/datum/map/valSal_port/get_map_info()
	return "You're a yinglet caravan, heading to the mountains to establish a <b>[station_name]</b> on command of the [boss_name], nestled along a mountain and a river. On all sides, you are surrounded by untamed wilds, with only a small town built by humans nearby, though it's been long abandoned. \
	Your first goal should be to establish a foyer for your Matriarch. Weh!"
