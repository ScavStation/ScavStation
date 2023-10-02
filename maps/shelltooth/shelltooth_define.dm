/datum/map/shelltooth
	name = "Shelltooth"
	full_name = "Shelltooth Station"
	path = "shelltooth"
	ground_noun = "deck"

	station_name  = "Shelltooth Station"
	station_short = "Shelltooth"

	dock_name     = "Val Salia Station"
	boss_name     = "Trade Administration"
	boss_short    = "Admin"
	company_name  = "Tradehouse Ivenmoth"
	company_short = "Ivenmoth"

	allowed_spawns = list(/decl/spawnpoint/arrivals)

	default_law_type = /datum/ai_laws/corporate

	// yingspace.png was remixed from Out-Of-Placers assets by Raptie and is included with kind permission.
	lobby_screens = list('maps/shelltooth/lobby/yingspace.png')

	overmap_ids = list(OVERMAP_ID_SPACE)
	num_exoplanets = 0

	welcome_sound = 'sound/effects/cowboysting.ogg'
	emergency_shuttle_leaving_dock = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."
	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."
	evac_controller_type = /datum/evacuation_controller/lifepods

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2
	radiation_detected_message = "High levels of radiation have been detected in proximity of the %STATION_NAME%. Please move to a shielded area such as the cargo bay, dormitories or medbay until the radiation has passed."

/datum/map/shelltooth/get_map_info()
	return "You're aboard the <b>[station_name],</b> a scav space station. This message isn't written yet."

/datum/map/shelltooth/create_trade_hubs()
	new /datum/trade_hub/singleton/tradeship

/datum/trade_hub/singleton/shelltooth/get_initial_traders()
	return list(
		/datum/trader/xeno_shop,
		/datum/trader/medical,
		/datum/trader/mining,
		/datum/trader/books
	)
