/datum/map_template/ruin/exoplanet/oldpod
	name = "old pod"
	description = "A now unused, crashed escape pod."
	prefix = "mods/content/corporate/random_ruins/exoplanet_ruins/"
	suffixes = list("oldpod/oldpod.dmm")
	cost = 0.5
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS
	template_tags = TEMPLATE_TAG_HUMAN|TEMPLATE_TAG_WRECK
	apc_test_exempt_areas = list(
		/area/map_template/oldpod = NO_APC
	)

/area/map_template/oldpod
	name = "\improper Abandoned Escape Pod"
	icon_state = "blue"