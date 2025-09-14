/datum/mob_controller/passive/deer
	emote_hear         = list("bleats")
	emote_see          = list("shakes its head", "stamps a hoof", "looks around quickly")
	emote_speech       = list("Ough!", "Ourgh!", "Mroough!", "Broough?")
	speak_chance       = 0.25
	turns_per_wander   = 10

/datum/mob_controller/passive/deer/buck
	emote_hear         = list("bellows")

/mob/living/simple_animal/passive/deer
	name               = "deer"
	gender             = NEUTER
	icon               = 'icons/mob/simple_animal/doe.dmi'
	desc               = "A fleet-footed forest animal known for its grace, speed and timidity."
	speak_emote        = list("bleats")
	see_in_dark        = 6
	faction            = "deer"
	max_health         = 60
	butchery_data      = /decl/butchery_data/animal/ruminant/deer
	natural_weapon     = /obj/item/natural_weapon/hooves
	mob_size           = MOB_SIZE_LARGE
	ai                 = /datum/mob_controller/passive/deer
	eye_color          = "#1a1a1a"

	draw_visible_overlays = list(
		"base"     = "#b39161",
		"markings" = "#3a3329",
		"socks"    = "#ddd5c9"
	)

/mob/living/simple_animal/passive/deer/get_bodytype()
	return GET_DECL(/decl/bodytype/quadruped/animal/deer)

/decl/bodytype/quadruped/animal/deer
	uid = "bodytype_animal_deer"

/decl/bodytype/quadruped/animal/deer/Initialize()
	equip_adjust = list(
		slot_head_str = list(
			"[NORTH]" = list( 1, -4),
			"[SOUTH]" = list( 1, -4),
			"[EAST]" =  list( 9, -4),
			"[WEST]" =  list(-9, -4)
		)
	)
	return ..()

/mob/living/simple_animal/passive/deer/set_gender(new_gender, update_body)
	. = ..()
	if(name == initial(name))
		switch(gender)
			if(MALE)
				SetName("buck")
			if(FEMALE)
				SetName("doe")
			else
				SetName("deer")

/mob/living/simple_animal/passive/deer/doe
	name               = "doe"
	icon               = 'icons/mob/simple_animal/doe.dmi'
	butchery_data      = /decl/butchery_data/animal/ruminant/deer
	gender             = FEMALE

/mob/living/simple_animal/passive/deer/buck
	name               = "buck"
	icon               = 'icons/mob/simple_animal/buck.dmi'
	butchery_data      = /decl/butchery_data/animal/ruminant/deer/buck
	gender             = MALE
	speak_emote        = list("bellows")
	ai                 = /datum/mob_controller/passive/deer/buck

/mob/living/simple_animal/passive/deer/Initialize()
	if(gender == NEUTER)
		if(prob(10)) // Internet seems to think a 10:1 ratio of does to bucks isn't uncommon, adjust later if this is bollocks
			name = "buck"
			icon = 'icons/mob/simple_animal/buck.dmi'
			butchery_data = /decl/butchery_data/animal/ruminant/deer/buck
			gender = MALE
			speak_emote = list("bellows")
			ai = /datum/mob_controller/passive/deer/buck
		else
			name = "doe"
			icon = 'icons/mob/simple_animal/doe.dmi'
			butchery_data = /decl/butchery_data/animal/ruminant/deer
			gender = FEMALE
			speak_emote = list("bleats")
			ai = /datum/mob_controller/passive/deer
	return ..()

/mob/living/simple_animal/passive/deer/sparkle
	name = "sparkledeer"
	desc = "A fleet-footed forest animal known for a love of vtubers."

/mob/living/simple_animal/passive/deer/sparkle/Initialize()
	draw_visible_overlays = list(
		"base"     = get_random_colour(),
		"markings" = get_random_colour(TRUE),
		"socks"    = get_random_colour()
	)
	eye_color      = get_random_colour(TRUE)
	. = ..()
