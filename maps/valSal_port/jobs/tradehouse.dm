/decl/department/valSal_port/tradehouse
	name          = "Tradehouse Ivenmoth"
	colour        = "#404e68"
	display_color = "#8c96c4"

/datum/job/valSal_port/tradehouse
	abstract_type    = /datum/job/valSal_port/tradehouse
	department_types = list(/decl/department/valSal_port/tradehouse)
	skill_points     = 20
	lock_keys     = list(
		"shrine"  = /decl/material/solid/metal/copper
	)

/datum/job/valSal_port/tradehouse/surveyor
	title                   = "Tradehouse Surveyor"
	alt_titles              = list("Expedition Leader", "Tradehouse Scout", "Tradehouse Officer")
	supervisors             = "Tradehouse Ivenmoth, and Viracroix Salia"
	description             = "You are a member of Tradehouse Ivenmoth, sent south to survey southern lands and search for new trading partners. Your job is to establish contact with the locals and establish commerce."
	spawn_positions         = 1
	total_positions         = 1
	outfit_type             = /decl/outfit/job/valSal_port/tradehouse/surveyor
	min_skill               = list(
		SKILL_CARPENTRY     = SKILL_AVERAGE,
		SKILL_FINANCE       = SKILL_MAX,
		SKILL_LITERACY      = SKILL_ADEPT,
		SKILL_MEDICAL       = SKILL_ADEPT,
		SKILL_ANATOMY       = SKILL_ADEPT
	)
	max_skill               = list(
		SKILL_MEDICAL       = SKILL_MAX,
		SKILL_ANATOMY       = SKILL_MAX
	)
	skill_points            = 24

/obj/abstract/landmark/start/valSal_port/surveyor
	name                    = "Tradehouse Surveyor"

/datum/job/valSal_port/tradehouse/generalrecruit
	title                   = "Tradehouse Redcoat"
	alt_titles              = list("General-Recruit", "Tradehouse Mothguard")
	supervisors             = "Tradehouse Ivenmoth, your superior officer, and Viracroix Salia"
	description             = "You are a member of Tradehouse Ivenmoth, sent to accompany and protect an Officer on a mission to search for new trading partners. Your mission is to ensure their safety."
	spawn_positions         = 2
	total_positions         = 2
	outfit_type             = /decl/outfit/job/valSal_port/tradehouse/generalrecruit
	min_skill               = list(
		SKILL_STONEMASONRY  = SKILL_BASIC,
		SKILL_CARPENTRY     = SKILL_BASIC,
		SKILL_ATHLETICS     = SKILL_ADEPT,
		SKILL_COMBAT        = SKILL_ADEPT,
		SKILL_WEAPONS       = SKILL_ADEPT
	)
	max_skill               = list(
		SKILL_COOKING       = SKILL_EXPERT,
		SKILL_BOTANY        = SKILL_EXPERT
	)

/obj/abstract/landmark/start/valSal_port/generalrecruit
	name                    = "Tradehouse Redcoat"
