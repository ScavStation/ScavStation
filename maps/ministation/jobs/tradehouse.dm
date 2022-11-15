/datum/job/ministation/tradehouse/rep
	title = "Tradehouse Representative"
	alt_titles = list("Narc")
	hud_icon = "hudnarc"
	spawn_positions = 1
	total_positions = 2
	req_admin_notify = 1
	guestbanned = 1
	supervisors = "the Trademaster"
	outfit_type = /decl/hierarchy/outfit/job/ministation/tradehouse
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
	department_types = list(/decl/department/tradehouse)
	selection_color = "#a89004"
	access = list(access_lawyer)
	minimal_access = list(access_lawyer)