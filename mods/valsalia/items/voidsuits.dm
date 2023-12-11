// Add some storage capacity so it can fit the extra suit.
/obj/structure/closet/emcloset/Initialize()
	var/static/list/scav_suit = list(
		/obj/item/clothing/head/helmet/space/void/scav,
		/obj/item/clothing/suit/space/void/scav
	)
	for(var/suit_part_type in scav_suit)
		var/obj/item/suit_part = suit_part_type
		storage_capacity += initial(suit_part.w_class)
	. = ..()

/obj/structure/closet/emcloset/WillContain()
	. = ..()
	. += new /datum/atom_creator/simple(
		list(
			/obj/item/clothing/head/helmet/space/void/scav,
			/obj/item/clothing/suit/space/void/scav),
		25
	)

/obj/item/clothing/suit/space/void/scav
	name = "small voidsuit"
	desc = "A compact, lightly armoured voidsuit for a nonhuman with a tail."
	icon_state = ICON_STATE_WORLD
	icon = 'mods/valsalia/icons/clothing/suit/voidsuit_yinglet.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	color = COLOR_BRONZE
	var/armour_colour = COLOR_BEIGE
	var/stripe_colour

/obj/item/clothing/suit/space/void/scav/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(slot == slot_wear_suit_str)
		var/image/I = image(ret.icon, "[ret.icon_state]-armour")
		I.appearance_flags |= RESET_COLOR
		I.color = armour_colour
		ret.overlays += I
		if(stripe_colour)
			I = image(ret.icon, "[ret.icon_state]-stripe")
			I.appearance_flags |= RESET_COLOR
			I.color = stripe_colour
			ret.overlays += I
	return ret

/obj/item/clothing/suit/space/void/scav/on_update_icon(mob/user)
	update_world_inventory_state()
	cut_overlays()
	var/image/I = image(icon, "[icon_state]-armour")
	I.appearance_flags |= RESET_COLOR
	I.color = armour_colour
	add_overlay(I)
	if(stripe_colour)
		I = image(icon, "[icon_state]-stripe")
		I.appearance_flags |= RESET_COLOR
		I.color = stripe_colour
		add_overlay(I)

/obj/item/clothing/head/helmet/space/void/scav
	name = "small voidsuit helmet"
	desc = "A compact, lightly armoured voidsuit helmet for a nonhuman with large ears and a long nose."
	icon_state = ICON_STATE_WORLD
	icon = 'mods/valsalia/icons/clothing/head/voidsuit_helmet_yinglet.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	color = COLOR_BRONZE
	var/faceplate_colour = COLOR_SKY_BLUE
	var/armour_colour = COLOR_BEIGE
	var/stripe_colour

/obj/item/clothing/head/helmet/space/void/scav/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(slot == slot_head_str)
		var/new_overlays = list()
		var/image/I = image(ret.icon, "[ret.icon_state]-faceplate")
		I.appearance_flags |= RESET_COLOR
		I.color = faceplate_colour
		new_overlays += I
		I = image(ret.icon, "[ret.icon_state]-armour")
		I.appearance_flags |= RESET_COLOR
		I.color = armour_colour
		new_overlays += I
		if(stripe_colour)
			I = image(ret.icon, "[ret.icon_state]-stripe")
			I.appearance_flags |= RESET_COLOR
			I.color = stripe_colour
			new_overlays += I
		ret.overlays = new_overlays
	return ret

/obj/item/clothing/head/helmet/space/void/scav/on_update_icon(mob/user)
	update_world_inventory_state()
	cut_overlays()
	var/image/I = image(icon, "[icon_state]-faceplate")
	I.appearance_flags |= RESET_COLOR
	I.color = faceplate_colour
	add_overlay(I)
	I = image(icon, "[icon_state]-armour")
	I.appearance_flags |= RESET_COLOR
	I.color = armour_colour
	add_overlay(I)
	if(stripe_colour)
		I = image(icon, "[icon_state]-stripe")
		I.appearance_flags |= RESET_COLOR
		I.color = stripe_colour
		add_overlay(I)

/obj/item/clothing/suit/space/void/scav/engineering
	name = "small engineering voidsuit"
	color = COLOR_GRAY40
	armour_colour = COLOR_YELLOW_GRAY
	stripe_colour = COLOR_BEASTY_BROWN
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_MINOR,
		ARMOR_LASER = ARMOR_LASER_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_RESISTANT
		)
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE
	siemens_coefficient = 0.3
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/storage/toolbox,/obj/item/storage/briefcase/inflatable,/obj/item/t_scanner,/obj/item/rcd)

