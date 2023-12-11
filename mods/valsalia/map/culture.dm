var/global/list/alphabet_no_vowels = list("b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","z")

/decl/cultural_info/faction/enclave_ying
	name = "Scav"
	description = "Your people are scavengers and survivors, many of them living by riding the coattails of humanity. Any day where you aren't stepped on or beaten down by those much bigger and stronger than you is a good day."
	subversive_potential = 25

/decl/cultural_info/faction/tradehouse_ying
	name = "Tradehouse Ivenmoth"
	description = "You are a member of Tradehouse Ivenmoth, one of the most successful tradehouses in the universe and you know it which is why you wear your tradehouse reds with pride."


/decl/cultural_info/culture/yinglet

	name = "Enclave Yinglet"
	description = "You are a contributing member of a yinglet enclave, or at least someone who isn't too much of \
	a nusiance, and are likely in good standing with the matriarch and patriarches."
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign
	)
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

/decl/cultural_info/culture/yinglet/get_random_name(var/gender)
	// First syllable.
	. = pick(global.alphabet_no_vowels)
	if(. == "h")
		if(prob(50))
			. = "[pick("c", "s")][.]"
	else if(prob(5))
		. += "r"
	. += pick(global.vowels)

	//Main body of name.
	var/hyphenated = prob(10)
	var/syllables = hyphenated ? rand(1,2) : rand(1,3)
	for(var/i = 1 to syllables-1)
		. = "[.][pick(middle_syllables)][pick(global.vowels)]"

	// Terminate and format.
	. += pick(end_syllables)
	. = capitalize(lowertext(.))
	if(hyphenated)
		. = "[.]-[.]"

