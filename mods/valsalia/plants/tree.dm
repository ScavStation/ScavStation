// New wood species for valSal port.

/decl/material/solid/organic/wood/corkwood
	name = "corkwood"
	uid = "solid_corkwood"
	adjective_name = "corkwood"
	lore_text = "A light, spongy-barked hardwood. Its buoyant, airy grain makes it a favourite for insulation, floats, and stoppers."
	color = "#d7a0b5"
	weight = MAT_VALUE_VERY_LIGHT
	value = 1.3

/decl/material/solid/organic/wood/cypress
	name = "cypress"
	uid = "solid_cypress"
	adjective_name = "cypress"
	lore_text = "A durable, water-resistant softwood that thrives in the wetter reaches of the world. Rarely rots even when left exposed to the damp."
	color = "#7d7259"
	value = 1.4

/decl/material/solid/organic/wood/mangrove
	name = "mangrove"
	uid = "solid_mangrove"
	adjective_name = "mangrove"
	lore_text = "A dense, salt-tolerant hardwood pulled from the tangled roots of the swamp. Difficult to work, but tough enough to shrug off rot and rust alike."
	color = "#6b3a2a"
	weight = MAT_VALUE_HEAVY
	construction_difficulty = MAT_VALUE_HARD_DIY
	value = 1.6

/decl/material/solid/organic/wood/willow
	name = "willow"
	uid = "solid_willow"
	adjective_name = "willow"
	lore_text = "A light, flexible hardwood pulled from the weeping trees along the riverbank. Easy to bend and work, prized for wicker and basketry."
	color = "#6d6e56"
	weight = MAT_VALUE_VERY_LIGHT
	construction_difficulty = MAT_VALUE_EASY_DIY
	value = 1.3

/obj/structure/flora/stump/tree/corkwood
	icon       = 'mods/valsalia/icons/plants/corkwood.dmi'
	icon_state = "corkwood_stump"
	material   = /decl/material/solid/organic/wood/corkwood

/obj/structure/flora/stump/tree/cypress
	icon       = 'mods/valsalia/icons/plants/cypress.dmi'
	icon_state = "cypress_stump"
	material   = /decl/material/solid/organic/wood/cypress

/obj/structure/flora/stump/tree/mangrove
	icon       = 'mods/valsalia/icons/plants/mangrove.dmi'
	icon_state = "mangrove_stump"
	material   = /decl/material/solid/organic/wood/mangrove

/obj/structure/flora/stump/tree/willow
	icon       = 'mods/valsalia/icons/plants/willow.dmi'
	icon_state = "willow_stump"
	material   = /decl/material/solid/organic/wood/willow

/obj/structure/flora/tree/hardwood/corkwood
	name       = "corkwood tree"
	desc       = "A tree with thick, spongy bark."
	icon       = 'mods/valsalia/icons/plants/corkwood.dmi'
	icon_state = "corkwood_1"
	material   = /decl/material/solid/organic/wood/corkwood
	stump_type = /obj/structure/flora/stump/tree/corkwood
	stump_icon_matches_tree = FALSE

/obj/structure/flora/tree/dead/corkwood
	icon       = 'mods/valsalia/icons/plants/corkwood.dmi'
	icon_state = "dead_corkwood"
	material   = /decl/material/solid/organic/wood/corkwood
	stump_type = /obj/structure/flora/stump/tree/corkwood
	stump_icon_matches_tree = FALSE

/obj/structure/flora/tree/softwood/cypress
	name       = "cypress tree"
	desc       = "A tall tree well suited to wet ground."
	icon       = 'mods/valsalia/icons/plants/cypress.dmi'
	icon_state = "cypress_1"
	material   = /decl/material/solid/organic/wood/cypress
	stump_type = /obj/structure/flora/stump/tree/cypress
	stump_icon_matches_tree = FALSE

/obj/structure/flora/tree/dead/cypress
	icon       = 'mods/valsalia/icons/plants/cypress.dmi'
	icon_state = "cypress-dead"
	material   = /decl/material/solid/organic/wood/cypress
	stump_type = /obj/structure/flora/stump/tree/cypress
	stump_icon_matches_tree = FALSE

/obj/structure/flora/tree/hardwood/mangrove
	name       = "mangrove tree"
	desc       = "A tree with a tangle of roots, rooted in the swamp."
	icon       = 'mods/valsalia/icons/plants/mangrove.dmi'
	icon_state = "mangrove_1"
	material   = /decl/material/solid/organic/wood/mangrove
	stump_type = /obj/structure/flora/stump/tree/mangrove
	stump_icon_matches_tree = FALSE
	opacity    = TRUE

/obj/structure/flora/tree/dead/mangrove
	icon       = 'mods/valsalia/icons/plants/mangrove.dmi'
	icon_state = "mangrove-dead"
	material   = /decl/material/solid/organic/wood/mangrove
	stump_type = /obj/structure/flora/stump/tree/mangrove
	stump_icon_matches_tree = FALSE

/obj/structure/flora/tree/hardwood/willow
	name       = "willow tree"
	desc       = "A tree with long, drooping branches."
	icon       = 'mods/valsalia/icons/plants/willow.dmi'
	icon_state = "willow_1"
	material   = /decl/material/solid/organic/wood/willow
	stump_type = /obj/structure/flora/stump/tree/willow
	stump_icon_matches_tree = FALSE

/obj/structure/flora/tree/dead/willow
	icon       = 'mods/valsalia/icons/plants/willow.dmi'
	icon_state = "willow-dead"
	material   = /decl/material/solid/organic/wood/willow
	stump_type = /obj/structure/flora/stump/tree/willow
	stump_icon_matches_tree = FALSE
