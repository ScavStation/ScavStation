/datum/job/yinglet/worker
	title = "Enclave Worker"
	spawn_positions = 2
	total_positions = 4
	outfit_type = /decl/hierarchy/outfit/job/yinglet/worker

/datum/job/yinglet/scout
	title = "Enclave Scout"
	spawn_positions = 1
	total_positions = 3
	department_types = list(
		/decl/department/enclave,
		/decl/department/exploration
	)
	hud_icon = "hudyingscout"
	supervisors = "the Matriarch and the Patriarches"
	outfit_type = /decl/hierarchy/outfit/job/yinglet/scout
	access = list(
		access_eva, 
		access_research
	)
	min_skill = list(
		SKILL_EVA      = SKILL_ADEPT,
		SKILL_SCIENCE  = SKILL_ADEPT,
		SKILL_PILOT    = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT    = SKILL_MAX,
		SKILL_SCIENCE  = SKILL_MAX,
		SKILL_COMBAT   = SKILL_EXPERT,
		SKILL_WEAPONS  = SKILL_EXPERT,
		SKILL_LITERACY = SKILL_BASIC
	)
	skill_points = 22

/datum/job/yinglet/patriarch
	title = "Enclave Patriarch"
	hud_icon = "hudyingpatriarch"
	spawn_positions = 2
	total_positions = 3
	supervisors = "the Matriarch"
	required_gender = MALE
	outfit_type = /decl/hierarchy/outfit/job/yinglet/patriarch
	alt_titles = list(
		"Patriarch of Cooking" = /decl/hierarchy/outfit/job/yinglet/patriarch/cook,
		"Patriarch of Scouting" = /decl/hierarchy/outfit/job/yinglet/patriarch/scout,
		"Patriarch of Security",
		"Patriarch of Botany" )
	min_skill = list(
		SKILL_WEAPONS      = SKILL_BASIC,
		SKILL_FINANCE      = SKILL_EXPERT,
		SKILL_PILOT        = SKILL_ADEPT,
		SKILL_COMPUTER     = SKILL_BASIC,
		SKILL_EVA          = SKILL_BASIC,
		SKILL_CONSTRUCTION = SKILL_ADEPT,
		SKILL_ELECTRICAL   = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT        = SKILL_MAX,
		SKILL_FINANCE      = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL   = SKILL_MAX,
		SKILL_ATMOS        = SKILL_MAX,
		SKILL_ENGINES      = SKILL_MAX
	)
	skill_points = 26
	head_position = 1
	guestbanned = 1	
	department_types = list(/decl/department/enclave)
	access = list(
		access_security,
		access_sec_doors,
		access_brig,
		access_forensics_lockers,
		access_heads,
		access_medical, 
		access_engine,
		access_change_ids,
		access_eva,
		access_bridge,
		access_maint_tunnels,
		access_bar,
		access_janitor,
		access_cargo,
		access_cargo_bot,
		access_research,
		access_heads_vault,
		access_hop,
		access_RC_announce,
		access_keycard_auth
	)
	minimal_access = list(
		access_security,
		access_sec_doors,
		access_brig,
		access_forensics_lockers,
		access_heads,
		access_medical,
		access_engine,
		access_change_ids,
		access_eva,
		access_bridge,
		access_maint_tunnels,
		access_bar,
		access_janitor,
		access_cargo,
		access_cargo_bot,
		access_research,
		access_heads_vault,
		access_hop,
		access_RC_announce,
		access_keycard_auth
	)

/datum/job/yinglet/matriarch
	title = "Enclave Matriarch"
	hud_icon = "hudyingmatriarch"
	spawn_positions = 1
	total_positions = 1
	required_gender = FEMALE
	supervisors = "your own wishes, and maybe the Captain"
	outfit_type = /decl/hierarchy/outfit/job/yinglet/matriarch
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
	skill_points = 30
	head_position = 1
	department_types = list(
		/decl/department/enclave,
		/decl/department/command
	)
	selection_color = "#2f2f7f"
	req_admin_notify = 1
	guestbanned = 1	
	must_fill = 1
	not_random_selectable = 1
	access = list(
		access_security,
		access_sec_doors,
		access_brig,
		access_forensics_lockers,
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
		access_gateway
	)
	minimal_access = list(
			access_security,
		access_sec_doors,
		access_brig,
		access_forensics_lockers,
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
		access_gateway
	)
