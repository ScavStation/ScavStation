/datum/job/submap
	whitelisted_species = list(SPECIES_HUMAN, SPECIES_YINGLET)

/decl/submap_archetype
	whitelisted_species = list(SPECIES_HUMAN, SPECIES_YINGLET)

/datum/map/tradeship
	lobby_tracks = list(/decl/music_track/zazie)
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
		"a whole uneaten mollusc"				= /obj/item/mollusc,
		"a yinglet egg"							= /obj/item/yinglet_egg
	)

/datum/computer_file/program/merchant //wild capitalism
	required_access = null

/datum/trader/books
	name = "Yinglet book merchant"
	wanted_items = list(/obj/item/mollusc/clam = TRUE)
	possible_wanted_items = list(
		/obj/item/mollusc = TRADER_ALL,
		/obj/item/chems/food/fish/mollusc = TRADER_ALL
	)
	want_multiplier = 50 // pay good money for clam
