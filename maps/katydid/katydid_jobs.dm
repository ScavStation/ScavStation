/decl/department/engineering
	name = "Engineering"
	announce_channel = "Engineering"
	colour = "#ffa500"
	display_priority = 4
	display_color = "#fff5cc"

/obj/item/robot_module/engineering
	associated_department = /decl/department/engineering

/obj/machinery/network/pager/engineering
	department = /decl/department/engineering

/decl/department/security
	name = "Security"
	announce_channel = "Security"
	colour = "#dd0000"
	display_priority = 3
	display_color = "#ffddf0"

/obj/item/robot_module/security
	associated_department = /decl/department/security

/obj/machinery/network/pager/security
	department = /decl/department/security

/decl/department/medical
	name = "Medical"
	goals = list(/datum/goal/department/medical_fatalities)
	announce_channel = "Medical"
	colour = "#008000"
	display_priority = 2
	display_color = "#ffeef0"

/obj/item/robot_module/medical
	associated_department = /decl/department/medical

/obj/machinery/network/pager/medical
	department = /decl/department/medical

/decl/department/science
	name = "Science"
	goals = list(/datum/goal/department/extract_slime_cores)
	announce_channel = "Science"
	colour = "#a65ba6"
	display_color = "#e79fff"

/obj/item/robot_module/research
	associated_department = /decl/department/science

/obj/machinery/network/pager/science
	department = /decl/department/science

/decl/department/civilian
	name = "Civilian"
	display_priority = 1
	display_color = "#dddddd"

/decl/department/command
	name = "Command"
	colour = "#800080"
	display_priority = 5
	display_color = "#ccccff"

/obj/machinery/network/pager
	department = /decl/department/command

/decl/department/miscellaneous
	name = "Misc"
	display_priority = -1
	display_color = "#ccffcc"

/decl/department/service
	name = "Service"
	announce_channel = "Service"
	colour = "#88b764"
	display_color = "#d0f0c0"

/decl/department/supply
	name = "Supply"
	announce_channel = "Supply"
	colour = "#bb9040"
	display_color = "#f0e68c"

/obj/machinery/network/pager/cargo
	department = /decl/department/supply

/decl/department/support
	name = "Support"
	announce_channel = "Command"
	colour = "#800080"
	display_color = "#87ceeb"

/decl/special_role/revolutionary/Initialize()
	restricted_jobs |= list(/datum/job/katydid/crew/captain)
	protected_jobs |= list(/datum/job/katydid/crew/gunner)
	. = ..()

/decl/special_role/traitor/Initialize()
	protected_jobs |= list(/datum/job/katydid/crew/captain, /datum/job/katydid/crew/gunner)
	. = ..()

/datum/map/katydid
	default_job_type = /datum/job/katydid
	allowed_jobs = list(
		/datum/job/katydid/priest,
		/datum/job/katydid/tourist,
		/datum/job/katydid/crew,
		/datum/job/katydid/crew/gunner,
		/datum/job/katydid/crew/doctor,
		/datum/job/katydid/crew/engineer,
		/datum/job/katydid/crew/mate,
		/datum/job/katydid/crew/captain,
		/datum/job/computer,
		/datum/job/robot
		)

/datum/job/katydid
	title = "Passenger"
	department_types = list(/decl/department/civilian)
	total_positions = -1
	spawn_positions = -1
	access = list()
	minimal_access = list()
	supervisors = "the crew of the ship"
	outfit_type = /decl/hierarchy/outfit/job/katydid
	selection_color = "#515151"

/datum/job/katydid/tourist
	title = "Tourist"
	outfit_type = /decl/hierarchy/outfit/job/katydid/tourist
	department_types = list(/decl/department/civilian)
	total_positions = 3
	spawn_positions = 1
	supervisors = "your home government"
	access = list()
	minimal_access = list()
	selection_color = "#633d63"


/datum/job/katydid/priest
	title = "Preacher"
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 3
	supervisors = "the tenets of your religion"
	outfit_type = /decl/hierarchy/outfit/job/katydid/priest

/datum/job/katydid/crew
	title = "Crewman"
	access = list(access_maint_tunnels)
	minimal_access = list(access_maint_tunnels)
	total_positions = 15
	spawn_positions = 15
	department_types = list(/decl/department/command, /decl/department/security)
	supervisors = "the ship's Captain and First Mate"
	outfit_type = /decl/hierarchy/outfit/job/katydid/crew
	selection_color = "#601c1c"
	access = list(access_maint_tunnels, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting)
	minimal_access = list(access_maint_tunnels, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting)

