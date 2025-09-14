/mob/living/simple_animal/skittercrab
	name = "skittercrab"
	desc = "A hard-shelled crustacean. Seems quite content to lounge around all the time."
	icon = 'mods/valsalia/icons/mobs/simple_animal/skittercrab.dmi'
	mob_size = MOB_SIZE_SMALL
	speak_emote = list("clicks")
	response_harm = "stamps on"
	possession_candidate = 1
	pass_flags = PASS_FLAG_TABLE
	natural_armor = list(
		ARMOR_MELEE = ARMOR_MELEE_KNIVES
		)
	ai = /datum/mob_controller/skittercrab
	butchery_data = /decl/butchery_data/animal/arthropod/crab

/datum/mob_controller/skittercrab
	emote_hear = list("clicks")
	emote_see = list("clacks")
	speak_chance = 0.25
	turns_per_wander = 10
	wander_directions = list(EAST, WEST) // they only go sideways...
	can_escape_buckles = TRUE //snip snip

/decl/bodytype/hexapod
	abstract_type = /decl/bodytype/hexapod

/decl/bodytype/hexapod/animal
	abstract_type = /decl/bodytype/hexapod/animal
	name = "hexapod animal"
	bodytype_flag = 0
	bodytype_category = "hexapodal animal body"

/decl/bodytype/hexapod/get_ignited_icon_state(mob/living/victim)
	return "Generic_mob_burning"

/mob/living/simple_animal/skittercrab/get_bodytype()
	return GET_DECL(/decl/bodytype/hexapod/animal/skittercrab)

/decl/bodytype/hexapod/animal/skittercrab
	uid = "bodytype_animal_skittercrab"

/decl/bodytype/hexapod/animal/skittercrab/Initialize()
	equip_adjust = list(
		slot_head_str = list(
			"[NORTH]" = list(-1, -10),
			"[SOUTH]" = list(-1, -10),
			"[EAST]" =  list(-1, -10),
			"[WEST]" =  list(-1, -10)
		)
	)
	. = ..()