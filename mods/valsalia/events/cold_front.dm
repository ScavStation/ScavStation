/datum/event/cold_front
	startWhen = 45
	announceWhen = 1
	var/const/rad_interval = 5
	var/const/temp_dec = -80
	var/const/fire_loss = 40

/datum/event/cold_front/setup()
	endWhen = startWhen + rand(30,90) + rand(30,90)

/datum/event/cold_front/announce()
	priority_stealth.Announce_quiet("A Cold Front is approaching [location_name()]. Please take shelter in buildings or caves if possible.")

/datum/event/cold_front/start()
	priority_stealth.Announce_quiet("The Cold Front is now hitting [location_name()]. Buildings and caves should shield you.")

	// Set heavy snow weather on affected z-levels.
	for(var/z in affecting_z)
		var/obj/abstract/weather_system/WS = SSweather.weather_by_z[z]
		if(WS)
			WS.weather_system.set_state(/decl/state/weather/snow/heavy)

/datum/event/cold_front/tick()
	if(activeFor % rad_interval == 0)
		radiate()

/datum/event/cold_front/proc/radiate()
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

/datum/event/cold_front/end()
	priority_stealth.Announce_quiet("The Cold Front has passed [location_name()]. It is now safer to move about in the open.", "[location_name()] Sensor Array", zlevels = affecting_z)
