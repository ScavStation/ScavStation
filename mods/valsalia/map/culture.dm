var/global/list/alphabet_no_vowels = list("b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","z")

// Yinglet Cultures & Heritages - Changes and additions thanks to Val's input; CEG's description making 2/28/2025 --SAR
/decl/background_detail/faction/enclave_scav
	name = "Yinglet Enclaves"
	description = "You are loyal to your enclaves first and foremost, and by extension, The Elders. They probably have everything sorted out, and it’s best \
	to trust in your matriarch, your patriarchs, and anyone that seems smarter than you."
	subversive_potential = 25
	uid = "scav_background_faction_enclave"

/decl/background_detail/faction/tradehouse_scav
	name = "TradeHouse Ivenmoth"
	description = "You “work” for Tradehouse Ivenmoth, the Tradehouse currently in charge of the city of Val Salia, and headed by Viracroix Salia, the scholarly \
	Trademaster. Ivenmoth provides many services in trade, manufacturing, and guard work, with a focus on cooperation between peoples and a greater understanding \
	of the world. You probably mostly do odd jobs for them, and don’t command much respect."
	uid = "scav_background_faction_tradehouse"

/decl/background_detail/faction/exiled_scav
	name = "Exiled"
	description = "You are an exile, cast out from your society for bad behaviour, a crime, or generally just being unlikable. Whatever the reason, you’re on your \
	own now… and it was hoped that you wouldn’t last very long because of that fact."
	subversive_potential = 40
	uid = "scav_background_faction_exile"

/decl/background_detail/faction/wanderer
	name = "Wanderer"
	description = "You are unaffiliated with anyone."
	subversive_potential = 25
	uid = "scav_background_faction_other"

/decl/background_detail/heritage/yinglet

	name = "Central Enclave Yinglet"
	description = "You come from one of the Central Enclaves, grand in scale with a population in the hundreds, potentially even thousands. You lived under \
	the control and guidance of the Elders, who knew what was best for you. It’s also likely you might be a little more knowledgeable than your rural cousins."
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign
	)
	uid = "scav_background_heritage_central_enclave"
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

/decl/background_detail/heritage/yinglet/get_random_name(var/gender)
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

/decl/background_detail/heritage/yinglet/valsalian

	name = "ValSalian Enclave Yinglet"
	description = "You come from the most northern enclave, located near the city of Val Salia. Because of its proximity to the city, you’ve regularly seen, and \
	perhaps interacted with different species, like humans or baxxid. You might've become a bit more cosmopolitan, and strayed from convention."
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign
	)
	uid = "scav_background_heritage_valsalian_enclave"

/decl/background_detail/heritage/yinglet/tribal
	name = "Rural Enclave Yinglet"
	description = "You come from a rural enclave farther away from the control of the Elders. Your enclave was likely small, with a smaller population and \
	not many females to speak of. If it weren’t for the continued guidance of your matriarch, it might’ve burned down."
	uid = "scav_background_heritage_rural_enclave"

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

/decl/background_detail/heritage/yinglet/tribal/get_random_name(var/gender)
	. = pick(all_scav_names)

/decl/background_detail/heritage/yinglet/void
	name = "Void Scav"
	description = "You are a crew member of a space station or ship that is usually not completely controlled by \
	Yinglets and as such you are accustomed to living amogst the stars."
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign
	)
	uid = "scav_background_heritage_void"

/decl/background_detail/heritage/yinglet/other
	name = "Other"
	description = "You come from somewhere else."
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign
	)
	uid = "scav_background_heritage_other"

/decl/background_detail/location/yingletacrology
	name = "Enclave Arcology"
	description = "Out of the many known planets, it is without a doubt that there are some that have been completely overrun by Yinglets to the point that \
	the planet is essentially one giant enclave."
	distance = "Various"
	capital = "Various"
	economic_power = 1
	ruling_body = "The Great Enclaves"
	uid = "scav_background_location_arcology"

/decl/background_detail/location/tradehousespace
	name = "Tradehouse Controlled"
	description = "Tradehouse Ivenmoth grew from humble beginnings within the city of Val Salia to spanning multiple planets and stations."
	distance = "Various"
	capital = "Val Salia"
	economic_power = 1
	ruling_body = "Tradehouse Ivenmoth"
	uid = "scav_background_location_tradehouse"


/decl/background_detail/religion/dinnaism
	name = "Dinnaism"
	description = "Dinnaism is the national faith of the Dinnish people. It is the belief that the mythic founder and cultural ancestor of the Dinnish people, called \
	Dinn, would descend from the Heavenly Veil and save Dinnlan in its greatest time of need."
	uid = "scav_background_religion_dinnaism"

/decl/background_detail/religion/veil_worship
	name = "Veil Worship"
	description = "Veil Worship is the spiritual belief that the Heavenly Veil which can be seen in the sky holds some kind of divine importance. This belief is varied,\
	 and the Heavenly Veil has many names, like the Sailor’s Plume, Well of Souls, and the Eye of the Terrible Cosmic Horror That Watches and Waits Unsleeping For the Right\
	  Moment to Devour Us All."
	uid = "scav_background_religion_veil_worship"

/decl/background_detail/religion/angel_worship
	name = "Angel Worship"
	description = "Angel Worship is the spiritual belief that thousands of years ago, angels descended from the Heavenly Veil and left gifts for the people of this world \
	in the form of antiquities, and then left once again once they deposited their heavenly artifacts upon the world."
	uid = "scav_background_religion_angel_worship"

/decl/background_detail/religion/ancestor_worship
	name = "Ancestor Worship"
	description = "Ancestor worship is a veneration of one's own ancestors, with a general focus on continuing their legacy and praying to them in times of need."
	uid = "scav_background_religion_ancestor_worship"

/decl/background_detail/religion/faithless
	name = "Faithless"
	description = "You do not hold any particular faith."
	uid = "scav_background_religion_faithless"