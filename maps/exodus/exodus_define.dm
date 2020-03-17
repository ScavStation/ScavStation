/datum/map/exodus
	name =                   "Exodus"
	full_name =              "NSS Exodus"
	path =                   "exodus"
	station_name  =          "NSS Exodus"
	station_short =          "Exodus"
	dock_name     =          "NAS Crescent"
	boss_name     =          "Central Command"
	boss_short    =          "Centcomm"
	company_name  =          "NanoTrasen"
	company_short =          "NT"
	system_name =            "Nyx"

	station_levels =         list(1,2)
	contact_levels =         list(1,2)
	player_levels =          list(1,2)
	admin_levels =           list(3)
	evac_controller_type =   /datum/evacuation_controller/shuttle

	shuttle_docked_message = "The scheduled Crew Transfer Shuttle to %Dock_name% has docked with the station. It will depart in approximately %ETD%"
	shuttle_leaving_dock =   "The Crew Transfer Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	shuttle_called_message = "A crew transfer to %Dock_name% has been scheduled. The shuttle has been called. It will arrive in approximately %ETA%"
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
