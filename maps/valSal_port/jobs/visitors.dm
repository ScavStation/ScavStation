/decl/department/valSal_port/visitors
	name                    = "Visitors"
	colour                  = "#685b40"
	display_color           = "#c4bc8c"

/datum/job/valSal_port/visitor
	abstract_type           = /datum/job/valSal_port/visitor
	department_types        = list(/decl/department/valSal_port/visitors)

/datum/job/valSal_port/visitor/traveller
	title                   = "Traveller"
	alt_titles              = list("Nomad", "Pilgrim", "Wanderer", "Exile","Vagabond", "Scoundrel", "Wayfarer", "Refugee", "Drifter", "Wretch")
	supervisors             = "your conscience"
	description             = "You have travelled to this area from elsewhere. You may be a vagabond, a wastrel, a nomad, or just passing through on your way to somewhere else. How long you're staying and where you're headed is up to you entirely."
	spawn_positions         = -1
	total_positions         = -1
	outfit_type             = /decl/outfit/job/valSal_port/traveller
	skill_points            = 20

/obj/abstract/landmark/start/valSal_port/traveller
	name                    = "Traveller"

/datum/job/valSal_port/visitor/traveller/learned
	title                   = "Scholar"
	// todo: outfits for alt-titles?
	alt_titles              = list("Monk", "Travelling Doctor" = /decl/outfit/job/valSal_port/traveller/doctor, "Dilettante", "Savant", "Philosopher", "Researcher", "Antiquarian")
	supervisors             = "your conscience"
	description             = "You are a skilled professional who has travelled to this area from elsewhere. You may be a doctor, a scholar, a monk, or some other highly-educated individual with rare skills. Whatever your reason for coming here, you are likely one of the only individuals in the area to possess your unique skillset."
	spawn_positions         = 2
	total_positions         = 2
	outfit_type             = /decl/outfit/job/valSal_port/traveller/scholar
	skill_points            = 26
	min_skill               = list(
		SKILL_LITERACY      = SKILL_MAX
	)
	max_skill               = list(
		SKILL_CHEMISTRY     = SKILL_MAX,
		SKILL_MEDICAL       = SKILL_MAX,
		SKILL_ANATOMY       = SKILL_MAX,
	)

/obj/abstract/landmark/start/valSal_port/traveller/learned
	name                    = "Scholar"

/datum/job/valSal_port/visitor/warrior
	title                   = "Warrior"
	alt_titles              = list("Mercenary", "Sellsword", "Fighter", "Brigand", "Myrmidon", "Bandit", "Soldier")
	supervisors             = "your vows"
	description             = "You are a wanderer talented in the arts of combat. You make for a handy fighter, but there's not much else you really know apart from that."
	spawn_positions         = 2
	total_positions         = 2
	outfit_type             = /decl/outfit/job/valSal_port/beggar_knight
	min_skill               = list(
		SKILL_COMBAT        = SKILL_ADEPT,
		SKILL_WEAPONS       = SKILL_ADEPT,
		SKILL_ATHLETICS     = SKILL_ADEPT
	)
	max_skill               = list(
		SKILL_COMBAT        = SKILL_MAX,
		SKILL_WEAPONS       = SKILL_MAX,
		SKILL_CARPENTRY     = SKILL_BASIC,
		SKILL_METALWORK     = SKILL_BASIC,
		SKILL_TEXTILES      = SKILL_BASIC,
		SKILL_STONEMASONRY  = SKILL_BASIC,
		SKILL_SCULPTING     = SKILL_BASIC,
		SKILL_ARTIFICE      = SKILL_BASIC,
		SKILL_FINANCE       = SKILL_NONE
	)

/obj/abstract/landmark/start/valSal_port/warrior
	name                    = "Warrior"


/datum/job/valSal_port/visitor/traveller/merchant
	title                   = "Travelling Merchant"
	alt_titles              = list("Peddler", "Trader", "Vendor", "Salesperson")
	supervisors             = "your vows, and and the call of coin"
	description             = "You are an ordained person of faith, travelling the lands on the business of your order, to preach, or simply to experience new people and cultures. You are battle-trained, but are also a healer."
	spawn_positions         = 2
	total_positions         = 2
	outfit_type             = /decl/outfit/job/valSal_port/traveller/merchant
	min_skill               = list(
		SKILL_COMBAT        = SKILL_ADEPT,
		SKILL_WEAPONS       = SKILL_ADEPT,
		SKILL_ATHLETICS     = SKILL_ADEPT
	)
	max_skill               = list(
		SKILL_COMBAT        = SKILL_MAX,
		SKILL_WEAPONS       = SKILL_MAX,
		SKILL_FINANCE       = SKILL_MAX,
		SKILL_LITERACY       = SKILL_MAX
	)
	skill_points            = 22

/obj/abstract/landmark/start/valSal_port/merchant
	name                    = "Travelling Merchant"
