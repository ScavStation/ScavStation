/mob/living/bot/cleanbot
	name = "cleanbot"
	desc = "A little cleaning robot, he looks so excited!"
	icon = 'icons/mob/bot/cleanbot.dmi'
	icon_state = "cleanbot0"
	req_access = list(list(access_janitor, access_robotics))
	botcard_access = list(access_janitor, access_maint_tunnels)

	wait_if_pulled = 1
	min_target_dist = 0

	var/screwloose = 0
	var/oddbutton = 0
	var/blood = 1
	var/list/target_types = list()

/mob/living/bot/cleanbot/Initialize()
	. = ..()
	get_targets()

/mob/living/bot/cleanbot/handleIdle()
	if(!screwloose && !oddbutton && prob(5))
		visible_message("\The [src] makes an excited beeping booping sound!")
	if(screwloose && prob(5)) // Make a mess
		if(isturf(loc))
			var/turf/T = loc
			if(T.simulated)
				T.wet_floor()
	if(oddbutton && prob(5)) // Make a big mess
		visible_message("Something flies out of [src]. He seems to be acting oddly.")
		var/obj/effect/decal/cleanable/blood/gibs/gib = new(loc)
		var/weakref/g = weakref(gib)
		ignore_list += g
		spawn(600)
			ignore_list -= g

/mob/living/bot/cleanbot/lookForTargets()
	for(var/obj/effect/decal/cleanable/decal in view(world.view + 1, src))
		if(confirmTarget(decal))
			target = decal
			playsound(src, 'sound/machines/boop1.ogg', 30)
			return

/mob/living/bot/cleanbot/confirmTarget(atom/target)
	. = ..()
	if(.)
		var/turf/decal_turf = get_turf(target)
		if(!istype(decal_turf) || decal_turf.contains_dense_objects())
			return FALSE // Stop trying to clean under full-tile windows.
		if(istype(target, /obj/effect/decal/cleanable/dirt))
			var/obj/effect/decal/cleanable/dirt/dirt = target
			return dirt.dirt_amount >= 50 // Stop trying to clean invisible dirt.
		return is_type_in_list(target, target_types)

/mob/living/bot/cleanbot/handleAdjacentTarget()
	if(get_turf(target) == src.loc)
		UnarmedAttack(target, TRUE)

/mob/living/bot/cleanbot/UnarmedAttack(var/obj/effect/decal/cleanable/decal, var/proximity)
	if(!istype(decal))
		return TRUE

	if(decal.loc != loc)
		return FALSE

	busy = 1
	visible_message("\The [src] begins to clean up \the [decal].")
	update_icon()
	var/cleantime = istype(decal, /obj/effect/decal/cleanable/dirt) ? 10 : 50
	if(do_after(src, cleantime, progress = 0) && !QDELETED(decal))
		if(decal == target)
			target = null
		qdel(decal)
	playsound(src, 'sound/machines/boop2.ogg', 30)
	busy = 0
	update_icon()
	return TRUE

/mob/living/bot/cleanbot/gib(do_gibs = TRUE)
	var/turf/my_turf = get_turf(src)
	. = ..()
	if(. && my_turf)
		new /obj/item/chems/glass/bucket(my_turf)
		new /obj/item/assembly/prox_sensor(my_turf)
		if(prob(50))
			new /obj/item/robot_parts/l_arm(my_turf)

/mob/living/bot/cleanbot/on_update_icon()
	..()
	if(busy)
		icon_state = "cleanbot-c"
	else
		icon_state = "cleanbot[on]"

/mob/living/bot/cleanbot/GetInteractTitle()
	. = "<head><title>Cleanbot controls</title></head>"
	. += "<b>Automatic Cleaner v1.0</b>"

/mob/living/bot/cleanbot/GetInteractPanel()
	. = "Cleans blood: <a href='byond://?src=\ref[src];command=blood'>[blood ? "Yes" : "No"]</a>"
	. += "<br>Patrol station: <a href='byond://?src=\ref[src];command=patrol'>[will_patrol ? "Yes" : "No"]</a>"

/mob/living/bot/cleanbot/GetInteractMaintenance()
	. = "Odd looking screw twiddled: <a href='byond://?src=\ref[src];command=screw'>[screwloose ? "Yes" : "No"]</a>"
	. += "<br>Weird button pressed: <a href='byond://?src=\ref[src];command=oddbutton'>[oddbutton ? "Yes" : "No"]</a>"

/mob/living/bot/cleanbot/ProcessCommand(var/mob/user, var/command, var/href_list)
	..()
	if(CanAccessPanel(user))
		switch(command)
			if("blood")
				blood = !blood
				get_targets()
			if("patrol")
				will_patrol = !will_patrol
				patrol_path = null

	if(CanAccessMaintenance(user))
		switch(command)
			if("screw")
				screwloose = !screwloose
			if("oddbutton")
				oddbutton = !oddbutton

/mob/living/bot/cleanbot/emag_act(var/remaining_uses, var/mob/user)
	. = ..()
	if(!screwloose || !oddbutton)
		if(user)
			to_chat(user, "<span class='notice'>\The [src] buzzes and beeps.</span>")
		oddbutton = 1
		screwloose = 1
		return 1

/mob/living/bot/cleanbot/proc/get_targets()
	target_types = list()

	target_types += /obj/effect/decal/cleanable/blood/oil
	target_types += /obj/effect/decal/cleanable/vomit
	target_types += /obj/effect/decal/cleanable/crayon
	target_types += /obj/effect/decal/cleanable/mucus
	target_types += /obj/effect/decal/cleanable/dirt
	target_types += /obj/effect/decal/cleanable/filth
	target_types += /obj/effect/decal/cleanable/spiderling_remains

	if(blood)
		target_types += /obj/effect/decal/cleanable/blood
