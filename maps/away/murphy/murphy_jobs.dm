

/datum/job/submap/murphy_crew
	title = "Murphy Crew"
	total_positions = 6
	department_types = list(/decl/department/murphy)
	primary_department = /decl/department/murphy
	outfit_type = /decl/outfit/job/murphy/crew
	supervisors = "your survival"
	info = "crew member."
	required_language = /decl/language/human/common
	available_by_default = TRUE
	latejoin_at_spawnpoints = TRUE
	access = list(
		access_eva,
		access_maint_tunnels,
		access_external_airlocks
	)

/datum/job/submap/murphy_captain
	title = "Murphy Captain"
	supervisors = "the crew"
	total_positions = 2
	department_types = list(/decl/department/murphy)
	primary_department = /decl/department/murphy
	outfit_type = /decl/outfit/job/murphy/captain
	info = "Captain."
	required_language = /decl/language/human/common
	available_by_default = TRUE
	skill_points = 38
	latejoin_at_spawnpoints = TRUE
	access = list(
		access_eva,
		access_captain,
		access_engine,
		access_engine_equip,
		access_tech_storage,
		access_maint_tunnels,
		access_external_airlocks,
		access_construction,
		access_atmospherics,
		access_emergency_storage
	)




/decl/outfit/job/murphy
	abstract_type = /decl/outfit/job/murphy
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store_str
	l_ear = null
	r_ear = null

/decl/outfit/job/murphy/crew
	name = "Private Ship - Job - Murphy Crewman"
	r_pocket = /obj/item/radio
	shoes = /obj/item/clothing/shoes/color/black
	belt = /obj/item/belt/utility/full

/decl/outfit/job/murphy/captain
	name = "Private Ship - Job - Murphy Captain"
	uniform = /obj/item/clothing/jumpsuit/engineer
	suit = /obj/item/clothing/suit/jacket/hoodie
	shoes = /obj/item/clothing/shoes/color/black
	r_pocket = /obj/item/radio
	l_pocket = /obj/item/crowbar

/obj/abstract/submap_landmark/spawnpoint/murphy_crew
	name = "Murphy Crew"

/obj/abstract/submap_landmark/spawnpoint/murphy_captain
	name = "Murphy Captain"

/obj/abstract/submap_landmark/spawnpoint/murphy_core
	name = "Murphy AI Core"


var/global/list/murphy_playable_ai_cores = list()

/obj/structure/aicore/deactivated/murphy
	name = "Murphy AI core"

/obj/structure/aicore/deactivated/murphy/Initialize()
	. = ..()
	global.murphy_playable_ai_cores += src

/obj/structure/aicore/deactivated/murphy/Destroy()
	global.murphy_playable_ai_cores -= src
	. = ..()

/obj/abstract/submap_landmark/spawnpoint/murphy_core/Initialize()
	. = ..()
	//The job subsystem does its thing before we can, so we've got to handle this
	new /obj/structure/aicore/deactivated/murphy(get_turf(loc))


/datum/job/submap/murphy_core
	title = "Murphy AI Core"
	event_categories = list(ASSIGNMENT_COMPUTER)
	total_positions = 0 // Not used for AI, see is_position_available below and modules/mob/living/silicon/ai/latejoin.dm
	spawn_positions = 1
	selection_color = "#3f823f"
	supervisors = "your laws"
	available_by_default = TRUE
	latejoin_at_spawnpoints = TRUE
	req_admin_notify = 1
	minimal_player_age = 1
	account_allowed = 0
	economic_power = 0
	outfit_type = /decl/outfit/job/silicon/ai
	loadout_allowed = FALSE
	hud_icon = "hudblank"
	skill_points = 0
	no_skill_buffs = TRUE
	guestbanned = 1
	not_random_selectable = 1
	skip_loadout_preview = TRUE
	department_types = list(
		/decl/department/miscellaneous,
		/decl/department/murphy
	)
	primary_department = /decl/department/murphy
	access = list(
		access_eva,
		access_captain,
		access_engine,
		access_engine_equip,
		access_tech_storage,
		access_maint_tunnels,
		access_external_airlocks,
		access_construction,
		access_atmospherics,
		access_emergency_storage
	)

/datum/job/submap/murphy_core/equip_job(var/mob/living/human/H)
	return !!H

/datum/job/submap/murphy_core/is_position_available()
	return (global.murphy_playable_ai_cores.len != 0)

/datum/job/submap/murphy_core/handle_variant_join(var/mob/living/human/H, var/alt_title)
	return H

/datum/job/submap/murphy_core/do_spawn_special(var/mob/living/character, var/mob/new_player/new_player_mob, var/latejoin)
	character = character.AIize(move = FALSE)

	// is_available for AI checks that there is an empty core available in this list
	if(!LAZYLEN(global.murphy_playable_ai_cores))
		return FALSE
	var/obj/structure/aicore/deactivated/murphy/C = global.murphy_playable_ai_cores[1]
	global.murphy_playable_ai_cores -= C

	character.forceMove(C.loc)
	var/mob/living/silicon/ai/A = character
	A.on_mob_init()

	if(latejoin)
		new_player_mob.AnnounceCyborg(character, title, "has been downloaded to the empty core in \the [get_area_name(src)]")
	SSticker.mode.handle_latejoin(character)

	qdel(C)
	return TRUE