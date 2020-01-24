/datum/map/tradeship
	allowed_jobs = list(
		/datum/job/captain,
		/datum/job/chief_engineer,
		/datum/job/doctor,
		/datum/job/rd,
		/datum/job/hop,
		/datum/job/cyborg,
		/datum/job/assistant,
		/datum/job/yinglet,
		/datum/job/yinglet/patriarch,
		/datum/job/yinglet/matriarch,
		/datum/job/baxxid
	)
	species_to_job_whitelist = list(
		/datum/species/yinglet = list(
			/datum/job/yinglet,
			/datum/job/yinglet/patriarch,
			/datum/job/yinglet/matriarch,
			/datum/job/assistant,
			/datum/job/chief_engineer,
			/datum/job/cyborg,
			/datum/job/doctor,
			/datum/job/rd
		),
		/datum/species/yinglet/southern = list(
			/datum/job/yinglet,
			/datum/job/yinglet/patriarch,
			/datum/job/yinglet/matriarch,
			/datum/job/assistant,
			/datum/job/chief_engineer,
			/datum/job/cyborg,
			/datum/job/doctor,
			/datum/job/rd
		),
		/datum/species/baxxid = list(
			/datum/job/baxxid
		)
	)

/datum/job/captain
	supervisors = "your profit margin, your conscience, and the wellbeing of your crew."
	outfit_type = /decl/hierarchy/outfit/job/tradeship/captain
	department_flag = COM
	department = "Ship's Crew"
	head_position = 1
	selection_color = "#7f6e2c"
	min_skill = list(   SKILL_WEAPONS = SKILL_ADEPT,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_ADEPT)
	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX)
	skill_points = 30

/datum/job/captain/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(H.client)
		H.client.verbs += /client/proc/tradehouse_rename_ship

/client/proc/tradehouse_rename_ship()
	set name = "Rename Tradeship"
	set category = "Captain's Powers"

	var/ship = sanitize(input(src, "What is your ship called?", "Ship Name", GLOB.using_map.station_short), MAX_NAME_LEN)
	if(!ship)
		return
	GLOB.using_map.station_short = ship
	GLOB.using_map.station_name = "[ship]"
	var/obj/effect/overmap/visitable/ship/tradeship/B = locate() in world
	if(B)
		B.SetName(GLOB.using_map.station_name)
	command_announcement.Announce("Attention all hands on [GLOB.using_map.station_name]! Thank you for your attention.", "Ship re-Christened")
	verbs -= /client/proc/tradehouse_rename_ship

/datum/job/captain/get_access()
	return get_all_station_access()

