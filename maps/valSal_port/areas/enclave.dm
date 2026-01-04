/area/valSal_port/outside/enclave
	name = "Zhe Enclave"

/area/valSal_port/enclave/huntershut
	name = "\improper Hunter's Hut"
	fishing_failure_prob = 100
	fishing_results = list()
	sound_env = ROOM

/area/valSal_port/enclave/dininghut
	name = "\improper Dining Hut"
	fishing_failure_prob = 100
	fishing_results = list()
	sound_env = ROOM

/area/valSal_port/enclave/medicinehut
	name = "\improper Medicine Hut"
	fishing_failure_prob = 100
	fishing_results = list()
	sound_env = ROOM

/area/valSal_port/enclave/storehouse
	name = "\improper Storehouse"
	fishing_failure_prob = 100
	fishing_results = list()
	sound_env = ROOM

/area/valSal_port/outside/enclave_farm
	name = "Enclave Farm"

/area/valSal_port/outside/outdoors_enclave
	name = "Outdoors"

/area/valSal_port/outside/outdoors_south
	name = "Outdoors South"

/area/valSal_port/outside/outdoors_cliff
	name = "Outdoors Cliff"

// Woodland areas.
/area/valSal_port/outside/enclave/river
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