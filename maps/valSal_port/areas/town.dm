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

/area/valSal_port/outside/outer_town
	name = "Val Salian Outer Port"

/area/valSal_port/town/general_store
	name = "\improper General Store"
	fishing_failure_prob = 100
	fishing_results = list()
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/*/area/valSal_port/town/general_store/porch
	name = "\improper General Store Porch"
	interior_ambient_light_modifier = -0.3 // night is pitch-black on the porch
	sound_env = FOREST*/


/area/valSal_port/town/stable
	name = "\improper Stable"
	fishing_failure_prob = 100
	fishing_results = list()
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/house
	name = "\improper House"
	fishing_failure_prob = 100
	fishing_results = list()
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/mansion
	name = "\improper House"
	fishing_failure_prob = 100
	fishing_results = list()
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/farmhouse
	name = "\improper Farmhouse"
	fishing_failure_prob = 100
	fishing_results = list()
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/farmhouse/porch
	name = "\improper Farmhouse Porch"
	interior_ambient_light_modifier = -0.3 // night is pitch-black on the porch
	sound_env = FOREST

/area/valSal_port/town/slaughterhouse
	name = "\improper Slaughterhouse"
	fishing_failure_prob = 100
	fishing_results = list()
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/storehouse
	name = "\improper Storehouse"
	fishing_failure_prob = 100
	fishing_results = list()
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/shrine
	name = "\improper Shrine"
	fishing_failure_prob = 100
	fishing_results = list()
	area_flags = AREA_FLAG_HOLY
	sound_env = ROOM
	turf_initializer = /decl/turf_initializer/spiderwebs

/area/valSal_port/town/shrine/kitchen
	name = "\improper Shrine Kitchen"

/area/valSal_port/town/outside/shrine
	name = "\improper Shrine Grounds"