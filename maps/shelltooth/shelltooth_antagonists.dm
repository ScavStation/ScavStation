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

/decl/special_role
	initial_spawn_req = 1
	initial_spawn_target = 1

/decl/special_role/borer
	initial_spawn_req = 1
	initial_spawn_target = 1

/decl/special_role/mercenary
	initial_spawn_req = 1
	initial_spawn_target = 2

/decl/special_role/raider
	initial_spawn_req = 1
	initial_spawn_target = 2

/decl/special_role/cultist
	initial_spawn_req = 1
	initial_spawn_target = 2

/decl/special_role/renegade
	initial_spawn_req = 1
	initial_spawn_target = 2

/decl/special_role/loyalist
	initial_spawn_req = 1
	initial_spawn_target = 2

/decl/special_role/revolutionary
	initial_spawn_req = 1
	initial_spawn_target = 2