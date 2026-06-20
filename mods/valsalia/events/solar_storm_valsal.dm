/datum/event/solar_storm_valsal
	startWhen = 45
	announceWhen = 1
	var/const/rad_interval = 5
	var/const/temp_incr = 100
	var/const/fire_loss = 40

/datum/event/solar_storm_valsal/setup()
	endWhen = startWhen + rand(30,90) + rand(30,90)

/datum/event/solar_storm_valsal/announce()
	priority_stealth.Announce_quiet("A solar flare is approaching [location_name()]. Please take shelter in buildings or caves if possible.", "[location_name()] Sensor Array", zlevels = affecting_z)

/datum/event/solar_storm_valsal/start()
	priority_stealth.Announce_quiet("The solar flare is now hitting [location_name()]. Buildings and caves should shield you.", "[location_name()] Sensor Array", zlevels = affecting_z)

/datum/event/solar_storm_valsal/tick()
	if(activeFor % rad_interval == 0)
		radiate()

/datum/event/solar_storm_valsal/proc/radiate()
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

		if(L.increaseBodyTemp(temp_incr))
			continue

		L.take_damage(fire_loss / 2, BURN)

/datum/event/solar_storm_valsal/end()
	priority_stealth.Announce_quiet("The solar flare has passed [location_name()]. It is now safer to move about in the open.", "[location_name()] Sensor Array", zlevels = affecting_z)

