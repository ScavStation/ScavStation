/decl/department/valSal_port/patriarch
	name                    = "Patriarch"
	colour                  = "#118a11"
	display_color           = "#106826"

/datum/job/valSal_port/enclavecommand
	abstract_type           = /datum/job/valSal_port/enclavecommand
	department_types        = list(/decl/department/valSal_port/patriarch)

/datum/job/valSal_port/enclavecommand/matriarch
	title                   = "Matriarch"
	description             = "You are the Matriarch, and it is your duty to watch over and nourish the Enclave. It's well-being is your responsibility."
	supervisors             = "The Patriarchs and The Elders"
	required_gender         = FEMALE
	spawn_positions         = 1
	total_positions         = 1
	outfit_type             = /decl/outfit/job/valSal_port/matriarch
	min_skill               = list(
		SKILL_LITERACY      = SKILL_MAX, // reading and writing
		SKILL_COOKING       = SKILL_ADEPT, // butchery
		SKILL_CHEMISTRY     = SKILL_ADEPT // making medicines
	)
	max_skill               = list(
		SKILL_ANATOMY        = SKILL_MAX,
		SKILL_MEDICINE        = SKILL_MAX,
		SKILL_CHEMISTRY       = SKILL_MAX
	)
	skill_points            = 30
	department_types = list(/decl/department/enclavecommand)

/obj/abstract/landmark/start/valSal_port/matriarch
	name                    = "Matriarch"

/datum/job/valSal_port/enclavecommand/farmpatriarch
	title                   = "Patriarch of Farming"
	alt_titles              = list("Patriarch of Foodstuffs", "Patriarch of Growing", "Patriarch of Gardening")
	description             = "You are a Patriarch, a particularly talented individual who has been appointed by the Matriarch and other Patriarchs due to your skill. You set an example for the enclave."
	supervisors             = "The Matriarch, your fellow Patriarchs and The Elders"
	required_gender         = MALE
	spawn_positions         = 1
	total_positions         = 1
	outfit_type             = /decl/outfit/job/valSal_port/patriarch
	min_skill               = list(
		SKILL_LITERACY      = SKILL_BASIC, // reading and writing
		SKILL_COOKING       = SKILL_ADEPT, // cooking
		SKILL_FINANCE	    = SKILL_ADEPT, // managing resources
		SKILL_BOTANY	    = SKILL_ADEPT, // growing food
	)
	max_skill               = list(
		SKILL_COMBAT          = SKILL_MAX,
		SKILL_ANATOMY         = SKILL_MAX,
		SKILL_MEDICINE        = SKILL_MAX,
		SKILL_CHEMISTRY       = SKILL_MAX
	)
	skill_points            = 21
	department_types = list(/decl/department/enclavecommand)

/obj/abstract/landmark/start/valSal_port/patriarch
	name                    = "Patriarch of Farming"

/datum/job/valSal_port/enclavecommand/huntpatriarch
	title                   = "Patriarch of Hunting"
	alt_titles              = list("Patriarch of War", "Patriarch of Fighting", "Patriarch of Stabbing")
	description             = "You are a Patriarch, a particularly talented individual who has been appointed by the Matriarch and other Patriarchs due to your skill. You set an example for the enclave."
	supervisors             = "The Matriarch, your fellow Patriarchs and The Elders"
	required_gender         = MALE
	spawn_positions         = 1
	total_positions         = 1
	outfit_type             = /decl/outfit/job/valSal_port/patriarch
	min_skill               = list(
		SKILL_LITERACY      = SKILL_BASIC, // reading and writing
		SKILL_COMBAT       = SKILL_ADEPT, // research
		SKILL_FINANCE	    = SKILL_ADEPT, // managing resources
		SKILL_WEAPONS	    = SKILL_ADEPT, // shooting
	)
	max_skill               = list(
		SKILL_BOTANY          = SKILL_ADEPT,
		SKILL_SCIENCE          = SKILL_ADEPT,
		SKILL_ANATOMY         = SKILL_MAX,
		SKILL_COMBAT       = SKILL_MAX, // research
		SKILL_WEAPONS	    = SKILL_MAX, // shooting
		SKILL_MEDICINE        = SKILL_MAX,
		SKILL_CHEMISTRY       = SKILL_MAX
	)
	skill_points            = 26
	department_types = list(/decl/department/enclavecommand)

/obj/abstract/landmark/start/valSal_port/huntpatriarch
	name                    = "Patriarch of Hunting"

/datum/job/valSal_port/enclavecommand/craftpatriarch
	title                   = "Patriarch of Construction"
	alt_titles              = list("Patriarch of Crafting", "Patriarch of Building", "Patriarch of Making")
	description             = "You are a Patriarch, a particularly talented individual who has been appointed by the Matriarch and other Patriarchs due to your skill. You set an example for the enclave."
	supervisors             = "The Matriarch, your fellow Patriarchs and The Elders"
	required_gender         = MALE
	spawn_positions         = 1
	total_positions         = 1
	outfit_type             = /decl/outfit/job/valSal_port/patriarch
	min_skill               = list(
		SKILL_SCULPTING      = SKILL_BASIC, // clayworking
		SKILL_CONSTRUCTION  = SKILL_ADEPT, // woodworking
		SKILL_TEXTILES	    = SKILL_ADEPT, // weaving
		SKILL_HAULING	    = SKILL_ADEPT // moving things
	)
	max_skill               = list(
		SKILL_BOTANY          = SKILL_ADEPT,
		SKILL_SCIENCE          = SKILL_ADEPT,
		SKILL_ANATOMY         = SKILL_MAX,
		SKILL_MEDICINE        = SKILL_MAX,
		SKILL_CHEMISTRY       = SKILL_MAX
	)
	skill_points            = 20
	department_types = list(/decl/department/enclavecommand)

/obj/abstract/landmark/start/valSal_port/craftpatriarch
	name                    = "Patriarch of Construction"

/datum/job/valSal_port/enclavecommand/healpatriarch
	title                   = "Patriarch of Healing"
	alt_titles              = list("Patriarch of Medicine", "Patriarch of Care", "Patriarch of Curing")
	description             = "You are a Patriarch, a particularly talented individual who has been appointed by the Matriarch and other Patriarchs due to your skill. You set an example for the enclave."
	supervisors             = "The Matriarch, your fellow Patriarchs and The Elders"
	required_gender         = MALE
	spawn_positions         = 1
	total_positions         = 1
	outfit_type             = /decl/outfit/job/valSal_port/patriarch
	min_skill               = list(
		SKILL_MEDICINE      = SKILL_MAX, // applying medicine
		SKILL_ANATOMY       = SKILL_ADEPT, // surgery
		SKILL_CHEMISTRY	    = SKILL_ADEPT, // tincture crafting
		SKILL_LITERACY	    = SKILL_BASIC // reading and writing
	)
	max_skill               = list(
		SKILL_LITERACY          = SKILL_ADEPT,
		SKILL_MEDICAL	   = SKILL_MAX,
		SKILL_ANATOMY           = SKILL_MAX,
		SKILL_CHEMISTRY         = SKILL_MAX,
		SKILL_SCIENCE          = SKILL_ADEPT
	)
	skill_points            = 51
	department_types = list(/decl/department/enclavecommand)

/obj/abstract/landmark/start/valSal_port/healpatriarch
	name                    = "Patriarch of Healing"
