/mob/living/simple_animal/grub_bear
	name = "Grub Bear"
	desc = "Why are they EVERYWHERE!?."
	icon = 'mods/valsalia/icons/mobs/simple_animal/grub_bear.dmi'
	speak_emote  = list("moos","moos hauntingly")
	ai = /datum/mob_controller/grub_bear
	see_in_dark = 6
	max_health = 50
	butchery_data = /decl/butchery_data/animal/ruminant/cow

	var/static/list/responses = list(
		"looks at you imploringly",
		"looks at you pleadingly",
		"looks at you with a resigned expression",
		"seems resigned to its fate"
	)

/datum/mob_controller/grub_bear
	emote_speech = list("moo?","moo","MOOOOOO")
	emote_hear   = list("brays")
	emote_see    = list("shakes its head")
	speak_chance = 0.25
	turns_per_wander = 10

/mob/living/simple_animal/grub_bear/Initialize()
	. = ..()
	set_extension(src, /datum/extension/milkable)

/mob/living/simple_animal/grub_bear/default_disarm_interaction(mob/user)
	if(stat != DEAD && !HAS_STATUS(src, STAT_WEAK))
		user.visible_message(SPAN_NOTICE("\The [user] tips over \the [src]."))
		SET_STATUS_MAX(src, STAT_WEAK, 30)
		addtimer(CALLBACK(src, PROC_REF(do_tip_response)), rand(20, 50))
		return TRUE
	return ..()

/mob/living/simple_animal/grub_bear/proc/do_tip_response()
	if(stat == CONSCIOUS)
		visible_message("<b>\The [src]</b> [pick(responses)].")