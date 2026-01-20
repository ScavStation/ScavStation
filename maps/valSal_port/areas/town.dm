/area/valSal_port/outside/river
	name = "River"
	color = COLOR_BLUE
	description = "The soft susurration of running water mingles with the hum of insects and croak of frogs."
	area_blurb_category = /area/valSal_port/outside/river
	additional_fishing_results = list(
		/mob/living/simple_animal/aquatic/fish/large        = 5,
		/mob/living/simple_animal/aquatic/fish/large/salmon = 5,
		/mob/living/simple_animal/aquatic/fish/large/trout  = 5,
		/mob/living/simple_animal/aquatic/fish/large/pike   = 3
	)

/area/valSal_port/outside/inner_town
	name = "Val Salian Port"
	ambience = list(
		'mods/valsalia/sounds/ambience/angels.ogg',
		'mods/valsalia/sounds/ambience/dreamtown.ogg',
		'mods/valsalia/sounds/ambience/outofbusiness.ogg',
		'mods/valsalia/sounds/ambience/trader.ogg'
	)

/area/valSal_port/outside/outer_town
	name = "Val Salian Outer Port"
	ambience = list(
		'mods/valsalia/sounds/ambience/angels.ogg',
		'mods/valsalia/sounds/ambience/dreamtown.ogg',
		'mods/valsalia/sounds/ambience/outofbusiness.ogg',
		'mods/valsalia/sounds/ambience/trader.ogg'
	)

/area/valSal_port/outside/merchantcamp
	name = "Val Salian Merchant Camp"
	ambience = list(
		'mods/valsalia/sounds/ambience/angels.ogg',
		'mods/valsalia/sounds/ambience/dreamtown.ogg',
		'mods/valsalia/sounds/ambience/outofbusiness.ogg',
		'mods/valsalia/sounds/ambience/trader.ogg'
	)

/area/valSal_port/outside/eastside
	name = "Val Salian Eastside"

/area/valSal_port/outside/westside
	name = "Val Salian Westside"

/area/valSal_port/outside/southside
	name = "Val Salian Southside"

/area/valSal_port/town/general_store
	name = "\improper General Store"
	fishing_failure_prob = 100
	fishing_results = list()
	ambience = list(
		'mods/valsalia/sounds/ambience/angels.ogg',
		'mods/valsalia/sounds/ambience/dreamtown.ogg',
		'mods/valsalia/sounds/ambience/outofbusiness.ogg',
		'mods/valsalia/sounds/ambience/trader.ogg'
	)
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/house
	name = "\improper House"
	fishing_failure_prob = 100
	fishing_results = list()
	ambience = list(
		'mods/valsalia/sounds/ambience/angels.ogg',
		'mods/valsalia/sounds/ambience/dreamtown.ogg',
		'mods/valsalia/sounds/ambience/outofbusiness.ogg',
		'mods/valsalia/sounds/ambience/trader.ogg'
	)
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/outpost
	name = "\improper Outpost"
	fishing_failure_prob = 100
	fishing_results = list()
	ambience = list(
		'mods/valsalia/sounds/ambience/angels.ogg',
		'mods/valsalia/sounds/ambience/dreamtown.ogg',
		'mods/valsalia/sounds/ambience/outofbusiness.ogg',
		'mods/valsalia/sounds/ambience/trader.ogg'
	)
	sound_env = ROOM

/area/valSal_port/town/mansion
	name = "\improper House"
	fishing_failure_prob = 100
	fishing_results = list()
	ambience = list(
		'mods/valsalia/sounds/ambience/angels.ogg',
		'mods/valsalia/sounds/ambience/dreamtown.ogg',
		'mods/valsalia/sounds/ambience/outofbusiness.ogg',
		'mods/valsalia/sounds/ambience/trader.ogg'
	)
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/farmhouse
	name = "\improper Farmhouse"
	fishing_failure_prob = 100
	fishing_results = list()
	ambience = list(
		'mods/valsalia/sounds/ambience/angels.ogg',
		'mods/valsalia/sounds/ambience/dreamtown.ogg',
		'mods/valsalia/sounds/ambience/outofbusiness.ogg',
		'mods/valsalia/sounds/ambience/trader.ogg'
	)
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/slaughterhouse
	name = "\improper Slaughterhouse"
	fishing_failure_prob = 100
	fishing_results = list()
	ambience = list(
		'mods/valsalia/sounds/ambience/angels.ogg',
		'mods/valsalia/sounds/ambience/dreamtown.ogg',
		'mods/valsalia/sounds/ambience/outofbusiness.ogg',
		'mods/valsalia/sounds/ambience/trader.ogg'
	)
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/trapper
	name = "\improper Trapper's Hut"
	fishing_failure_prob = 100
	fishing_results = list()
	ambience = list(
		'mods/valsalia/sounds/ambience/angels.ogg',
		'mods/valsalia/sounds/ambience/dreamtown.ogg',
		'mods/valsalia/sounds/ambience/outofbusiness.ogg',
		'mods/valsalia/sounds/ambience/trader.ogg'
	)
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/den
	name = "\improper Bear Den"
	fishing_failure_prob = 100
	fishing_results = list()
	ambience = list(
		'sound/ambience/ambimine.ogg',
		'mods/valsalia/sounds/ambience/capital.ogg',
		'mods/valsalia/sounds/ambience/dungeons.ogg',
		'sound/ambience/song_game.ogg',
		'mods/valsalia/sounds/ambience/tension.ogg',
		'mods/valsalia/sounds/ambience/troubles.ogg'
	)
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/dogden
	name = "\improper Dog Den"
	fishing_failure_prob = 100
	fishing_results = list()
	ambience = list(
		'sound/ambience/ambimine.ogg',
		'mods/valsalia/sounds/ambience/capital.ogg',
		'mods/valsalia/sounds/ambience/dungeons.ogg',
		'sound/ambience/song_game.ogg',
		'mods/valsalia/sounds/ambience/tension.ogg',
		'mods/valsalia/sounds/ambience/troubles.ogg'
	)
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/shrine
	name = "\improper Shrine"
	fishing_failure_prob = 100
	fishing_results = list()
	area_flags = AREA_FLAG_HOLY
	ambience = list(
		'mods/valsalia/sounds/ambience/angels.ogg',
		'mods/valsalia/sounds/ambience/dreamtown.ogg',
		'mods/valsalia/sounds/ambience/outofbusiness.ogg',
		'mods/valsalia/sounds/ambience/trader.ogg'
	)
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/hermit
	name = "\improper Hermit's Hut"
	fishing_failure_prob = 100
	fishing_results = list()
	ambience = list(
		'sound/ambience/ambimine.ogg',
		'mods/valsalia/sounds/ambience/capital.ogg',
		'mods/valsalia/sounds/ambience/dungeons.ogg',
		'sound/ambience/song_game.ogg',
		'mods/valsalia/sounds/ambience/tension.ogg',
		'mods/valsalia/sounds/ambience/troubles.ogg'
	)
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/outside/camp
	name = "\improper Bandit Camp"
	ambience = list(
		'mods/valsalia/sounds/ambience/canyon.ogg',
		'mods/valsalia/sounds/ambience/caravans.ogg',
		'mods/valsalia/sounds/ambience/contrasts.ogg',
		'mods/valsalia/sounds/ambience/khans.ogg',
		'mods/valsalia/sounds/ambience/tribe.ogg'
	)
	fishing_failure_prob = 100
	fishing_results = list()