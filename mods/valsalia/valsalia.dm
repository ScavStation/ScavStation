#define SPECIES_BAXXID           "Baxxid"
#define SPECIES_INDREL           "Indrel"
#define SPECIES_YINGLET          "Yinglet"

#define BODY_FLAG_YINGLET        BITFLAG(10)
#define BODY_FLAG_BAXXID         BITFLAG(11)
#define BODY_FLAG_INDREL         BITFLAG(12)

#define BODYTYPE_YINGLET         "yinglet body"
#define BODYTYPE_BAXXID          "baxxid body"
#define BODYTYPE_INDREL          "indrel body"

/decl/modpack/valsalia
	name = "Val Salia Content"
	credits_topics = list(
		"MERCANTILISM",
		"ANCIENT SCAV EMBROIDERIES",
		"COMPETETIVE BARNACLE COLLECTING",
		"HEEDING THE CALL OF THE OCEAN",
		"INTERSPECIES SENSITIVITY",
		"GLOWY THINGS",
		"ILLICIT FENCED YINGLET EGGS",
		"AN UNWARRANTED FEAR OF BAXXID",
		"HOW TO CARING FOR TIPLOD"
	)
	dreams = list(
		"a starry sky", "blinking lights", "bronze axes", "mercenaries",
		"a beaker of strange but tasty liquid", "broken clamshells", "bones", "an intruder",
		"a toolbox", "the zappy", "a lesser human", "a gun",
		"a ruined enclave", "a planet", "a muddy beach", "the healing cuts",
		"the bridge", "an abandoned nursery", "an ID card", "furious indrel",
		"a yinglet", "a human", "an operating table", "the AI core",
		"a baxxid", "the tradehouse", "a set of nice lead dinnerware", "a quaint marketplace",
		"a desert expanse", "a boggy swamp", "a table, fast approaching", "tasty clams",
		"barnacles just out of reach", "a pink pill bottle", "clambreath", "an angry captain"
	)
	credits_other = list(
		"DEATH OF THE REED OF CARNAL BECKONING",
		"BOOZE AND SCAVS DON'T MIX",
		"BAXXID STARES LONGINGLY AT THE VENDING MACHINES",
		"MY BIG STRONG OGRESS GIRLFRIEND",
		"THE ISHERMEN",
		"THE SCAVSHANK REDEMPTION",
		"SPEEDY THE BRISTLEBACK DOG"
	)
	credits_crew_names = list("THE CREW", "THE ENCLAVE", "THE EXILES", "THE TRADEHOUSE", "THE BAXXID")
	credits_nouns = list("GOOD SCAVS", "VERY BAD SCAVS", "BROKEN MARKET PRICES", "SHINIEST GEMS FOR ZA MATRIARCH, YES")

/decl/modpack/valsalia/pre_initialize()
	..()
	SSmodpacks.default_submap_whitelisted_species |= SPECIES_YINGLET
	SSmodpacks.default_submap_whitelisted_species |= SPECIES_BAXXID
	SSmodpacks.default_submap_whitelisted_species |= SPECIES_INDREL