/obj/item/clothing/head/helmet/space/void/scav/engineering
	name = "small engineering voidsuit helmet"
	color = COLOR_GRAY40
	faceplate_colour = COLOR_SKY_BLUE
	armour_colour = COLOR_YELLOW_GRAY
	stripe_colour = COLOR_BEASTY_BROWN
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_MINOR,
		ARMOR_LASER = ARMOR_LASER_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_RESISTANT
		)
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE
	siemens_coefficient = 0.3

/obj/item/clothing/suit/space/void/scav/atmos
	name = "small atmospherics voidsuit"
	color = COLOR_PALE_BTL_GREEN
	armour_colour = COLOR_YELLOW_GRAY
	stripe_colour = COLOR_PALE_BTL_GREEN
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_MINOR,
		ARMOR_LASER = ARMOR_LASER_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_SMALL
		)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = FIRESUIT_MAX_PRESSURE
	allowed = list(
		/obj/item/flashlight,
		/obj/item/tank,
		/obj/item/suit_cooling_unit,
		/obj/item/storage/toolbox,
		/obj/item/storage/briefcase/inflatable,
		/obj/item/t_scanner,
		/obj/item/rcd
		)

/obj/item/clothing/head/helmet/space/void/scav/atmos
	name = "small atmospherics voidsuit helmet"
	color = COLOR_PALE_BTL_GREEN
	faceplate_colour = COLOR_SKY_BLUE
	armour_colour = COLOR_YELLOW_GRAY
	stripe_colour = COLOR_PALE_BTL_GREEN
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_MINOR,
		ARMOR_LASER = ARMOR_LASER_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_SMALL
		)
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = FIRESUIT_MAX_PRESSURE


/obj/item/clothing/suit/space/void/scav/mining
	name = "small mining voidsuit"
	color = COLOR_GRAY15
	armour_colour = COLOR_BROWN_ORANGE
	stripe_colour = COLOR_CHESTNUT
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_MINOR,
		ARMOR_LASER = ARMOR_LASER_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_RESISTANT,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_MINOR
		)
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/stack/flag,/obj/item/suit_cooling_unit,/obj/item/storage/ore,/obj/item/t_scanner,/obj/item/pickaxe,/obj/item/rcd)

/obj/item/clothing/head/helmet/space/void/scav/mining
	name = "small mining voidsuit helmet"
	color = COLOR_GRAY15
	faceplate_colour = COLOR_BLUE_GRAY
	armour_colour = COLOR_BROWN_ORANGE
	stripe_colour = COLOR_CHESTNUT
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_MINOR,
		ARMOR_LASER = ARMOR_LASER_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_RESISTANT,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_MINOR
		)
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE

/obj/item/clothing/suit/space/void/scav/security
	name = "small security voidsuit"
	color = COLOR_GRAY20
	armour_colour = COLOR_GRAY40
	stripe_colour = COLOR_DARK_RED
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_MAJOR,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_SMALL,
		ARMOR_BOMB = ARMOR_BOMB_PADDED,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_MINOR
		)
	allowed = list(/obj/item/gun,/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/baton)
	siemens_coefficient = 0.3

/obj/item/clothing/head/helmet/space/void/scav/security
	name = "small security voidsuit helmet"
	color = COLOR_GRAY20
	armour_colour = COLOR_GRAY40
	faceplate_colour = COLOR_RED_GRAY
	stripe_colour = COLOR_DARK_RED
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_MAJOR,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_SMALL,
		ARMOR_BOMB = ARMOR_BOMB_PADDED,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_MINOR
		)
	siemens_coefficient = 0.3

/obj/item/clothing/suit/space/void/scav/merc
	name = "small blood-red voidsuit"
	color = COLOR_GRAY40
	armour_colour = COLOR_RED
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_RESISTANT,
		ARMOR_LASER = ARMOR_LASER_MAJOR,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_SMALL
		)
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/baton,/obj/item/energy_blade/sword,/obj/item/handcuffs)
	siemens_coefficient = 0.3

/obj/item/clothing/head/helmet/space/void/scav/merc
	name = "small blood-red voidsuit helmet"
	color = COLOR_GRAY40
	armour_colour = COLOR_RED
	faceplate_colour = COLOR_LIME
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_RESISTANT,
		ARMOR_LASER = ARMOR_LASER_MAJOR,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_SMALL
		)
	siemens_coefficient = 0.3
	camera = /obj/machinery/camera/network/mercenary

/obj/item/clothing/suit/space/void/scav/medical
	name = "small medical voidsuit"
	color = COLOR_GRAY40
	armour_colour = COLOR_OFF_WHITE
	stripe_colour = COLOR_CYAN_BLUE
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/storage/firstaid,/obj/item/scanner/health,/obj/item/scanner/breath,/obj/item/stack/medical)
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_KNIVES,
		ARMOR_LASER = ARMOR_LASER_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_SMALL
		)

/obj/item/clothing/suit/space/void/medical/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/medical
	boots = /obj/item/clothing/shoes/magboots


