/mob/living/simple_animal/hostile/thug
	name = "Thug"
	desc = "A man looking thug. Don't get near..."
	faction = "thug"
	icon = 'mods/valsalia/icons/mobs/simple_animal/bandit.dmi'
	move_intents = list(
		/decl/move_intent/walk/animal,
		/decl/move_intent/run/animal
	)
	max_health = 75
	natural_weapon = /obj/item/natural_weapon/punch
	ai = /datum/mob_controller/aggressive/thug
	base_movement_delay = 1
	var/corpse = /obj/abstract/landmark/corpse/thug
	var/weapon = /obj/item/bladed/shortsword

/mob/living/simple_animal/hostile/thug/bandit/Initialize()
	. = ..()

/datum/mob_controller/aggressive/thug
	speak_chance = 1.25
	emote_speech = list("Hmm?","I hate this place!","Fuck off")
	emote_see    = list("looks around","sneezes", "stretches")
	emote_hear   = list("walks around")
	only_attack_enemies = TRUE

/mob/living/simple_animal/hostile/thug/death(gibbed)
	. = ..()
	if(. && !gibbed)
		if(corpse)
			new corpse(loc)
		if(weapon)
			new weapon(loc)
		qdel(src)

/obj/abstract/landmark/corpse/thug
	name = "thug"
	corpse_outfits = list(/decl/outfit/corpse/thug)

/decl/outfit/corpse/thug
	name = "Dead Thug"
	uniform = /obj/item/clothing/suit/robe
	head = /obj/item/clothing/head/hijab
	shoes = /obj/item/clothing/shoes/workboots

/decl/outfit/corpse/wodewose
	name = "Dead Wodewose"
	uniform = /obj/item/clothing/pants/loincloth

/mob/living/simple_animal/hostile/thug/bandit
	name = "Bandit"
	desc = "A lowlife camping out in the wilderness, hoping to pounce on anyone, slit their throat, and take everything on them. Better watch out."
	faction = "bandit"
	move_intents = list(
		/decl/move_intent/walk/animal,
		/decl/move_intent/run/animal
	)
	max_health = 75
	ai = /datum/mob_controller/aggressive/thug/bandit
	base_movement_delay = 1

/mob/living/simple_animal/hostile/thug/bandit/Initialize()
	. = ..()

/datum/mob_controller/aggressive/thug/bandit
	speak_chance = 1.25
	emote_speech = list("Hmm?","Where is the next caravan?","I need me a fine woman, and some finer booze")
	emote_see    = list("looks around shiftily","sneezes", "scratches arse")
	emote_hear   = list("walks around")
	only_attack_enemies = TRUE



/mob/living/simple_animal/hostile/thug/exile
	name = "Exile"
	desc = "An exile, they were exiled for a reason..."
	faction = "exile"
	icon = 'mods/valsalia/icons/mobs/simple_animal/exile.dmi'
	move_intents = list(
		/decl/move_intent/walk/animal,
		/decl/move_intent/run/animal
	)
	max_health = 25
	natural_weapon = /obj/item/natural_weapon/claws/weak
	ai = /datum/mob_controller/aggressive/thug/exile
	base_movement_delay = 1
	corpse = /obj/abstract/landmark/corpse/thug/exile
	weapon = /obj/item/bladed/polearm/spear

/mob/living/simple_animal/hostile/thug/exile/Initialize()
	. = ..()

/datum/mob_controller/aggressive/thug/exile
	speak_chance = 1.25
	emote_speech = list("Hmm?","I miss home.","....")
	emote_see    = list("stares vacantly","sighs", "picks at plants")
	emote_hear   = list("walks around")
	only_attack_enemies = TRUE

/obj/abstract/landmark/corpse/thug/exile
	name = "exile"


/mob/living/simple_animal/hostile/thug/wild_man
	name = "Woodwose"
	desc = "A Woodwose, lost again to nature. Do not go near!"
	icon = 'mods/valsalia/icons/mobs/simple_animal/wild_man.dmi'
	faction = "wild_man"
	move_intents = list(
		/decl/move_intent/walk/animal,
		/decl/move_intent/run/animal
	)
	max_health = 75
	ai = /datum/mob_controller/aggressive/thug/wild_man
	base_movement_delay = 1
	corpse = /obj/abstract/landmark/corpse/thug/wild_man
	weapon = FALSE

/mob/living/simple_animal/hostile/thug/wild_man/Initialize()
	. = ..()

/datum/mob_controller/aggressive/thug/wild_man
	emote_see    = list("looks around","sneezes", "stares")
	emote_hear   = list("walks around")
	only_attack_enemies = TRUE

/obj/abstract/landmark/corpse/thug/wild_man
	name = "wild man"
	corpse_outfits = list(/decl/outfit/corpse/wodewose)