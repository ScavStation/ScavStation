/datum/map/valSal_port
	name          = "valSal_port"
	full_name     = "Valsalian Port Town"
	path          = "valSal_port"
	station_name  = "Valsalian Port Town"
	station_short = "Valsalian Port Town"
	dock_name     = "Valsalian Port"
	boss_name     = "the Splinter Kingdoms"
	boss_short    = "Splinter Kingdoms"
	company_name  = "whispers from the Deep"
	company_short = "the Deep"
	system_name   = "Downlands"
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
	return "You're in the <b>[station_name]</b> of the [system_name], nestled between the mountains and the river and bisected by the decaying Queens' Road. On all sides, you are surrounded by untamed wilds, with only a small ruined fort, rebuilt into an inn, to the east as a sign of civilisation. \
	Far from the control of [boss_name], you are free to carve forward a path to survival for yourself and your comrades however you wish. Strike the earth!"
