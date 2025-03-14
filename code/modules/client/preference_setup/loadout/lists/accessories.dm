/decl/loadout_category/accessories
	name = "Accessories"

/decl/loadout_option/accessory
	category = /decl/loadout_category/accessories
	abstract_type = /decl/loadout_option/accessory
	slot = slot_w_uniform_str
	replace_equipped = FALSE

/decl/loadout_option/accessory/tie
	name = "tie selection"
	path = /obj/item/clothing/neck/tie
	uid = "gear_accessory_tie"

/decl/loadout_option/accessory/tie/get_gear_tweak_options()
	. = ..()
	LAZYINITLIST(.[/datum/gear_tweak/path])
	.[/datum/gear_tweak/path] |= list(
		"blue tie" =        /obj/item/clothing/neck/tie/blue,
		"red tie" =         /obj/item/clothing/neck/tie/red,
		"blue tie, clip" =  /obj/item/clothing/neck/tie/blue_clip,
		"black tie" =       /obj/item/clothing/neck/tie/black,
		"long red tie" =    /obj/item/clothing/neck/tie/long/red,
		"long yellow tie" = /obj/item/clothing/neck/tie/long/yellow,
		"navy tie" =        /obj/item/clothing/neck/tie/navy,
		"horrible tie" =    /obj/item/clothing/neck/tie/horrible,
		"brown tie" =       /obj/item/clothing/neck/tie/brown
	)

/decl/loadout_option/accessory/tie_color
	name = "colored tie"
	path = /obj/item/clothing/neck/tie
	loadout_flags = GEAR_HAS_COLOR_SELECTION
	uid = "gear_accessory_tie_color"

/decl/loadout_option/accessory/tie_color/get_gear_tweak_options()
	. = ..()
	LAZYINITLIST(.[/datum/gear_tweak/path])
	.[/datum/gear_tweak/path] |= list(
		"tie" =         /obj/item/clothing/neck/tie,
		"striped tie" = /obj/item/clothing/neck/tie/long
	)

/decl/loadout_option/accessory/locket
	name = "locket"
	path = /obj/item/clothing/neck/necklace/locket
	uid = "gear_accessory_locket"

/decl/loadout_option/accessory/necklace
	name = "necklace, color select"
	path = /obj/item/clothing/neck/necklace
	loadout_flags = GEAR_HAS_COLOR_SELECTION
	uid = "gear_accessory_necklace"

/decl/loadout_option/accessory/bow
	name = "bowtie, horrible"
	path = /obj/item/clothing/neck/tie/bow/ugly
	uid = "gear_accessory_bowtie"

/decl/loadout_option/accessory/bow/color
	name = "bowtie, color select"
	path = /obj/item/clothing/neck/tie/bow
	loadout_flags = GEAR_HAS_COLOR_SELECTION
	uid = "gear_accessory_bowtie_color"

/decl/loadout_option/accessory/bracelet
	name = "bracelet, color select"
	path = /obj/item/clothing/gloves/bracelet
	cost = 1
	loadout_flags = GEAR_HAS_COLOR_SELECTION
	uid = "gear_accessory_bracelet"
