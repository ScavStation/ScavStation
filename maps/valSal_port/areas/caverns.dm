/*/area/valSal_port/outside/river
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

/area/valSal_port/outside/river/lake
	name = "Woodland Lake"
	additional_fishing_results = list(
		/mob/living/simple_animal/aquatic/fish/large/bass        = 5,
		/mob/living/simple_animal/aquatic/fish/large/trout       = 5,
		/mob/living/simple_animal/aquatic/fish/large/javelin     = 5,
		/mob/living/simple_animal/hostile/aquatic/carp = 3,
		/mob/living/simple_animal/aquatic/fish/large/koi         = 1
	)

/area/valSal_port/outside/savanah_grasslands
	name = "Dry Savannah Grassland"

/area/valSal_port/caves/entrance
	name = "\improper Surface Tunnels"
	color = COLOR_GRAY80

/area/valSal_port/caves/unexplored
	name = "\improper Trackless Deeps - North"
	color = COLOR_GRAY20
	ambience = list(
		'sound/ambience/ominous1.ogg',
		'sound/ambience/ominous2.ogg',
		'sound/ambience/ominous3.ogg',
	)

// Area coherency test hates that the unexplored area is split by a tunnel.
/area/valSal_port/caves/unexplored/south
	name = "\improper Trackless Deeps - South"

/area/valSal_port/caves/river
	name = "\improper Silent River"
	color = COLOR_GRAY20
	description = "The silent, black water catches whatever sparse light survives in the depths, glittering like a river of stars."
	area_blurb_category = /area/valSal_port/caves/river
	ambience = list(
		'sound/ambience/ominous1.ogg',
		'sound/ambience/ominous2.ogg',
		'sound/ambience/ominous3.ogg',
	)

/area/valSal_port/caves
	name = "\improper Deep Tunnels"
	color = COLOR_GRAY40
	is_outside = OUTSIDE_NO
	description = "The deep dark brings distant, whispering echoes to your ears."
	ambience = list(
		'sound/ambience/ambimine.ogg',
		'sound/ambience/song_game.ogg'
	)
	area_blurb_category = /area/valSal_port/caves
	sound_env = CAVE
	area_flags = AREA_FLAG_IS_BACKGROUND

/area/valSal_port/caves/deep
	name = "\improper Deep Caverns"

/area/valSal_port/caves/deep/poi
	name = "\improper Deepest Caverns"

/area/valSal_port/caves/miners_camp
	name = "\improper General Mining Camp Area"

/area/valSal_port/caves/miners_camp/miners_shack
	name = "\improper Miners' Hut"
	fishing_failure_prob = 100
	fishing_results = list()

/area/valSal_port/caves/miners_camp/miners_storage
	name = "\improper Miners' Storage"
	fishing_failure_prob = 100
	fishing_results = list()

/area/valSal_port/caves/miners_camp/miners_forge
	name = "\improper Miners' Forge"
	fishing_failure_prob = 100
	fishing_results = list()*/