/datum/job/katydid/crew/engineer
	title = "Engineer"
	total_positions = 1
	spawn_positions = 1
	access = list(access_heads, access_engine, access_maint_tunnels, access_rd, access_atmospherics, access_engine_equip, access_kitchen, access_tech_storage, access_cargo, access_cargo_bot, access_mailsorting, access_ai_upload)
	minimal_access = list(access_heads, access_engine, access_maint_tunnels, access_rd, access_engine_equip, access_kitchen, access_atmospherics, access_tech_storage, access_cargo, access_cargo_bot, access_mailsorting, access_ai_upload)
	supervisors = "the ship's Captain and First Mate"
	department_types = list(/decl/department/engineering)
	selection_color = "#5b4d20"
	outfit_type = /decl/hierarchy/outfit/job/katydid/crew/engineer

/datum/job/katydid/crew/captain
	title = "Captain"
	head_position = 1
	department_types = list(/decl/department/command)
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Free Trade Union and your own profit margins"
	selection_color = "#1d1d4f"
	req_admin_notify = 1
	minimal_player_age = 9
	economic_power = 20
	outfit_type = /decl/hierarchy/outfit/job/katydid/crew/captain
	access = list(access_keycard_auth, access_kitchen, access_captain, access_medical, access_security, access_heads, access_armory, access_engine, access_maint_tunnels, access_rd, access_atmospherics, access_engine_equip, access_cargo, access_cargo_bot, access_mailsorting, access_ai_upload)
	minimal_access = list(access_keycard_auth, access_kitchen, access_captain, access_medical, access_security, access_heads, access_armory, access_engine, access_maint_tunnels, access_rd, access_atmospherics, access_engine_equip, access_cargo, access_cargo_bot, access_mailsorting, access_ai_upload)

/datum/job/katydid/crew/mate
	title = "First Mate"
	selection_color = "#1d1d4f"
	head_position = 1
	supervisors = "the ship's Captain"
	department_types = list(/decl/department/command)
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 6
	outfit_type = /decl/hierarchy/outfit/job/katydid/crew/firstmate
	access = list(access_keycard_auth, access_kitchen, access_medical, access_heads, access_armory, access_engine, access_maint_tunnels, access_rd, access_atmospherics, access_engine_equip, access_cargo, access_cargo_bot, access_mailsorting)
	minimal_access = list(access_keycard_auth, access_kitchen, access_medical, access_heads, access_armory, access_engine, access_maint_tunnels, access_rd, access_atmospherics, access_engine_equip, access_cargo, access_cargo_bot, access_mailsorting)

/datum/job/katydid/crew/gunner
	title = "Gunner"
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 6
	department_types = list(/decl/department/security)
	selection_color = "#8e2929"
	outfit_type = /decl/hierarchy/outfit/job/katydid/crew/gunner
	access = list(access_heads, access_armory, access_kitchen, access_security, access_maint_tunnels, access_cargo, access_cargo_bot, access_mailsorting)
	minimal_access = list(access_heads, access_armory, access_kitchen, access_security, access_maint_tunnels, access_cargo, access_cargo_bot, access_mailsorting)

/datum/job/katydid/crew/doctor
	title = "Ship Doctor"
	total_positions = 1
	spawn_positions = 1
	department_types = list(/decl/department/medical)
	minimal_player_age = 6
	selection_color = "#026865"
	outfit_type = /decl/hierarchy/outfit/job/katydid/crew/doctor
	access = list(access_medical, access_kitchen)
	minimal_access = list(access_medical, access_kitchen)

/mob/living/carbon/human/proc/katydid_captain_rename_ship()

	set name = "Rename Ship"
	set desc = "Choose a name for the ship (one use)."
	set category = "IC"

	var/datum/map/katydid/katydid = using_map
	if(istype(katydid))
		var/newprefix = input("Select a new prefix.", "Ship Name") as null|anything in katydid.possible_ship_prefix
		if(!newprefix)
			return
		var/newname = sanitize(input("Enter a new name.", "Ship Name"), MAX_LNAME_LEN)
		if(!newname || newname == "")
			return
		katydid.ship_prefix = newprefix
		katydid.ship_name = newname
		katydid.full_name = "[katydid.ship_prefix] [katydid.ship_name]"
		world << "<span class='notice'><b>Captain [real_name] has christened this vessel the [katydid.full_name]!</b></span>"
	else
		src << "<span class='warning'>You shouldn't have had that verb; please report it to a developer.</span>"
	src.verbs -= /mob/living/carbon/human/proc/katydid_captain_rename_ship

