/datum/admins/proc/force_kill_weather()
	set name = "Kill Weather For Level"
	set desc = "Destroys a weather system for a level if present."
	set category = "Debug"

	if(!check_rights(R_DEBUG))
		return

	var/turf/T = get_turf(usr)
	if(!istype(T))
		to_chat(usr, SPAN_WARNING("You need to have a turf to use this verb."))
		return

	var/obj/abstract/weather_system/weather = T.weather || SSweather.weather_by_z[T.z]
	if(!weather)
		to_chat(usr, SPAN_WARNING("This z-level does not have weather."))
		return

	qdel(weather)
	to_chat(usr, SPAN_NOTICE("Weather destroyed for z[T.z]."))

/datum/admins/proc/force_initialize_weather()
	set name = "Initialize Weather For Level"
	set desc = "Creates a weather system for a level if not present."
	set category = "Debug"

	if(!check_rights(R_DEBUG))
		return

	var/turf/T = get_turf(usr)
	while(T && HasAbove(T.z))
		T = GetAbove(T)
	if(!istype(T))
		to_chat(usr, SPAN_WARNING("You need to have a turf to use this verb."))
		return

	var/obj/abstract/weather_system/weather = T.weather || SSweather.weather_by_z[T.z]
	if(weather)
		to_chat(usr, SPAN_WARNING("This z-level already has weather."))
		return
	SSweather.setup_weather_system(SSmapping.levels_by_z[T.z])
	to_chat(usr, SPAN_NOTICE("Weather created for z[T.z]."))

/datum/admins/proc/check_weather_exposure()
	set name = "Check Weather Exposure"
	set desc = "Dumps weather/outside state for your current turf, for debugging why visuals/audio may be out of sync."
	set category = "Debug"

	if(!check_rights(R_DEBUG))
		return

	var/turf/T = get_turf(usr)
	if(!istype(T))
		to_chat(usr, SPAN_WARNING("You need to have a turf to use this verb."))
		return

	var/area/A = get_area(T)
	var/datum/level_data/level = SSmapping.levels_by_z[T.z]
	var/obj/abstract/weather_system/turf_weather = T.weather
	var/obj/abstract/weather_system/z_weather = SSweather.weather_by_z[T.z]
	to_chat(usr, SPAN_NOTICE("z=[T.z] level=[level?.type] ignore_multiz_outside_stacking=[level?.ignore_multiz_outside_stacking]"))
	to_chat(usr, SPAN_NOTICE("area=[A.type] area.is_outside=[A.is_outside]"))
	to_chat(usr, SPAN_NOTICE("turf.is_outside(raw var)=[T.is_outside] turf.last_outside_check=[T.last_outside_check] turf.is_outside()=[T.is_outside()]"))
	to_chat(usr, SPAN_NOTICE("turf.density=[T.density] turf.weather=[isnull(turf_weather) ? "NULL" : "ref:\ref[turf_weather]"] SSweather.weather_by_z\[T.z\]=[isnull(z_weather) ? "NULL" : "ref:\ref[z_weather]"]"))
	to_chat(usr, SPAN_NOTICE("HasAbove(z)=[HasAbove(T.z)] HasBelow(z)=[HasBelow(T.z)] get_weather_exposure()=[T.get_weather_exposure()]"))

/datum/admins/proc/force_weather_state()
	set name = "Force Weather State"
	set desc = "Force the local weather to use a given state."
	set category = "Debug"

	if(!check_rights(R_DEBUG))
		return

	var/turf/T = get_turf(usr)
	if(!istype(T))
		to_chat(usr, SPAN_WARNING("You need to have a turf to use this verb."))
		return

	var/obj/abstract/weather_system/weather = T.weather || SSweather.weather_by_z[T.z]
	if(!weather)
		to_chat(usr, SPAN_WARNING("This z-level has no weather. Use <b>Initialize Weather For Level</b> if you want to create it."))
		return

	var/use_state = input(usr, "Which state do you wish to use?", "Target State") as null|anything in decls_repository.get_decl_paths_of_subtype(/decl/state/weather)
	if(!use_state || weather != (T.weather || SSweather.weather_by_z[T.z]))
		return
	weather.weather_system.set_state(use_state)
	var/decl/state/weather/weather_state = GET_DECL(use_state)
	to_chat(usr, SPAN_NOTICE("Set weather for z[T.z] to [weather_state.name]."))
