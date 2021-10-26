/decl/cultural_info/faction/baxxid
	name = "Baxxid Nomad"
	description = "For myriad reasons, your people abandoned your homeworld for the stars, becoming nomads. \
	After some initial tensions with humankind, the Baxxid have become embedded in Human society, \
	carving a niche for themselves as accountants, researchers, and receptionists."
	subversive_potential = 25
	//make cooler and less crappy by at least fifteen ounces

/decl/cultural_info/culture/baxxid
	name =  "Baxxid Clans"
	description = "You represent one of the many Baxxid clans in society."
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign,
		/decl/language/baxxid
	)

	//ditto
	var/list/middle_syllables = list(
		"z",
		"e",
		"s",
		"r",
		"t",
		"tt",
		"rk",
		"a",
		"kk",
		"z",
	)
	var/list/end_syllables = list(
		"na",
		"kka",
		"kki",
		"kkit",
		"let",
		"ria",
		"pin",
		"ppie",
		"bzig",
		"jack",
		"s",
		"ck",
		"ss",
		"lly",
		"k",
		"t"
	)
	//fix for Baxxid naming conventions (ffBnc)

/decl/cultural_info/culture/baxxid/get_random_name(var/gender)
	// First syllable; ffBnc
	. = pick(global.alphabet_no_vowels)
	if(. == "h")
		if(prob(50))
			. = "[pick("c", "s")][.]"
	else if(prob(5))
		. += "r"
	. += pick(global.vowels)

	//Main body of name; ffBnc
	var/hyphenated = prob(10)
	var/syllables = hyphenated ? rand(1,2) : rand(1,3)
	for(var/i = 1 to syllables-1)
		. = "[.][pick(middle_syllables)][pick(global.vowels)]"

	// Terminate and format; ffBnc
	. += pick(end_syllables)
	. = capitalize(lowertext(.))
	if(hyphenated)
		. = "[.]-[.]"

