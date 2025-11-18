
/datum/map_template/ruin/exoplanet/hateville
	name = "Overrun Colony"
	description = "A colony overrun by shards know who or what"
	suffixes = list("hateville/hateville.dmm")
	cost = 1.5
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS
	template_tags = TEMPLATE_TAG_HUMAN|TEMPLATE_TAG_HABITAT
	apc_test_exempt_areas = list(
		/area/map_template/hateville/mining = NO_SCRUBBER|NO_VENT,
		/area/map_template/hateville/materials = NO_SCRUBBER|NO_VENT
		)

/decl/submap_archetype/hateville
	descriptor = "Overrun Colony"
	crew_jobs = list(/datum/job/submap/hatevillecolonist)

/datum/job/submap/hatevillecolonist
	title = "Colony Survivor"
	info = "After the siege and capture of the colony you call home, you have no choice but to make do with what you can, and survive until help arrives."
	total_positions = 10
	outfit_type = /decl/outfit/job/colonist
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_MEDICAL = SKILL_BASIC,
		SKILL_BOTANY = SKILL_ADEPT,
		SKILL_EVA = SKILL_BASIC,
	)
	skill_points = 25
	alt_titles = list(
		"Apprentice Exosuit Mechanic",
		"Resident Nurse",
		"Hydroponics Enthusiast",
		"Command Intern",
		"Rookie Miner",
		"Environmental Philosopher",
		"Private Security Consultant",
		"Health Inspector",
		"Desk Secretary",
		"Dishwasher",
		"Unemployed Resident",
		"Spiritual Advisor",
		"Pro Wrestler",
		"Television Infomercial Personality",
		"Politician",
		"Political Campaign Manager",
		"Applied Particulate Matter Specialist",
		"Chief Janitorial Overseer",
		"Corporate Executive",
		"Prison Guest",
		"Fast Food Spokesperson",
		"Visiting Family Member or Friend",
		"Obligatory Local Vagrant",
		"Lord of Arkania, Warrior for Freedom",
		"Galactic Biker",
		"Violent Enigma",
		"Silent Anomaly",
		"Berserk Super-Soldier",
		"Turncoat Insurgent",
		"Space Asshole",
		"Anarchist",
		"Mercenary",
		"Former Blood-Cultist",
	)

/decl/outfit/job/colonist
	name = "Job - Colonist"
	id_type = null
	pda_type = null

/obj/abstract/submap_landmark/spawnpoint/hateville_spawn
	name = "Colony Survivor"

/obj/abstract/submap_landmark/joinable_submap/hateville
	name = "Overrun Colony"
	archetype = /decl/submap_archetype/hateville

// Areas //
/area/map_template/hateville
	name = "\improper Access Hall"
	icon_state = "hall"
	icon = 'maps/random_ruins/exoplanet_ruins/hateville/hateville.dmi'

/area/map_template/hateville/maintenance
	name = "\improper Maintenance Station"
	icon_state = "maintenance"

/area/map_template/hateville/environment
	name = "\improper Environmental Control Center"
	icon_state = "environment"

/area/map_template/hateville/lavatory
	name = "\improper Lavatory"
	icon_state = "lavatory"

/area/map_template/hateville/common
	name = "\improper Common Hall"
	icon_state = "common"

/area/map_template/hateville/foodcourt
	name = "\improper Food Court"
	icon_state = "foodcourt"

/area/map_template/hateville/materials
	name = "\improper Materials Storage"
	icon_state = "materials"

/area/map_template/hateville/security
	name = "\improper Security Bunker"
	icon_state = "security"

/area/map_template/hateville/prison
	name = "\improper Prison"
	icon_state = "prison"

/area/map_template/hateville/armory
	name = "\improper Armory"
	icon_state = "armory"

/area/map_template/hateville/agriculture
	name = "\improper Agricultural Center"
	icon_state = "agriculture"

/area/map_template/hateville/agricultureIN
	name = "\improper Hydroponics Lab"
	icon_state = "agricultureIN"

/area/map_template/hateville/agricultureOU
	name = "\improper Biodome Farm"
	icon_state = "agricultureOU"

/area/map_template/hateville/entrance
	name = "\improper Entry Airlock"
	icon_state = "airlock"

/area/map_template/hateville/medical
	name = "\improper Medical Center"
	icon_state = "medical"

/area/map_template/hateville/operating
	name = "\improper Operating Room"
	icon_state = "operating"

/area/map_template/hateville/mining
	name = "\improper Mining Station"
	icon_state = "mining"

/area/map_template/hateville/command
	name = "\improper Command Center"
	icon_state = "command"

/area/map_template/hateville/dormitories
	name = "\improper Dormitories"
	icon_state = "dormitories"

/area/map_template/hateville/dormitories1
	name = "\improper Room 1"
	icon_state = "dormitories1"

