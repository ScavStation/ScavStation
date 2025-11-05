/decl/language/varak
	name = "Old Yingish"
	desc = "An offshoot of Olde Common, rendered unrecognizable after centuries of use by far-off Yinglet enclaves."
	speech_verb = "states"
	exclaim_verb = "objects"
	ask_verb = "inquiries"
	space_chance = 30
	key = "V"
	flags = LANG_FLAG_WHITELISTED | LANG_FLAG_NO_STUTTER
	machine_understands = 1
	partial_understanding = list(
		/decl/language/human/common = 30
	)
	syllables = list(
		"za", "az", "u", "u", "s", "sa", "ame", "bat", "viit", "abi", "fu", "ro", "uri", "zh", "dh", "ra", "ri", "wa", "ta", "to", "po", "poo", "ka", "ki"
	)



/decl/language/varak/scramble(mob/living/speaker, input, list/known_languages)

	var/understand_chance = 0
	for(var/decl/language/L in known_languages)
		if(LAZYACCESS(partial_understanding, L.name))
			understand_chance += partial_understanding[L.name]

	var/list/replacemap = list(
		"sauri" = list("apology", "sorry", "condolences", "consolation", "consoled", "consoling", "apologize", "apologizing", "apologise", "apologising", "apologized", "apologised"),
		"arra" = list("arm", "arms", "arming", "armed", "limb", "limbs"),
		"amero" = list("armor", "plating", "plated", "protective", "protect", "shield", "block", "armored", "armour", "armours", "armors", "armoured", "blocked", "blocks", "blocking", "blocker", "protecting", "protected", "protects", "protector"),
		"auww" = list("augh", "ow", "oof", "argh", "ouch", "pain", "painful", "pains", "pained"),
		"batan" = list("baton", "bat", "bludgeon", "stick", "club", "rod", "dowel", "shaft"),
		"bifu" = list("beef", "meat", "pork", "protein"),
		"ceg" = list("god"),
		"behu" = list("behind", "rear", "rearmost", "back", "backside", "bottom", "under", "stern", "sternside", "backward", "backwards", "down", "short", "low"),
		"viitasa" = list("life", "lives", "living", "alive", "lived", "vital", "vitals", "vitality", "blood", "bloody", "bleed", "bleeding", "bleeds", "bled", "goo", "goop", "juice", "juices", "juiced", "juicing", "juicer", "juicy"),
		"blaabi" = list("blob", "blobs", "blobbed", "blobber", "blobby", "blobbing", "slime", "slimes", "slimer", "slimy", "slimier", "slimiest", "slimed", "thing", "things", "stuff", "stuffed", "stuffing", "stuffy"),
		"corat" = list("box", "crate", "barrel", "receptacle", "vessel", "urn", "pot"),
		"borok" = list("break", "damage", "vandalize", "vandalise"),
		"egaag" = list("egg", "eggs", "egging", "egged", "invest", "investment", "investing", "invested", "investor", "investors", "invests", "finance", "financing", "finances", "financed", "financier"),
		"faras" = list("bright", "flash", "flashing", "blinding", "blank", "white", "blind"),
		"haatmaan" = list("hate", "hatred", "hates", "hating", "hated", "hater", "captain", "captains", "captaining", "captained", "authority", "authorities", "authorize", "authorise", "authorized", "authorised", "authorizing", "authorising", "authoritative", "power", "powers", "powered"),
		"taransa" = list("clear", "transparent", "gas", "invisible", "unseen", "unknowable"),
		"saabi" = list("comfort", "comfy", "cozy", "cushy", "soft", "comfortable", "comforting"),
		"vees" = list("compare", "contrast", "compared", "versus", "rival", "rivalry", "comparison", "contrasting"),
		"eletor" = list("electronic", "electric", "electrical", "electronics", "electrified", "computer", "computers", "compute", "computed", "computing", "computes", "digital", "digitized", "digitised", "digitize", "digitise"),
		"effu" = list("confidence", "confident", "assured", "assure", "confide", "complacent", "assurance", "insurance", "assuage"),
		"adjat" = list("contemporary", "contemporaries", "contemporaneous", "current", "currents", "electricity", "electric", "electrical", "electrician", "wire", "wired", "wiring", "wires", "adolescent", "adolescence", "adolescents", "teen", "teens", "teenaged", "teenager", "teenagers"),
		"cooru" = list("cool", "awesome", "grand", "great", "cold", "frigid", "chilly", "chill", "freezing", "freeze", "frozen", "froze", "frosty", "icy", "ice"),
		"kaaps" = list("dead", "death", "deaths", "dying", "died", "dies", "corpse", "corpses", "corpsing"),
		"theeta" = list("drama", "dramas", "dramatic", "dramatist", "dramatism", "theatre", "theater", "theatric", "theatrical", "chaos", "chaotic", "ridicule", "ridicules", "ridiculing", "ridiculed", "ridiculousness"),
		"shoshi" = list("decision", "shush", "decide", "deciding", "decided", "choice", "choose", "chose", "chooses", "choosing", "choices", "option", "options"),
		"dereca" = list("delightful", "good", "wonderful", "excellent", "excel", "excelling"),
		"desseto" = list("dexterous", "skill", "dexterity", "skilled", "skillful", "talented", "talent", "talents", "skills", "experience", "experiences", "experienced"),
		"drono" = list("drone", "robot", "drones", "robots", "robotic", "synthetic", "synth", "synthesized", "synthesised", "artificial", "fake", "faking", "faked", "fakes", "faker"),
		"expar" = list("elaborate", "elaboration", "explain", "explanation", "elaborated", "elaborating", "explaining", "explains", "explained", "lecture", "lecturing", "lectured", "told", "tell", "telling"),
		"emohi" = list("feeling", "feel", "felt", "emotion", "emoting", "emotions", "emotional", "sensitive", "sensitivity", "sense", "sensation", "touch", "touched", "touching"),
		"fek" = list("feck", "fekk", "fek", "fuck", "shit", "damn", "ass", "butt", "poop", "pee"),
		"fekka" = list("fecker", "fekker", "feker", "fucker", "bitch", "cunt", "bastard", "motherfucker", "asshole", "peepee", "poopoo", "dumbass", "dumbfuck", "dumbshit"),
		"feesh" = list("fish", "fisher", "fisherman", "fisherwoman", "fishers", "fished", "fishing", "carp", "carps", "pike", "pikes", "piranha", "piranhas", "monster", "monsters"),
		"fira" = list("forged", "forge", "create", "creating", "creation", "created", "forging", "craft", "crafting", "crafted", "devised", "devising"),
		"ferin" = list("friend", "friendly", "ally", "compatriot", "comrade", "allies", "allied"),
		"gamar" = list("game", "games", "gaming", "gamer", "entertainment", "entertainer", "entertain", "entertaining", "entertained", "entertains", "fun", "funny", "enjoy", "enjoying", "enjoyed", "enjoys", "enjoyer"),
		"gaharu" = list("gross", "eww", "ew", "ick", "yuck", "disgusting", "disgust", "disgusted", "horrible", "horrid", "horrifying", "horrified", "horrifies"),
		"guh" = list("guh"),
		"balisti" = list("gun", "guns", "gunner", "gunning", "gunned", "bolt", "bolts", "bolted", "bolting", "crossbow", "arrow", "arrows", "projectile", "projectiles", "crossbows", "slingshot", "slingshots", "pebble", "pistol", "shotgun", "handgun", "bullet"),
		"feengi" = list("hand", "hands", "handing", "handed", "handy", "finger", "fingers", "fingering", "fingered"),
		"hapi" = list("happiness", "happy", "happier", "happiest"),
		"neveg" = list("bad", "terrible", "terror", "terrifying", "terrified", "terrifies", "terrorise", "terrorize", "evil", "enemy", "nemesis", "enemies"),
		"emu" = list("I", "I'm", "I'd", "I'll", "am"),
		"porofi" = list("important", "extreme", "powerful", "power", "necessary", "necessity", "need", "needs", "needing", "necessitation", "powers", "magic", "magical", "majick", "majykk"),
		"garan" = list("intimidating", "intimidate", "intimidates", "intimidated", "threaten", "threat", "threatening", "threatens", "threatened", "threats", "fear", "fears", "fearful", "feared", "fearing", "scare", "scary", "scared", "scares"),
		"ishhi" = list("itchy", "irritating", "irritate", "irritated", "irritates", "annoy", "annoying", "annoyed", "annoys", "bother", "bothering", "bothered", "bothers", "nuisance", "nuisances"),
		"jaajumi" = list("judgement", "judge", "judging", "judged", "judges", "opinion", "opinionated", "opine", "opinions", "assume", "assumption", "assuming", "assumed", "assumes"),
		"raati" = list("later", "late", "eventual", "eventually", "sometime"),
		"exutu" = list("leave", "leaving", "leaves", "exit", "exiting", "exited", "exits", "door", "doors", "doorway", "doorways", "hall", "hallways"),
		"refet" = list("left", "port", "portside", "leftmost"),
		"waru" = list("location", "locate", "locating", "locator", "located", "locus", "place", "placement", "placing", "placed", "places", "aware", "awareness"),
		"shaara" = list("Sharah", "matriarch", "matriarchs", "matriarching", "matriarchy", "lady", "ladies", "women", "womens", "woman", "womaning"),
		"exapat" = list("masterful", "master", "mastery", "mastered", "mastering", "masters", "expert", "expertise", "experts", "champion", "championing", "championed", "champions"),
		"mekanaka" = list("mechanical", "mechanic", "mechanics", "mechanism", "mechanist", "mechanise", "mechanized", "machine", "machined", "machining", "machines", "device", "devices", "engineer", "engineers", "engineered", "engineering"),
		"mishun" = list("mission", "order", "orders", "ordering", "directive", "directives", "expectation", "expect", "expected", "expecting", "direction", "directions", "direct", "directly", "directed", "directs"),
		"calam" = list("mollusc", "clam", "clams", "molluscs", "snail", "snails", "slug", "slugs", "barnacle", "barnacles", "seafood", "shrimp", "squid", "octopus"),
		"mweh" = list("mweh"),
		"namu" = list("name", "named", "names", "naming", "design", "designed", "designer", "designs", "designing", "designation", "designations", "surname", "forename", "title", "titles", "titling", "titled", "rank", "ranks", "ranking", "ranked", "ranker"),
		"repri" = list("new", "newer", "newest", "news", "late", "latest", "later", "baby", "babies", "child", "children", "young", "younger", "youngest"),
		"nahu" = list("no", "nope", "negative", "nah", "wrong"),
		"o-kay" = list("okay", "okidoki"),
		"anchi" = list("old", "older", "oldest", "ancient", "ancients", "early", "earlier", "earliest", "adult", "adults"),
		"saav" = list("own", "ownership", "owned", "owns", "owning", "owner", "save", "saving", "saved", "saves", "savior", "rescue", "rescuer", "rescuing", "rescued", "help", "helping", "helps", "helped", "helper", "helpful"),
		"braako" = list("patriarch", "patriarchs", "patriarching", "patriarchy", "guy", "guys", "men", "mens", "man", "mans", "manning"),
		"peepu" = list("pipe", "piping", "piped", "pipes", "tube", "intubate", "intubated", "tubes", "intubation"),
		"fikku" = list("repair", "repairing", "repairs", "repairer", "repaired", "reparation", "reparations", "fix", "fixing", "fixer", "fixes", "fixed"),
		"raai" = list("right", "starboard", "starboardside", "rightmost"),
		"scaav" = list("scav", "scavenge", "scavenging", "scavenged", "scavenges", "scavenger", "scavengers", "salvage", "salvaging", "salvager", "salvaged", "salvages", "salvagers", "search", "searching", "searched", "searches", "searcher", "seek", "seeker", "seekers", "seeks"),
		"secorsh" = list("scorched", "scorch", "scorching", "scorcher", "scorches", "burn", "burns", "burned", "burner", "burners", "burning", "fire", "fired", "fires", "firer", "firing", "flame", "flames", "flamed", "flaming", "inflamed", "inflame"),
		"sennit" = list("smell", "smells", "smeller", "smelling", "smelled", "smelt", "scent", "scents", "scented", "sniff", "sniffs", "sniffing", "sniffed", "nose", "snout", "muzzle"),
		"imnenut" = list("soon", "almost", "close", "closer", "closest", "closing", "closed", "imminent"),
		"heera" = list("hear", "hearing", "heard", "hears", "sound", "sounds", "sounded", "sounding", "ear", "ears", "music", "song", "songs", "singing", "sings", "singer", "sung", "musical", "musicality", "musician", "musicians"),
		"spastimu" = list("space-time", "reality", "existence", "exist", "existing", "existed", "exists", "real", "realism", "universe", "universes", "realities", "existences", "really", "actually", "fact", "actual", "factually", "factual"),
		"stavvro" = list("spear", "stab", "stabber", "stabbing", "stabbers", "stabs", "stabbed", "spears", "shiv", "shivs", "knife", "knives", "cut", "cuts", "cutting", "puncture", "puncturing", "punctured", "punctures", "dagger", "daggers", "sword"),
		"leggi" = list("spider", "spiders", "spidery", "spiderly", "spindly", "spindle", "spin", "spins", "spinning", "spinned", "spinny", "leg", "legs", "legging", "legged", "leggy"),
		"staractura" = list("structure", "structural", "structures", "structured", "build", "building", "builds", "built", "builder", "builders", "scaffold", "scaffolding", "scaffolds"),
		"stipu" = list("stupid", "stupids", "stupider", "stupidest", "stupidity", "stupidities", "idiot", "idiots", "idiotic", "idiocies", "dumb", "dumber", "dumberer", "dumbest", "dumbiest", "dummy", "dummies", "moron", "morons", "moronic", "insipid", "uneducated"),
		"sajee" = list("surgery", "surgeries", "surgeon", "surgeons", "surgical", "medical", "medic", "medics", "medicine", "medicines", "medication", "medications", "medicating", "medicated", "heal", "heals", "healer", "healers", "healed", "healing", "doctor", "doctors"),
		"feleva" = list("taste", "tasting", "tasted", "taster", "flavor", "flavour", "flavoring", "flavouring", "flavored", "flavoured"),
		"tahanki" = list("thank", "thanks", "thanking", "thanked", "thankful", "thankfulness", "gratitude", "grateful", "gratefulness"),
		"taiweem" = list("timeline", "timelines", "multiverse", "multiverses", "confuse", "confusion", "confused", "confusing", "confuser", "concussion", "concussed", "concussing", "headache", "headaches", "migraine", "migraines"),
		"temepo" = list("time", "times", "timed", "timer", "timers", "timing", "temporal", "temporary", "brief", "briefing", "briefest", "briefer", "clock", "clocks", "clocked", "clocking"),
		"repar" = list("tool", "tools", "tooling", "tooled", "implement", "implements", "implementing", "implemented"),
		"praci" = list("training", "train", "trainer", "trains", "trainers", "trained", "practise", "practice", "practising", "practicing", "practised", "practiced", "practitioner", "practitioners"),
		"ehu" = list("uhh", "uh", "umm", "um", "eh", "ehh", "er", "err", "oh", "ohh"),
		"eyduno" = list("unsure", "uncertain", "unknown", "worry", "worrying", "worries", "worried", "worries", "fear", "fears", "feared", "fearing", "undecided", "melancholy"),
		"eppu" = list("up", "above", "atop", "high", "tall", "fore", "forward", "forwards"),
		"oosef" = list("useful", "usefulness", "use", "uses", "used", "user", "users", "using", "resource", "resourceful", "resources", "resourcefulness"),
		"vahi" = list("very", "much", "many", "most", "lot", "lots", "crowd", "crowded", "crowding", "crowds", "gather", "gatherer", "gatherers", "gathers", "gathering", "gathered"),
		"visij" = list("watch", "watcher", "watching", "watches", "watched", "view", "viewer", "viewer", "views", "viewing", "viewings", "viewed", "watchers", "look", "looking", "looks", "looked", "looker", "lookers", "onlookers", "observe", "observes"),
		"ataka" = list("weapon", "weaponise", "weaponize", "weaponised", "weaponized", "weaponising", "weaponizing", "weapons", "bludgeon", "bludgeoned", "bludgeoning", "bludgeons", "club", "clubbed", "clubbing", "clubber", "clubs", "bat", "batted", "batting", "batter", "bats"),
		"weh" = list("weh"),
		"weer" = list("weird", "weirds", "weirding", "weirded", "weirdness", "weirder", "weirdest", "strange", "stranger", "strangest", "alternate", "alternates", "alternating", "alternated", "alternator", "alternators", "alter", "alters", "altered", "altering", "alterer"),
		"wadu" = list("word", "words", "worded", "language", "languages", "linguistics", "linguistic", "linguist", "talk", "talking", "talked", "spoke", "spake", "speak", "speaker", "speaking", "speaks", "speech"),
		"rittu" = list("write", "writer", "writes", "writing", "written", "wrote", "note", "noting", "noted", "notes"),
		"ahu" = list("yes", "yeah", "yerp", "yep", "yeh", "yup", "yee", "yuh", "affirmative", "absolutely", "definitely", "roger", "aye"),
		"yeeng" = list("ying", "yinglet", "yingle", "yinglets", "yings", "yingles", "ratbird", "birdrat", "ratbirds", "birdrats", "yinging"),
		"umi" = list("you", "you'll", "you're", "you've", "you'd", "you'd've", "your", "yours"),
		"uma" = list("him", "he", "he'll", "he's", "he'd", "he'd've", "his"),
		"umo" = list("her", "she", "she'll", "she's", "she'd", "she'd've", "hers"),
		"umu" = list("them", "they", "they'll", "they're", "they've", "they'd", "they'd've", "their", "theirs"),
		"umumu" = list("it", "it'd", "it's", "it'd've", "its", "it'll"),
		"deses" = list("decimal", "dot", "point", "pointy", "pointed", "pointer", "pointing", "points", "score", "scorer", "scores", "scoring", "scored"),
		"oro" = list("none", "zero", "null", "nothing", "zilch", "nada", "empty"),
		"unu" = list("one", "single"),
		"ede" = list("two", "double"),
		"tir" = list("three", "triple"),
		"efi" = list("four", "quadruple"),
		"vis" = list("five"),
		"tiriti" = list("six"),
		"eftiri" = list("seven"),
		"efifi" = list("eight"),
		"edunvi" = list("nine"),
		"unori" = list("ten"),
		"edori" = list("twenty"),
		"tirori" = list("thirty"),
		"efori" = list("forty"),
		"visori" = list("fifty"),
		"tiritori" = list("sixty"),
		"eftirori" = list("seventy"),
		"efifori" = list("eighty"),
		"edunvori" = list("ninety"),
		"unora" = list("one-hundred"),
		"edora" = list("two-hundred"),
		"tirora" = list("three-hundred"),
		"efora" = list("four-hundred"),
		"visora" = list("five-hundred"),
		"tiritora" = list("six-hundred"),
		"eftirora" = list("seven-hundred"),
		"efifora" = list("eight-hundred"),
		"edunvora" = list("nine-hundred"),
		"-orura" = list("thousand"),
		"-orurari" = list("million"),
		"-orurarisu" = list("billion"),
		"-oruraratu" = list("trillion"),
		"-oru-oru-ra" = list("immeasurable", "forever", "eternal", "eternity", "infinite", "inifinity", "ouroboros", "loop", "looping")
	)

	var/list/outext = list()
	var/list/words = splittext(lowertext(input), " ")

	for(var/word in words)
		if(word[length(word)] == ".")	//kill trailing .
			word = copytext(word, 1, length(word))

		var/found = FALSE
		for(var/picked in replacemap)
			var/list/synonyms = replacemap[picked]
			if(synonyms.Find(trim(word)))
				outext.Add(lowertext(picked))
				found = TRUE
				break
		if(!found)
			if(!prob(understand_chance))
				outext.Add(scramble_word(word))
			else
				outext.Add(lowertext(word))



	. = jointext(outext, " ")
	. = capitalize(.)
	. = trim(.)





