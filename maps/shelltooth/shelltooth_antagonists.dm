/datum/map/shelltooth
	potential_theft_targets = list(
		"the tradehouse accounting documents"	= /obj/item/documents/tradehouse/account,
		"the tradehouse personnel data"			= /obj/item/documents/tradehouse/personnel,
		"the Captain's spare ID"				= /obj/item/card/id/captains_spare,
		"the ship's blueprints"					= /obj/item/blueprints,
		"the Matriarch's robes"					= /obj/item/clothing/under/yinglet/matriarch,
		"a jetpack"								= /obj/item/tank/jetpack/,
		"a pump action shotgun"					= /obj/item/gun/projectile/shotgun/pump/,
		"a health analyzer"						= /obj/item/scanner/health,
		"the integrated circuit printer"		= /obj/item/integrated_circuit_printer,
		"a whole uneaten mollusc"				= /obj/item/mollusc
	)
	
/datum/antagonist
	initial_spawn_req = 1
	initial_spawn_target = 1
	
/datum/antagonist/borer
	initial_spawn_req = 1
	initial_spawn_target = 1
	
/datum/antagonist/mercenary
	initial_spawn_req = 1
	initial_spawn_target = 2
	
/datum/antagonist/raider
	initial_spawn_req = 1
	initial_spawn_target = 2
	
/datum/antagonist/cultist
	initial_spawn_req = 1
	initial_spawn_target = 2
	
/datum/antagonist/renegade
	initial_spawn_req = 1
	initial_spawn_target = 2
	
/datum/antagonist/loyalist
	initial_spawn_req = 1
	initial_spawn_target = 2

/datum/antagonist/revolutionary
	initial_spawn_req = 1
	initial_spawn_target = 2