/obj/item/clothing/head/helmet/space/void/scav/medical
	name = "small medical voidsuit helmet"
	color = COLOR_GRAY20
	armour_colour = COLOR_OFF_WHITE
	stripe_colour = COLOR_CYAN_BLUE
	faceplate_colour = COLOR_SKY_BLUE
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_KNIVES,
		ARMOR_LASER = ARMOR_LASER_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_SMALL
		)

/obj/item/clothing/suit/space/void/scav/explorer
	name = "small exploration voidsuit"
	color = COLOR_GRAY20
	armour_colour = COLOR_GRAY40
	stripe_colour = COLOR_PURPLE
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_MINOR,
		ARMOR_LASER = ARMOR_LASER_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_RESISTANT,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_MINOR
		)
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/stack/flag,/obj/item/suit_cooling_unit,/obj/item/storage/ore,/obj/item/t_scanner,/obj/item/pickaxe,/obj/item/rcd)

/obj/item/clothing/head/helmet/space/void/scav/explorer
	name = "small exploration voidsuit helmet"
	color = COLOR_GRAY20
	armour_colour = COLOR_GRAY40
	faceplate_colour = COLOR_PALE_PURPLE_GRAY
	stripe_colour = COLOR_PURPLE
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_MINOR,
		ARMOR_LASER = ARMOR_LASER_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_RESISTANT,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_MINOR
		)
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE

/obj/item/clothing/suit/space/void/scav/matriarch
	name = "small matriarch voidsuit"
	color = COLOR_BEASTY_BROWN
	armour_colour = COLOR_GOLD
	stripe_colour = COLOR_GREEN
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/stack/flag,/obj/item/suit_cooling_unit)
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_MAJOR,
		ARMOR_BULLET = ARMOR_BALLISTIC_RESISTANT,
		ARMOR_LASER = ARMOR_LASER_HANDGUNS,
		ARMOR_ENERGY = ARMOR_ENERGY_SMALL,
		ARMOR_BOMB = ARMOR_BOMB_RESISTANT,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_SMALL
		)
	siemens_coefficient = 0.7
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE

/obj/item/clothing/head/helmet/space/void/scav/matriarch
	name = "small matriarch voidsuit helmet"
	color = COLOR_GREEN
	armour_colour = COLOR_GOLD
	faceplate_colour = COLOR_WHITE
	stripe_colour = COLOR_GREEN
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_MAJOR,
		ARMOR_BULLET = ARMOR_BALLISTIC_RESISTANT,
		ARMOR_LASER = ARMOR_LASER_HANDGUNS,
		ARMOR_ENERGY = ARMOR_ENERGY_SMALL,
		ARMOR_BOMB = ARMOR_BOMB_RESISTANT,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_SMALL
		)
	siemens_coefficient = 0.7
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE

/obj/item/clothing/suit/space/void/scav/merchant
	name = "small merchant voidsuit"
	color = COLOR_CHESTNUT
	armour_colour = COLOR_CHESTNUT

/obj/item/clothing/head/helmet/space/void/scav/merchant
	name = "small merchant voidsuit helmet"
	color = COLOR_CHESTNUT
	armour_colour = COLOR_CHESTNUT
	faceplate_colour = COLOR_RED

/obj/item/clothing/suit/space/void/scav/science
	name = "small science voidsuit"
	color = COLOR_ASTEROID_ROCK
	armour_colour = COLOR_PALE_YELLOW
	stripe_colour = COLOR_PALE_YELLOW

/obj/item/clothing/head/helmet/space/void/scav/science
	name = "small science voidsuit helmet"
	color = COLOR_PALE_YELLOW
	armour_colour = COLOR_ASTEROID_ROCK
	faceplate_colour = COLOR_PALE_BLUE_GRAY
	stripe_colour = COLOR_DARK_RED

/obj/item/clothing/suit/space/void/scav/indie
	name = "small Verne voidsuit"
	color = COLOR_WHITE
	armour_colour = COLOR_CYAN_BLUE
	stripe_colour = COLOR_TEAL

/obj/item/clothing/head/helmet/space/void/scav/indie
	name = "small Verne voidsuit helmet"
	color = COLOR_WHITE
	armour_colour = COLOR_CYAN_BLUE
	faceplate_colour = COLOR_PURPLE_GRAY
	stripe_colour = COLOR_TEAL

/obj/random_multi/single_item/matriarch_voidsuit
	name = "Multi Point - matrisuit"
	id = "small matriarch voidsuit"
	item_path = /obj/item/clothing/suit/space/void/scav/matriarch

/obj/random_multi/single_item/matriarch_helmet
	name = "Multi Point - matrisuit helmet"
	id = "small matriarch voidsuit helmet"
	item_path = /obj/item/clothing/head/helmet/space/void/scav/matriarch