/decl/hierarchy/outfit/job/katydid/crew/engineer
	name = "Engineer"
	belt = /obj/item/belt/utility/full
	shoes = /obj/item/clothing/shoes/workboots
	pda_type = /obj/item/modular_computer/pda

/obj/abstract/landmark/start/katydid
	name = "Passenger"
/obj/abstract/landmark/start/katydid/preacher
	name = "Preacher"
/obj/abstract/landmark/start/katydid/crewman
	name = "Crewman"
/obj/abstract/landmark/start/katydid/engineer
	name = "Engineer"
/obj/abstract/landmark/start/katydid/captain
	name = "Captain"
/obj/abstract/landmark/start/katydid/firstmate
	name = "First Mate"
/obj/abstract/landmark/start/katydid/gunner
	name = "Gunner"
/obj/abstract/landmark/start/katydid/doctor
	name = "Ship Doctor"
/obj/abstract/landmark/start/katydid/tourist
	name = "Tourist"

/datum/job/computer
	title = "Computer"
	event_categories = list(ASSIGNMENT_COMPUTER)
	total_positions = 0 // Not used for AI, see is_position_available below and modules/mob/living/silicon/ai/latejoin.dm
	spawn_positions = 1
	selection_color = "#3f823f"
	supervisors = "your laws"
	req_admin_notify = 1
	minimal_player_age = 14
	account_allowed = 0
	economic_power = 0
	outfit_type = /decl/hierarchy/outfit/job/silicon/ai
	loadout_allowed = FALSE
	hud_icon = "hudblank"
	skill_points = 0
	no_skill_buffs = TRUE
	guestbanned = 1
	not_random_selectable = 1
	skip_loadout_preview = TRUE
	department_types = list(/decl/department/miscellaneous)

/datum/job/computer/equip_job(var/mob/living/carbon/human/H)
	return !!H

/datum/job/computer/is_position_available()
	return (empty_playable_ai_cores.len != 0)

/datum/job/computer/handle_variant_join(var/mob/living/carbon/human/H, var/alt_title)
	return H

/datum/job/computer/do_spawn_special(var/mob/living/character, var/mob/new_player/new_player_mob, var/latejoin)
	character = character.AIize(move=0) // AIize the character, but don't move them yet

	// is_available for AI checks that there is an empty core available in this list
	var/obj/structure/aicore/deactivated/C = empty_playable_ai_cores[1]
	empty_playable_ai_cores -= C

	character.forceMove(C.loc)
	var/mob/living/silicon/ai/A = character
	A.on_mob_init()

	if(latejoin)
		new_player_mob.AnnounceCyborg(character, title, "has been downloaded to the empty core in \the [get_area_name(src)]")
	SSticker.mode.handle_latejoin(character)

	qdel(C)
	return TRUE

/datum/job/robot
	title = "Robot"
	event_categories = list(ASSIGNMENT_ROBOT)
	total_positions = 2
	spawn_positions = 2
	supervisors = "your laws and the AI"
	selection_color = "#254c25"
	minimal_player_age = 7
	account_allowed = 0
	economic_power = 0
	loadout_allowed = FALSE
	outfit_type = /decl/hierarchy/outfit/job/silicon/cyborg
	hud_icon = "hudblank"
	skill_points = 0
	no_skill_buffs = TRUE
	guestbanned = 1
	not_random_selectable = 1
	skip_loadout_preview = TRUE
	department_types = list(/decl/department/miscellaneous)

/datum/job/robot/handle_variant_join(var/mob/living/carbon/human/H, var/alt_title)
	if(H)
		return H.Robotize(SSrobots.get_mob_type_by_title(alt_title || title))

/datum/job/robot/equip_job(var/mob/living/carbon/human/H)
	return !!H

/datum/job/robot/New()
	..()
	alt_titles = SSrobots.robot_alt_titles.Copy()
	alt_titles -= title // So the unit test doesn't flip out if a mob or brain type is declared for our main title.