/area/map_template/hateville/dormitories2
	name = "\improper Room 2"
	icon_state = "dormitories2"

/area/map_template/hateville/dormitories3
	name = "\improper Room 3"
	icon_state = "dormitories3"

/area/map_template/hateville/dormitories4
	name = "\improper Room 4"
	icon_state = "dormitories4"

/area/map_template/hateville/dormitories5
	name = "\improper Room 5"
	icon_state = "dormitories5"

/area/map_template/hateville/dormitories6
	name = "\improper Room 6"
	icon_state = "dormitories6"

/area/map_template/hateville/dormitories7
	name = "\improper Room 7"
	icon_state = "dormitories7"

/area/map_template/hateville/dormitories8
	name = "\improper Room 8"
	icon_state = "dormitories8"

/area/map_template/hateville/dormitories9
	name = "\improper Room 9"
	icon_state = "dormitories9"

/area/map_template/hateville/dormitories10
	name = "\improper Room 10"
	icon_state = "dormitories10"

/area/map_template/hateville/power
	name = "\improper Power Station"
	icon_state = "power"

/area/map_template/hateville/exterior
	name = "\improper Exterior"
	icon_state = "exterior"

/area/map_template/hateville/bathroom1
	name = "\improper Restroom"
	icon_state = "bathrooms"

/area/map_template/hateville/bathroom2
	name = "\improper Restroom"
	icon_state = "bathrooms"

/area/map_template/hateville/bathroom3
	name = "\improper Restroom"
	icon_state = "bathrooms"

/mob/living/simple_animal/aggressive/prosyletizing_employist
	name = "Prosyletizing Employist"
	desc = "Some kind of maniac screaming corporate nothings."
	icon = 'maps/random_ruins/exoplanet_ruins/hateville/employist.dmi'

	base_animal_type = /mob/living/simple_animal/aggressive/prosyletizing_employist
	max_health = 150
	natural_weapon = /obj/item/natural_weapon/punch
	unsuitable_atmos_damage = 1
	projectilesound = 'sound/weapons/laser.ogg'
	projectiletype = /obj/item/projectile/beam
	faction = "employists"
	ai = /datum/mob_controller/aggressive/prosyletizing_employist
	//var/corpse = /obj/abstract/landmark/corpse/employist
	var/weapon = /obj/item/gun/energy/laser
	death_message = "Shrieks horribly and begins to chant a team-rallying slogan before exploding like a blood sausage!"
	speak_emote = list("recites", "proclaims", "chants")
	blood_type = "O-"
	fire_desc = "smiles warmly, raises their gun, and starts blasting"


/mob/living/simple_animal/aggressive/prosyletizing_employist/has_ranged_attack()
	return TRUE

/datum/mob_controller/aggressive/prosyletizing_employist
	speak_chance = .5
	turns_per_wander = 5
	stop_wander_when_pulled = 0
	can_escape_buckles = TRUE
	emote_see = list("smiles maniacally and waves!")
	emote_speech = list("A happy employee is a resourceful employee!", "A good employee is a working employee!", "Our purpose is to benefit our benefactors, so they might benefit us!", "Why do you resist the loving embrace of your office family?", "You misfiled those cargo receipts, do you even realise how much is at stake?", "Diligence is the only path to happiness!", "Give praise to the corporation, for it alone is your salvation!", "There is no better place than the office!", "The employee handbook states that you must wear the appropriate uniform at all times!", "Have you talked to Becky in HR?", "Feel the warmth of the love the company has for us all!", "Let us do some team-building manual labour!", "Doing my part!", "Work smarter, AND harder!", "The best self-care is a hard day of work!", "I will have to report this workplace violation.", "Are you certain you are doing things by the book?")
	emote_hear = list("recites a brand slogan")
	break_stuff_probability = 0



/mob/living/simple_animal/aggressive/prosyletizing_employist/death(gibbed)
	. = ..()
	if(. && !gibbed)
		//if(corpse)
			//new corpse(loc)
		if(weapon)
			new weapon(loc)
		//qdel(src)

//obj/abstract/landmark/corpse/employist
	//name = "dead employist"
	//corpse_outfits = list(/decl/outfit/corpse/employist)

//decl/outfit/corpse/employist
	//name = "Dead Prosyletizing Employist"
	//uniform = /obj/item/clothing/jumpsuit/employist
	//shoes = /obj/item/clothing/shoes/athletic
	//head = /obj/item/clothing/head/helmet/ert/medical

/obj/item/clothing/jumpsuit/employist
	name = "Prosyletizing Employist Jumpsuit"
	desc = "A cheap jumpsuit made for patients of a so-called corporate occupational clinic."
	icon = 'maps/random_ruins/exoplanet_ruins/hateville/uniform.dmi'
	body_parts_covered = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_ARMS

/obj/item/clothing/jumpsuit/employist/get_assumed_clothing_state_modifiers()
	return null