/decl/cultural_info/culture/yinglet/tribal
	name = "Tribal Yinglet"
	description = "You are a member of one of the southern yinglet tribes. Although similar to the other \
	clam-loving rat-birds of the yinglet species, the southern yinglets are more parochial, tribal and \
	generally less developed. Nobody is quite clear on which south they are from."
	// Names provided by esteemed wordsmith Val Salia.
	// Jesus Christ, Val.
	var/list/all_scav_names = list(
		"A Jerk",       "Argh",         "Armble",        "Atty",       "Babadoo",         "Bad Licker", "Bang",                   "Beets",
		"Beezy",        "Best",         "Big Time",      "Bikpin",     "Bingle",          "Blaps",      "Blip",                   "Bloo",
		"Bobo",         "Bola",         "Bonespine",     "Boomboom",   "Boppo",           "Brat",       "Breather",               "Brizzle",
		"Bumpy",        "Bupwup",       "Byby",          "Cember",     "Chees",           "Chobby",     "Clem",                   "Clepp",
		"Clippie",      "Cobble",       "Crimp",         "Crooovley",  "Crown",           "Crustle",    "Dandy",                  "Danger",
		"Day",          "Dirtkick",     "Doctor Feet",   "Dokkl",      "Dud",             "Eatmouth",   "Eeest",                  "Eezer",
		"Eyebrows",     "Facefat",      "Fatface",       "Fats",       "Faymble",         "Feathers",   "Feckt",                  "Fedge",
		"Fert",         "Fibble",       "Fingernail",    "Fingers",    "Finny",           "Flape",      "Fleeze",                 "Flem",
		"Flemmy",       "Flies",        "Flip",          "Flirt",      "Flop",            "Flounce",    "Forb",                   "Forby",
		"Fourth",       "Frimble",      "Funboy",        "Geer",       "Giant",           "Giggy",      "Gillagilla",             "Gipkup",
		"Gitchu",       "Gitts",        "Glaaab",        "Good Day",   "Graff",           "Gree-Gree",  "Green",                  "Grounder",
		"Gursh",        "Gympie",       "Gyne",          "Haha",       "Hairs",           "Hammy",      "Handsome",               "Handy",
		"Hedge",        "Hekhak",       "Hello",         "Helpy",      "Hickhack",        "Hilla",      "Hitting",                "Hoff",
		"Hokk",         "Holdie",       "Honey",         "Honk",       "Hooch",           "Hurting",    "Illuvia",                "Imbral",
		"Itcher",       "Jergfid",      "Jinga",         "Jingle",     "Jull",            "Justik",     "Kaka",                   "Kakkle",
		"Kallapalla",   "Kannip",       "Keefoo",        "Keel",       "Keepy",           "Kess",       "Kidney",                 "Kimple",
		"Koap",         "Kooba",        "Koyple",        "Kwype",      "Lalellilu",       "Lallybell",  "Lapple",                 "Leelay",
		"Leemore",      "Leep",         "Legs",          "Lellybelle", "Lembley",         "Lerpy",      "Lil Bitch",              "Limber",
		"Lingyet",      "Locky",        "Long One",      "Longbone",   "Longle",          "Love Beast", "Lumpin",                 "Lurps",
		"Magic Mindle", "Mar-Mar",      "Marble",        "Meat",       "Medicine Eater",  "Meelim",     "Melly",                  "Merb",
		"Middles",      "Minty",        "Mirabee",       "Mollin",     "Momo",            "Momomo",     "Monch",                  "Mook",
		"Moonshine",    "Mozza",        "Mubble",        "Mumbler",    "Nananana",        "Nase",       "Nazzie",                 "Nedge",
		"Nee",          "Neele",        "Nelbret",       "Nim",        "Ninine",          "No",         "Noba",                   "Nock",
		"Noos",         "Norlip",       "Noseface",      "Nurr",       "Nutria",          "Nuts",       "Oable",                  "Okay",
		"Onion",        "Orange Brain", "Paddl",         "Parge",      "Patpat",          "Pawley",     "Pazzler",                "Peela",
		"Peg",          "Pfhorble",     "Physical Pain", "Picker",     "Pim",             "Pim-Pim",    "Pinklerusheptivaltossa", "Piplip",
		"Pipper",       "Pippie",       "Pitpit",        "Plorkins",   "Plum",            "Pointer",    "Pomp",                   "Potat",
		"Preen-Preen",  "Prepper",      "Primpling",     "Privvy",     "Promley",         "Pulpy",      "Pult",                   "Pyple",
		"Quizlet",      "Rainbow",      "Rally",         "Rawnie",     "Really Big Rock", "Risky",      "Roil",                   "Zoozoo",
		"Roon",         "Rumm",         "Rushie",        "Salt",       "Sarble",          "Saxle",      "Scab",                   "Seeksey",
		"Seevle",       "Sesp",         "Shiny",         "Shupshup",   "Siv",             "Skeezo",     "Skins",                  "Skozzy",
		"Skreemy",      "Slappy",       "Sleeb",         "Sloof",      "Smigg",           "Smiles",     "Snally",                 "Snapper",
		"Sneeze",       "Snyble",       "Soop",          "Speff",      "Spooney",         "Spray",      "Stank",                  "Star Head",
		"Steezia",      "Stepper",      "Stimp",         "Stints",     "Stop",            "Strassle",   "Stroon",                 "Stukk",
		"Stumbler",     "Suds",         "Sunshine",      "Swermey",    "Swimp",           "Swinn",      "Take",                   "Tally",
		"Tarbles",      "Tarmby",       "Teemy",         "Teeple",     "Temby",           "Terrible",   "That",                   "That One",
		"The Clap",     "The Shocker",  "The Skin",      "The Worst",  "Thimp",           "Thirsty",    "Thousand",               "Thwemp",
		"Thwip",        "Tingles",      "Tink",          "Toble",      "Toes",            "Tope",       "Tossie",                 "Toughkidney",
		"Tozzby",       "Trale",        "Tremble",       "Trouble",    "Truffle",         "Tukk",       "Twelve",                 "Twitchy",
		"Two-Eyes",     "Typ-Typ",      "Ugly",          "Uh Oh",      "Vazlip",          "Vemple",     "Vermie",                 "Vistle",
		"Wail",         "Walker",       "Weedy",         "Weemly",     "Wet",             "Wethands",   "Whag",                   "Wheem",
		"Whemble",      "Whine",        "Whirly",        "Whistle",    "Whoops",          "Whurp",      "Why",                    "Wobble",
		"Woobie",       "Woomy",        "Workwork",      "Wupwup",     "Wurp",            "Yewkka",     "Yogurp",                 "Yubley",
		"Zeez",         "Zerb",         "Zerk",          "Zibzab",     "Zink"
	)

/decl/cultural_info/culture/yinglet/tribal/get_random_name(var/gender)
	. = pick(all_scav_names)

/decl/cultural_info/culture/yinglet/void
	name = "Void Scav"
	description = "You are a crew member of a space station or ship that is usually not completely controlled by \
	Yinglets and as such you are accustomed to living amogst the stars."
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign
	)

/decl/cultural_info/location/yingletacrology
	name = "Enclave Arcology"
	description = "Out of the many known planets, it is without a doubt that there are some that have been completely overrun by Yinglets to the point that \
	the planet is essentially one giant enclave."
	distance = "Various"
	capital = "Various"
	economic_power = 1
	ruling_body = "The Great Enclaves"

/decl/cultural_info/location/tradehousespace
	name = "Tradehouse Controlled"
	description = "Tradehouse Ivenmoth grew from humble beginnings within the city of Val Salia to spanning multiple planets and stations."
	distance = "Various"
	capital = "Val Salia"
	economic_power = 1
	ruling_body = "Tradehouse Ivenmoth"

/decl/cultural_info/religion/enclave
	name = "Enclave Pantheon"
	description = " You are one of the many yinglets who believe in the spiritual guidance of the The Great Leader and the many Matriarchs and Patriarchs he spanwed \
	from his bloodline."