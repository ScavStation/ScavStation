//butchery data used for the mob
/decl/butchery_data/animal/small/insect/ivenmoth
	meat_name         = "ivenmoth"
	meat_type         = /obj/item/food/butchery/meat/insect/ivenmoth

/obj/item/food/butchery/meat/insect/ivenmoth

/obj/item/food/butchery/meat/insect/ivenmoth/populate_reagents()
	. = ..()
	add_to_reagents(/decl/material/liquid/hallucinogenics, 2) //ivenmoth meat is slightly hallucinogenic (yes i know this isnt _strictly_ canon-accurate, but this is more fun)

//the mob itself
/mob/living/simple_animal/passive/ivenmoth
	name = "ivenmoth"
	real_name = "ivenmoth"
	desc = "A large moth native to the Val Salia region and the Tradehouse's namesake."
	icon = 'mods/valsalia/icons/mobs/simple_animal/ivenmoth_red.dmi'
	speak_emote  = list("flutters","chitters","flaps")
	pass_flags = PASS_FLAG_TABLE
	see_in_dark = 6
	max_health = 5
	response_harm = "stamps on"
	density = FALSE
	minbodytemp = 223		//Below -50 Degrees Celsius
	maxbodytemp = 323	//Above 50 Degrees Celsius
	universal_speak = FALSE
	universal_understand = TRUE
	holder_type = /obj/item/holder
	mob_size = MOB_SIZE_MINISCULE
	can_pull_size = ITEM_SIZE_TINY
	can_pull_mobs = MOB_PULL_NONE
	base_animal_type = /mob/living/simple_animal/passive/ivenmoth
	butchery_data = /decl/butchery_data/animal/small/insect/ivenmoth

	ai = /datum/mob_controller/passive/ivenmoth

	var/body_color //red, blue, brown, and yellow, leave blank for random
	var/splatted = FALSE

/datum/mob_controller/passive/ivenmoth
	expected_type = /mob/living/simple_animal/passive/ivenmoth
	emote_see    = list("walks in a circle", "flutters its wings", "cleans its antennae")
	speak_chance = 0.25
	turns_per_wander = 10
	can_escape_buckles = TRUE

/mob/living/simple_animal/passive/ivenmoth/get_dexterity(var/silent)
	return DEXTERITY_NONE

/mob/living/simple_animal/passive/ivenmoth/Initialize()
	verbs += /mob/living/proc/ventcrawl
	verbs += /mob/living/proc/hide
	if(name == initial(name))
		name = "[name] ([sequential_id(/mob/living/simple_animal/passive/ivenmoth)])"
	real_name = name
	set_moth_icon()
	. = ..()

/mob/living/simple_animal/passive/ivenmoth/proc/set_moth_icon()
	if(!body_color)
		body_color = pick( list("red","blue","brown", "yellow") )
	switch(body_color)
		if("red")
			icon = 'mods/valsalia/icons/mobs/simple_animal/ivenmoth_red.dmi'
		if("blue")
			icon = 'mods/valsalia/icons/mobs/simple_animal/ivenmoth_blue.dmi'
		if("brown")
			icon = 'mods/valsalia/icons/mobs/simple_animal/ivenmoth_brown.dmi'
		if("yellow")
			icon = 'mods/valsalia/icons/mobs/simple_animal/ivenmoth_yellow.dmi'

/mob/living/simple_animal/passive/ivenmoth/proc/splat()
	take_damage(get_max_health()) // Enough damage to kill
	splatted = TRUE
	death()

/mob/living/simple_animal/passive/ivenmoth/on_update_icon()
	. = ..()
	if(stat == DEAD && splatted)
		icon_state = "world-splat"

//color variants
/mob/living/simple_animal/passive/ivenmoth/red
	body_color = "red"
	icon = 'mods/valsalia/icons/mobs/simple_animal/ivenmoth_red.dmi'

/mob/living/simple_animal/passive/ivenmoth/blue
	body_color = "blue"
	icon = 'mods/valsalia/icons/mobs/simple_animal/ivenmoth_blue.dmi'

/mob/living/simple_animal/passive/ivenmoth/brown
	body_color = "brown"
	icon = 'mods/valsalia/icons/mobs/simple_animal/ivenmoth_brown.dmi'

/mob/living/simple_animal/passive/ivenmoth/yellow
	body_color = "yellow"
	icon = 'mods/valsalia/icons/mobs/simple_animal/ivenmoth_yellow.dmi'

//Binny
/mob/living/simple_animal/passive/ivenmoth/yellow/Binny
	name = "Binny"
	desc = "The destroyer of worlds."

/mob/living/simple_animal/passive/ivenmoth/yellow/Binny/Initialize()
	. = ..()
	// Change my name back, don't want to be named Binny (666)
	SetName(initial(name))
	real_name = name