/datum/job/yinglet/yinglet_rep
	title = "Enclave Representative"
	alt_titles = list("Patriarch","Enclave Diplomat", "Enclave Ambassador")
	hud_icon = "hudyingmatriarch"
	spawn_positions = 1
	total_positions = 1
	supervisors = "the needs and wants of your Enclave"
	outfit_type = /decl/outfit/job/yinglet/yinglet_rep
	min_skill = list(
		SKILL_WEAPONS  = SKILL_BASIC,
		SKILL_FINANCE  = SKILL_EXPERT,
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_PILOT    = SKILL_ADEPT,
		SKILL_MEDICAL  = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_PILOT    = SKILL_MAX,
		SKILL_FINANCE  = SKILL_MAX,
		SKILL_MEDICAL  = SKILL_MAX,
		SKILL_ANATOMY  = SKILL_EXPERT
	)
	skill_points = 25
	department_types = list(/decl/department/enclave)
	selection_color = "#2f2f7f"
	access = list(access_lawyer)
	minimal_access = list(access_lawyer)

/datum/job/yinglet/matriarch
	title = "Matriarch"
	alt_titles = list("Her Muchliest Bestest", "Patriarch of Matriarching", "Matriarch of Patriarching")
	supervisors = "The yinglets of the enclave, the Captain, and the whims of your own ideals"
	outfit_type = /decl/outfit/job/yinglet/yinglet_rep/matriarch
	head_position = 1
	department_types = list(
		/decl/department/command,
		/decl/department/civilian
	)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#0e991e"
	hud_icon = "hudyingpatriarch"
	req_admin_notify = 1
	economic_power = 15
	guestbanned = 1
	not_random_selectable = 1
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_WEAPONS  = SKILL_ADEPT,
		SKILL_SCIENCE  = SKILL_ADEPT,
		SKILL_BOTANY = SKILL_EXPERT
	)
	max_skill = list(
		SKILL_PILOT   = SKILL_EXPERT,
		SKILL_WEAPONS = SKILL_MAX,
		SKILL_MEDICAL = SKILL_EXPERT,
		SKILL_ANATOMY  = SKILL_EXPERT
	)
	skill_points = 40
	access = list(
		access_security,
		access_sec_doors,
		access_heads,
		access_medical,
		access_engine,
		access_change_ids,
		access_ai_upload,
		access_eva,
		access_bridge,
		access_all_personal_lockers,
		access_maint_tunnels,
		access_bar,
		access_janitor,
		access_construction,
		access_morgue,
		access_crematorium,
		access_kitchen,
		access_mining,
		access_xenobiology,
		access_robotics,
		access_engine_equip,
		access_cargo,
		access_cargo_bot,
		access_mailsorting,
		access_qm,
		access_hydroponics,
		access_lawyer,
		access_chapel_office,
		access_library,
		access_research,
		access_mining,
		access_heads_vault,
		access_mining_station,
		access_hop,
		access_RC_announce,
		access_keycard_auth,
		access_gateway,
		access_cameras
	)
	minimal_access = list(
		access_security,
		access_sec_doors,
		access_heads,
		access_medical,
		access_engine,
		access_atmospherics,
		access_change_ids,
		access_ai_upload,
		access_eva,
		access_bridge,
		access_all_personal_lockers,
		access_maint_tunnels,
		access_bar,
		access_janitor,
		access_construction,
		access_mining,
		access_xenobiology,
		access_robotics,
		access_engine_equip,
		access_morgue,
		access_crematorium,
		access_kitchen,
		access_cargo,
		access_cargo_bot,
		access_mailsorting,
		access_qm,
		access_hydroponics,
		access_lawyer,
		access_chapel_office,
		access_library,
		access_research,
		access_mining,
		access_heads_vault,
		access_mining_station,
		access_hop,
		access_RC_announce,
		access_keycard_auth,
		access_gateway,
		access_cameras
	)