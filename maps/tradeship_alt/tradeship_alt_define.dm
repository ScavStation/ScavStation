/datum/map/tradeship_alt
	name = "Fishfinder"
	full_name = "Ivenmoth Fishfinder"
	path = "tradeship_alt"
	ground_noun = "deck"

	station_name  = "Ivenmoth Fishfinder"
	station_short = "Fishfinder"

	dock_name     = "Val Salia Station"
	boss_name     = "Trademaster of Ivenmoth"
	boss_short    = "Trademaster"
	company_name  = "Tradehouse Ivenmoth"
	company_short = "Ivenmoth"

	game_year = 294

	// yingspace.png was remixed from Out-Of-Placers assets by Raptie and is included with kind permission.
	lobby_screens = list('mods/valsalia/lobby/fishfinder.png')

	overmap_ids = list(OVERMAP_ID_SPACE)
	num_exoplanets = 4
	away_site_budget = 3
	welcome_sound = 'sound/effects/cowboysting.ogg'
	emergency_shuttle_leaving_dock = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."
	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."
	evac_controller_type = /datum/evacuation_controller/lifepods
	pray_reward_type = /obj/item/mollusc/clam

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

	radiation_detected_message = "High levels of radiation have been detected in proximity of the %STATION_NAME%. Please move to a shielded area such as the cargo bay, dormitories or medbay until the radiation has passed."
	default_telecomms_channels = list(COMMON_FREQUENCY_DATA)

/datum/map/tradeship_alt/get_map_info()
	return "You're aboard the <b>[station_name],</b> a survey and mercantile vessel affiliated with <b>Tradehouse Ivenmoth</b>, a large merchant guild operating out of Val Salia Station. \
	This repurposed Tradeship vessel as been expanded to accomodate a larger crew, and is a trial run of how well yinglets can commandeer a vessel... under a close eye, anyway."

/datum/map/tradeship_alt/create_trade_hubs()
	new /datum/trade_hub/singleton/tradeship

/datum/trade_hub/singleton/tradeship
	name = "Tradehouse Freight Network"

/datum/trade_hub/singleton/tradeship/get_initial_traders()
	return list(
		/datum/trader/xeno_shop,
		/datum/trader/medical,
		/datum/trader/mining,
		/datum/trader/books
	)