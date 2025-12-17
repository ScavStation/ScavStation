/decl/department/valSal_port/locals
	name                    = "Locals"
	colour                  = "#40684a"
	display_color           = "#8cc4a8"

/datum/job/valSal_port/local
	abstract_type           = /datum/job/valSal_port/local
	department_types        = list(/decl/department/valSal_port/locals)

/datum/job/valSal_port/local/miner
	title                   = "Miner"
	description             = "You mine ores from the mountain, and occasionally refine them, too. The only limit to your potential bounty is your own hard work and ingenuity... and the kobaloi in the caves."
	supervisors             = "the consequences of your actions"
	spawn_positions         = 1
	total_positions         = 1
	outfit_type             = /decl/outfit/job/valSal_port/miner
	min_skill               = list(
		SKILL_HAULING       = SKILL_ADEPT, // general physical activity
		SKILL_METALWORK     = SKILL_BASIC, // ore smelting, metallurgy
		SKILL_STONEMASONRY  = SKILL_BASIC, // experienced working with stone
		SKILL_SCULPTING     = SKILL_BASIC, // producing clay molds, firing pottery
	)
	skill_points            = 20

/obj/abstract/landmark/start/valSal_port/miner
	name                    = "Miner"

/datum/job/valSal_port/local/herbalist
	title                   = "Herbalist"
	description             = "You collect and grow plants and herbs and process them into various useful substances, such as medicinal tinctures, ointments, and teas."
	supervisors             = "nature"
	spawn_positions         = 1
	total_positions         = 1
	outfit_type             = /decl/outfit/job/valSal_port/herbalist
	min_skill               = list(
		SKILL_BOTANY        = SKILL_ADEPT, // growing, processing, and identifying plants
		SKILL_MEDICAL       = SKILL_BASIC, // identifying illnesses and applying medicines
		SKILL_CHEMISTRY     = SKILL_BASIC, // processing plant extracts into tinctures, ointments, etc
	)
	max_skill               = list(
		SKILL_MEDICAL       = SKILL_MAX,
		SKILL_ANATOMY       = SKILL_MAX,
		SKILL_CHEMISTRY     = SKILL_MAX,
	)
	skill_points            = 22

/obj/abstract/landmark/start/valSal_port/herbalist
	name                    = "Herbalist"

/datum/job/valSal_port/local/forester
	title                   = "Forester"
	description             = "You are at home in nature, whether you're fishing, hunting wild game, or chopping timber for firewood and construction."
	supervisors             = "nature"
	spawn_positions         = 1
	total_positions         = 1
	outfit_type             = /decl/outfit/job/valSal_port/forester
	min_skill               = list(
		SKILL_HAULING       = SKILL_ADEPT, // overall physical activity
		SKILL_HUSBANDRY     = SKILL_BASIC, // handling and caring for animals
		SKILL_BOTANY        = SKILL_BASIC, // growing and harvesting plants, trees, etc
		SKILL_COOKING       = SKILL_BASIC, // butchery
		SKILL_CARPENTRY     = SKILL_ADEPT, // tree felling
	)
	skill_points            = 22

/obj/abstract/landmark/start/valSal_port/forester
	name                    = "Forester"