/datum/job/chief_engineer
	title = "Engineer"
	supervisors = "the Captain"
	department_flag = COM|ENG
	department = "Ship's Crew"
	head_position = 0
	selection_color = "#7f6e2c"
	minimal_player_age = 7
	economic_power = 7
	hud_icon = "hudchiefengineer"
	outfit_type = /decl/hierarchy/outfit/job/tradeship/chief_engineer
	min_skill = list(   SKILL_BUREAUCRACY  = SKILL_BASIC,
	                    SKILL_COMPUTER     = SKILL_ADEPT,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_ADEPT,
	                    SKILL_ENGINES      = SKILL_EXPERT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 28
	alt_titles = list()

/datum/job/doctor
	title = "Docter"
	supervisors = "the Captain and your own ethics"
	department_flag = COM|MED
	department = "Ship's Crew"
	head_position = 0
	selection_color = "#7f6e2c"
	minimal_player_age = 7
	economic_power = 7
	outfit_type = /decl/hierarchy/outfit/job/tradeship/doc
	alt_titles = list()
	total_positions = 2
	spawn_positions = 1
	hud_icon = "hudmedicaldoctor"
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_EXPERT,

	                    SKILL_ANATOMY     = SKILL_EXPERT,
	                    SKILL_CHEMISTRY   = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 28

/datum/job/hop
	title = "Ivanmoth Supervisor"
	supervisors = "Tradehouse Ivanmoth and its profit margin"
	department_flag = SRV
	department = "Tradehouse Ivanmoth"
	head_position = 1
	selection_color = "#8b0000"
	minimal_player_age = 14
	economic_power = 15
	outfit_type = /decl/hierarchy/outfit/job/tradeship/mate
	hud_icon = "hudheadofpersonnel"
	min_skill = list(   SKILL_WEAPONS     = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_EXPERT,
	                    SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_FINANCE     = SKILL_MAX,
	                    SKILL_BUREAUCRACY = SKILL_ADEPT)
	skill_points = 30
	alt_titles = list()

/datum/job/assistant
	title = "Deck Hand"
	department_flag = COM
	department = "Ship's Crew"
	head_position = 0
	selection_color = "#7f6e2c"
	minimal_player_age = 0
	economic_power = 2
	supervisors = "The captain and the other memebers of the crew."
	outfit_type = /decl/hierarchy/outfit/job/tradeship/hand
	alt_titles = list(
		"Cook" = /decl/hierarchy/outfit/job/tradeship/hand/cook,
		"Cargo Hand"
		)
	hud_icon = "hudcargotechnician"
	access = list(access_medical, access_engine, access_eva, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_hydroponics,
			            access_library, access_mining, access_mining_station)
	minimal_access = list(access_medical, access_engine, access_eva, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_hydroponics,
			            access_library, access_mining, access_mining_station)

/datum/job/cyborg
	supervisors = "your laws and the Captain"
	total_positions = 1
	spawn_positions = 1
	alt_titles = list()

/datum/job/rd
	title = "Ivanmoth Scientist"
	supervisors = "Tradehouse Ivanmoth"
	department_flag = SRV|SCI
	department = "Tradehouse Ivanmoth"
	head_position = 0
	selection_color = "#8b0000"
	minimal_player_age = 10
	economic_power = 10
	spawn_positions = 1
	total_positions = 2
	hud_icon = "hudscientist"
	access = list(access_rd, access_tox, access_morgue,
			            access_tox_storage, access_teleporter, access_sec_doors, access_heads,
			            access_research, access_robotics, access_xenobiology, access_tech_storage,
			            access_tcomsat, access_gateway, access_xenoarch)
	minimal_access = list(access_rd, access_tox, access_morgue,
			            access_tox_storage, access_teleporter, access_sec_doors, access_heads,
			            access_research, access_robotics, access_xenobiology, access_tech_storage,
			            access_tcomsat, access_gateway, access_xenoarch)
	alt_titles = list()
	outfit_type = /decl/hierarchy/outfit/job/tradeship/hand/researcher
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_ADEPT,
	                    SKILL_BOTANY      = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

/datum/job/yinglet
	title = "Enclave Worker"
	spawn_positions = 4
	total_positions = 6
	hud_icon = "hudying"
	supervisors = "the Matriarch and the Patriarches"
	outfit_type = /decl/hierarchy/outfit/job/yinglet
	department_flag = CIV
	var/required_gender

/datum/job/yinglet/is_species_allowed(var/datum/species/S)
	if(S && !istype(S))
		S = all_species[S]
	. = istype(S) && (S.name == SPECIES_YINGLET || S.name == SPECIES_YINGLET_SOUTHERN)

/datum/job/yinglet/check_special_blockers(var/datum/preferences/prefs)
	if(required_gender && prefs.gender != required_gender)
		. = "[required_gender] only"

/datum/job/yinglet/patriarch
	title = "Patriarch of Starfaring"
	hud_icon = "hudyingpatriarch"
	spawn_positions = 1
	total_positions = 1
	supervisors = "the Matriarch"
	required_gender = MALE
	outfit_type = /decl/hierarchy/outfit/job/yinglet/patriarch
	min_skill = list(   SKILL_WEAPONS     = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_ADEPT,
						SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_BASIC,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_EVA         = SKILL_MAX,
						SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 26
	head_position = 0
	department_flag = CIV
	access = list(
		access_heads, access_medical, access_engine, access_change_ids, access_eva, access_bridge,
		access_maint_tunnels, access_bar, access_janitor, access_cargo, access_cargo_bot, access_heads_vault,
		access_RC_announce, access_keycard_auth)
	minimal_access = list(
		access_heads, access_medical, access_engine, access_change_ids, access_eva, access_bridge,
		access_maint_tunnels, access_bar, access_janitor, access_cargo, access_cargo_bot, access_research, access_heads_vault,
		access_RC_announce, access_keycard_auth)


/datum/job/yinglet/matriarch
	title = "Enclave Matriarch"
	hud_icon = "hudyingmatriarch"
	spawn_positions = 1
	total_positions = 1
	required_gender = FEMALE
	supervisors = "your own wishes, and maybe the Captain"
	outfit_type = /decl/hierarchy/outfit/job/yinglet/matriarch
	min_skill = list(   SKILL_WEAPONS     = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_EXPERT,
	                    SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_ADEPT,
						SKILL_MEDICAL     = SKILL_ADEPT
						)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_FINANCE     = SKILL_MAX,
	                    SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_MEDICAL     = SKILL_MAX
						)
	skill_points = 30
	head_position = 1
	department_flag = CIV
	selection_color = "#2f2f7f"
	req_admin_notify = 1
	access = list(
		access_heads, access_medical, access_engine, access_eva, access_bridge,
		access_maint_tunnels, access_bar, access_janitor, access_cargo, access_cargo_bot, access_heads_vault,
		access_RC_announce, access_keycard_auth)
	minimal_access = list(
		access_heads, access_medical, access_engine, access_eva, access_bridge,
		access_maint_tunnels, access_bar, access_janitor, access_cargo, access_cargo_bot, access_heads_vault,
		access_RC_announce, access_keycard_auth)

/datum/job/baxxid
	title = "Baxxid"
	head_position = 0
	department_flag = COM
	department = "Ship's Crew"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#7f6e2c"
	hud_icon = "hudquatermaster"
	outfit_type = /decl/hierarchy/outfit/job/tradeship/hand
	req_admin_notify = 0
	minimal_player_age = 14
	economic_power = 15
	ideal_character_age = 50
	min_skill = list(   SKILL_FINANCE     = SKILL_EXPERT,
	                    SKILL_BUREAUCRACY = SKILL_ADEPT
						)

	max_skill = list(   SKILL_FINANCE     = SKILL_MAX,
	                    SKILL_BUREAUCRACY = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX
						)
	skill_points = 30
	access = list(
		access_heads, access_medical, access_engine, access_change_ids, access_eva, access_bridge,
		access_maint_tunnels, access_bar, access_janitor, access_cargo, access_cargo_bot, access_heads_vault,
		access_RC_announce, access_keycard_auth)
	minimal_access = list(
		access_heads, access_medical, access_engine, access_change_ids, access_eva, access_bridge,
		access_maint_tunnels, access_bar, access_janitor, access_cargo, access_cargo_bot, access_heads_vault,
		access_RC_announce, access_keycard_auth)

/datum/job/baxxid/is_species_allowed(var/datum/species/S)
	if(S && !istype(S))
		S = all_species[S]
	. = istype(S) && (S.name == SPECIES_BAXXID)

// OUTFITS
#define TRADESHIP_OUTFIT_JOB_NAME(job_name) ("Tradeship - Job - " + job_name)

/decl/hierarchy/outfit/job/tradeship
	hierarchy_type = /decl/hierarchy/outfit/job/tradeship
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store
	l_ear = null
	r_ear = null
	var/yinglet_suit_fallback = /obj/item/clothing/suit/storage/toggle/redcoat/yinglet

/decl/hierarchy/outfit/job/tradeship/proc/try_give_yinglet_fallbacks(var/mob/living/carbon/human/H)
	if(!H || H.species.get_bodytype(H) != SPECIES_YINGLET)
		return
	if(shoes && !H.shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal/yinglet(H), slot_shoes)
	if(uniform && !H.w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/yinglet(H), slot_w_uniform)
	if(suit && !H.wear_suit && yinglet_suit_fallback)
		H.equip_to_slot_or_del(new yinglet_suit_fallback(H), slot_wear_suit)

/decl/hierarchy/outfit/job/tradeship/equip(mob/living/carbon/human/H, rank, assignment, equip_adjustments)
	try_give_yinglet_fallbacks(H)
	. = ..()
	try_give_yinglet_fallbacks(H)

/decl/hierarchy/outfit/job/tradeship/captain
	name = TRADESHIP_OUTFIT_JOB_NAME("Captain")
	uniform = /obj/item/clothing/under/casual_pants/classicjeans
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda/captain
	r_pocket = /obj/item/radio
	id_type = /obj/item/card/id/gold

/decl/hierarchy/outfit/job/tradeship/captain/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/toggleable/hawaii/random/eyegore = new()
		if(uniform.can_attach_accessory(eyegore))
			uniform.attach_accessory(null, eyegore)
		else
			qdel(eyegore)

/decl/hierarchy/outfit/job/tradeship/chief_engineer
	name = TRADESHIP_OUTFIT_JOB_NAME("Engineer")
	uniform = /obj/item/clothing/under/rank/chief_engineer
	glasses = /obj/item/clothing/glasses/welding/superior
	suit = /obj/item/clothing/suit/storage/hazardvest
	gloves = /obj/item/clothing/gloves/thick
	shoes = /obj/item/clothing/shoes/workboots
	pda_type = /obj/item/modular_computer/pda/heads/ce
	l_hand = /obj/item/wrench
	belt = /obj/item/storage/belt/utility/full
	id_type = /obj/item/card/id/engineering/head
	r_pocket = /obj/item/radio
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/tradeship/doc
	name = TRADESHIP_OUTFIT_JOB_NAME("Doctor")
	uniform = /obj/item/clothing/under/det/black
	shoes = /obj/item/clothing/shoes/laceup
	pda_type = /obj/item/modular_computer/pda/medical
	id_type = /obj/item/card/id/medical

/decl/hierarchy/outfit/job/tradeship/mate
	name = TRADESHIP_OUTFIT_JOB_NAME("First Mate")
	uniform = /obj/item/clothing/under/suit_jacket/checkered
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses/big
	pda_type = /obj/item/modular_computer/pda/cargo
	l_hand = /obj/item/material/clipboard
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/officiated
	id_type = /obj/item/card/id/silver
	pda_type = /obj/item/modular_computer/pda/heads/hop

/decl/hierarchy/outfit/job/tradeship/hand
	name = TRADESHIP_OUTFIT_JOB_NAME("Deck Hand")

/decl/hierarchy/outfit/job/tradeship/hand/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(list(/obj/item/clothing/under/overalls,/obj/item/clothing/under/focal,/obj/item/clothing/under/hazard,/obj/item/clothing/under/rank/cargotech,/obj/item/clothing/under/color/black,/obj/item/clothing/under/color/grey,/obj/item/clothing/under/casual_pants/track, ))

/decl/hierarchy/outfit/job/tradeship/hand/cook
	name = TRADESHIP_OUTFIT_JOB_NAME("Cook")
	head = /obj/item/clothing/head/chefhat

/decl/hierarchy/outfit/job/tradeship/hand/researcher
	name = TRADESHIP_OUTFIT_JOB_NAME("Head Researcher")
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/service
	shoes = /obj/item/clothing/shoes/laceup
	pda_type = /obj/item/modular_computer/pda/science
	id_type = /obj/item/card/id/science/head

/decl/hierarchy/outfit/job/yinglet
	name = TRADESHIP_OUTFIT_JOB_NAME("Enclave Worker")
	uniform = /obj/item/clothing/under/yinglet
	shoes = /obj/item/clothing/shoes/sandal/yinglet
	id_type = /obj/item/card/id
	pda_type = /obj/item/modular_computer/pda
	l_ear = null
	r_ear = null

/decl/hierarchy/outfit/job/yinglet/patriarch
	name = TRADESHIP_OUTFIT_JOB_NAME("Enclave Patriarch")
	suit = /obj/item/clothing/suit/yinglet
	id_type = /obj/item/card/id/silver
	pda_type = /obj/item/modular_computer/pda/heads

/decl/hierarchy/outfit/job/yinglet/matriarch
	name = TRADESHIP_OUTFIT_JOB_NAME("Enclave Matriarch")
	uniform = /obj/item/clothing/under/yinglet/matriarch
	head = /obj/item/clothing/head/yinglet/matriarch
	id_type = /obj/item/card/id/silver
	pda_type = /obj/item/modular_computer/pda/heads