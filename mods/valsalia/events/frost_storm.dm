/datum/event/frost_storm
	startWhen = 45
	announceWhen = 1
	var/const/rad_interval = 5
	var/const/temp_dec = -80
	var/const/fire_loss = 40

/datum/event/frost_storm/setup()
	endWhen = startWhen + rand(30,90) + rand(30,90)

/datum/event/frost_storm/announce()
	command_announcement.Announce("A Frost Storm is approaching [location_name()]. Please take shelter in buildings or caves if possible.", "[location_name()] Sensor Array", zlevels = affecting_z)

/datum/event/frost_storm/start()
	command_announcement.Announce("The Frost Storm is now hitting [location_name()]. Buildings and caves should shield you.", "[location_name()] Sensor Array", zlevels = affecting_z)

	// Set heavy snow weather on affected z-levels.
	for(var/z in affecting_z)
		var/obj/abstract/weather_system/WS = SSweather.weather_by_z[z]
		if(WS)
			WS.weather_system.set_state(/decl/state/weather/snow/heavy)

/datum/event/frost_storm/tick()
	if(activeFor % rad_interval == 0)
		radiate()

/datum/event/frost_storm/proc/radiate()
	for(var/mob/living/L in global.living_mob_list_)
		if(L.loc?.atom_flags & ATOM_FLAG_SHIELD_CONTENTS)
			continue
		var/turf/T = get_turf(L)
		if(!T || !isPlayerLevel(T.z))
			continue

		// Building and cave areas are protected from the storm.
		if(T.is_outside() == OUTSIDE_NO)
			continue

		// Ignore simple animals to avoid wiping flora during the storm.
		if(istype(L,/mob/living/simple_animal))
			continue

		if(L.increaseBodyTemp(temp_dec))
			continue

		L.take_damage(fire_loss / 2, BURN)

/datum/event/frost_storm/end()
	command_announcement.Announce("The Frost Storm has passed [location_name()]. It is now safer to move about in the open.", "[location_name()] Sensor Array", zlevels = affecting_z)

