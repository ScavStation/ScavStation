/decl/department/valSal_port/yinglets
	name                    = "Yinglets"
	colour                  = "#118a11"
	display_color           = "#106826"

/datum/job/valSal_port/enclave
	abstract_type           = /datum/job/valSal_port/enclave
	department_types        = list(/decl/department/valSal_port/yinglets)

/datum/job/valSal_port/enclave/matriarch
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
	skill_points            = 26

/obj/abstract/landmark/start/valSal_port/matriarch
	name                    = "Matriarch"

/datum/job/valSal_port/enclave/patriarch
	title                   = "Patriarch"
	alt_titles              = list("Patriarch of Farming", "Patriarch of Healing", "Patriarch of Construction", "Patriarch of Hunting", "Patriarch of Scavenging", "Patriarch of Scouting")
	description             = "You are a Patriarch, a particularly talented individual who has been appointed by the Matriarch and other Patriarchs due to your skill. You set an example for the enclave."
	supervisors             = "The Matriarch, your fellow Patriarchs and The Elders"
	required_gender         = MALE
	spawn_positions         = 4
	total_positions         = 4
	outfit_type             = /decl/outfit/job/valSal_port/patriarch
	min_skill               = list(
		SKILL_LITERACY      = SKILL_BASIC, // reading and writing
		SKILL_SCIENCE       = SKILL_BASIC, // research
		SKILL_FINANCE	    = SKILL_ADEPT // managing resources
	)
	max_skill               = list(
		SKILL_COMBAT          = SKILL_MAX
		SKILL_ANATOMY         = SKILL_MAX,
		SKILL_MEDICINE        = SKILL_MAX,
		SKILL_CHEMISTRY       = SKILL_MAX
	)
	skill_points            = 22

/obj/abstract/landmark/start/valSal_port/patriarch
	name                    = "Patriarch"

/datum/job/valSal_port/enclave/daughter
	title                   = "Daughter"
	alt_titles              = list("Life-Giver", "Spear-Dancer" = /decl/outfit/job/valSal_port/dancer, "Culture-Keeper")
	description             = "You are a daughter, a bearer of life for the enclave, and a keeper of your people's history. A main goal for you would to be to study and write, and you enjoy certain privileges over the rest of the enclave."
	supervisors             = "The Matriarch, The Patriarchs and The Elders"
	required_gender         = FEMALE
	spawn_positions         = 3
	total_positions         = 3
	outfit_type             = /decl/outfit/job/valSal_port/daughter
	min_skill               = list(
		SKILL_LITERACY      = SKILL_MAX, // reading and writing
		SKILL_COOKING       = SKILL_AVERAGE, // butchery
		SKILL_ARTIFICE      = SKILL_ADEPT // making things
	)
	max_skill               = list(
		SKILL_ANATOMY         = SKILL_MAX,
		SKILL_MEDICINE        = SKILL_MAX,
		SKILL_CHEMISTRY       = SKILL_MAX
	)
	skill_points            = 18

/obj/abstract/landmark/start/valSal_port/daughter
	name                    = "Daughter"

/datum/job/valSal_port/enclave/digger
	title                   = "Rock Digger"
	alt_titles              = list("Miner", "Scavenger", "Tunneler")
	description             = "You dig up rocks and ore from the nearby cliffside, and the caverns within. What's gathered there will surely be of use to your enclave!"
	supervisors             = "The Patriarchs and The Matriarch"
	spawn_positions         = 3
	total_positions         = 3
	outfit_type             = /decl/outfit/job/valSal_port/miner
	min_skill               = list(
		SKILL_HAULING       = SKILL_ADEPT, // general physical activity
		SKILL_METALWORK     = SKILL_ADEPT, // ore smelting, metallurgy
		SKILL_STONEMASONRY  = SKILL_ADEPT, // experienced working with stone
		SKILL_SCULPTING     = SKILL_BASIC // producing clay molds, firing pottery
	)
	skill_points            = 16

/obj/abstract/landmark/start/valSal_port/miner
	name                    = "Rock Digger"

/datum/job/valSal_port/enclave/reedtender
	title                   = "Reed Tender"
	alt_titles              = list("Farmer", "Herbalist", "Grower")
	description             = "You collect and grow plants and herbs and process them into various useful substances, such as medicinal tinctures, ointments, and teas."
	supervisors             = "The Patriarchs and the Matriarch"
	spawn_positions         = 3
	total_positions         = 3
	outfit_type             = /decl/outfit/job/valSal_port/herbalist
	min_skill               = list(
		SKILL_BOTANY        = SKILL_ADEPT, // growing, processing, and identifying plants
		SKILL_MEDICAL       = SKILL_BASIC, // identifying illnesses and applying medicines
		SKILL_CHEMISTRY     = SKILL_BASIC // processing plant extracts into tinctures, ointments, etc
	)
	max_skill               = list(
		SKILL_MEDICAL       = SKILL_MAX,
		SKILL_ANATOMY       = SKILL_MAX,
		SKILL_CHEMISTRY     = SKILL_MAX
	)
	skill_points            = 16

/obj/abstract/landmark/start/valSal_port/reedtender
	name                    = "Reed Tender"

/datum/job/valSal_port/enclave/hunter
	title                   = "Hunter"
	alt_titles              = list("Tracker", "Scrapper", "Stabber", "Fisherying")
	description             = "You are a hunter, bred to track down and slaughter prey for your enclave to eat. Your duties are supplying food and skinning any animal you hunt."
	supervisors             = "The Patriarchs, The Matriarch, and your natural impulses"
	spawn_positions         = 3
	total_positions         = 3
	outfit_type             = /decl/outfit/job/valSal_port/hunter
	min_skill               = list(
		SKILL_HAULING       = SKILL_ADEPT, // overall physical activity
		SKILL_HUSBANDRY     = SKILL_BASIC, // handling and caring for animals
		SKILL_COMBAT        = SKILL_AVERAGE, // fighting against threats
		SKILL_COOKING       = SKILL_BASIC, // butchery
		SKILL_WEAPONS       = SKILL_AVERAGE // shooting accuracy
	)
	skill_points            = 18

/obj/abstract/landmark/start/valSal_port/hunter
	name                    = "Hunter"

/datum/job/valSal_port/enclave/scout
	title                   = "Scout"
	alt_titles              = list("Surveyor", "Searcher", "Spy")
	description             = "You are a scout, and you're best at scoping out locations and finding things. It's your job to see what's ahead and to report back."
	supervisors             = "The Patriarchs and The Matriarch"
	spawn_positions         = 3
	total_positions         = 3
	outfit_type             = /decl/outfit/job/valSal_port/scout
	min_skill               = list(
		SKILL_HAULING       = SKILL_EXPERT, // overall physical activity
		SKILL_HUSBANDRY     = SKILL_BASIC, // handling and caring for animals
		SKILL_WEAPONS       = SKILL_ADEPT, // fighting against threats
		SKILL_COOKING       = SKILL_BASIC, // butchery
		SKILL_CARPENTRY     = SKILL_ADEPT // building camps
	)
	skill_points            = 16

/obj/abstract/landmark/start/valSal_port/scout
	name                    = "Scout"

/datum/job/valSal_port/enclave/idiot
	title                   = "Idiot"
	alt_titles              = list("Problem", "Scav", "Dingus")
	description             = "You are simply the worst."
	supervisors             = "You answer to your primitive thoughts"
	spawn_positions         = 1
	total_positions         = 1
	outfit_type             = /decl/outfit/job/valSal_port/idiot
	skill_points            = 2

/obj/abstract/landmark/start/valSal_port/idiot
	name                    = "Idiot"
