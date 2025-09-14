/mob/living/deity
	hud_used = /datum/hud/deity

/datum/hud/deity
	action_intent_type = /obj/screen/intent/deity

/datum/hud/deity/FinalizeInstantiation()
	..()
	var/obj/screen/intent/deity/D = action_intent
	if(istype(D))
		D.sync_to_mob(mymob)
