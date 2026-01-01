/datum/map/valSal_port
	default_liquid_fuel_type = /decl/material/liquid/nutriment/plant_oil
	default_species = SPECIES_YINGLET //SPECIES_KOBALOI // ScavStation edit
	loadout_categories = list(
		/decl/loadout_category/fantasy/clothing,
		/decl/loadout_category/fantasy/utility
	)

/datum/map/valSal_port/finalize_map_generation()
	. = ..()
	var/static/list/banned_weather = list(
		/decl/state/weather/snow/medium,
		/decl/state/weather/snow/heavy,
		/decl/state/weather/snow
	)
	var/datum/level_data/valsalport = SSmapping.levels_by_id["valSal_port_town"]
	if(istype(valsalport)) // if this is false, something has badly exploded
		SSweather.setup_weather_system(valsalport, banned_states = banned_weather)

/decl/spawnpoint/arrivals
	name = "Frontier Enclave"
	spawn_announcement = null
