// Add some storage capacity so it can fit the extra suit.
/obj/structure/closet/emcloset/Initialize()
	var/static/list/scav_suit = list(
		/obj/item/clothing/head/helmet/space/void/yinglet,
		/obj/item/clothing/suit/space/void/yinglet
	)
	for(var/suit_part_type in scav_suit)
		var/obj/item/suit_part = suit_part_type
		storage_capacity += initial(suit_part.w_class)
	. = ..()

/obj/structure/closet/emcloset/WillContain()
	. = ..()
	. += new /datum/atom_creator/simple(
		list(
			/obj/item/clothing/head/helmet/space/void/yinglet,
			/obj/item/clothing/suit/space/void/yinglet),
		25
	)

/obj/item/clothing/suit/space/void/yinglet
	name = "small voidsuit"
	desc = "A compact, lightly armoured voidsuit for a nonhuman with a tail."
	icon_state = ICON_STATE_WORLD
	icon = 'mods/valsalia/icons/clothing/suit/voidsuit_yinglet.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	color = COLOR_BRONZE
	sprite_sheets = null
	var/armour_colour = COLOR_BEIGE
	var/stripe_colour

/obj/item/clothing/suit/space/void/yinglet/get_mob_overlay(mob/user_mob, slot, bodypart, use_fallback_if_icon_missing = TRUE)
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

/obj/item/clothing/suit/space/void/yinglet/on_update_icon(mob/user)
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

/obj/item/clothing/head/helmet/space/void/yinglet
	name = "small voidsuit helmet"
	desc = "A compact, lightly armoured voidsuit helmet for a nonhuman with large ears and a long nose."
	icon_state = ICON_STATE_WORLD
	icon = 'mods/valsalia/icons/clothing/head/voidsuit_helmet_yinglet.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	color = COLOR_BRONZE
	sprite_sheets = null
	var/faceplate_colour = COLOR_SKY_BLUE
	var/armour_colour = COLOR_BEIGE
	var/stripe_colour

/obj/item/clothing/head/helmet/space/void/yinglet/get_mob_overlay(mob/user_mob, slot, bodypart, use_fallback_if_icon_missing = TRUE)
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

/obj/item/clothing/head/helmet/space/void/yinglet/on_update_icon(mob/user)
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

/obj/item/clothing/suit/space/void/yinglet/matriarch
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

/obj/item/clothing/head/helmet/space/void/yinglet/matriarch
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

/obj/item/clothing/suit/space/void/yinglet/merchant
	name = "small merchant voidsuit"
	color = COLOR_CHESTNUT
	armour_colour = COLOR_CHESTNUT

/obj/item/clothing/head/helmet/space/void/yinglet/merchant
	name = "small merchant voidsuit helmet"
	color = COLOR_CHESTNUT
	armour_colour = COLOR_CHESTNUT
	faceplate_colour = COLOR_RED

/obj/item/clothing/suit/space/void/yinglet/indie
	name = "small Verne voidsuit"
	color = COLOR_WHITE
	armour_colour = COLOR_CYAN_BLUE
	stripe_colour = COLOR_TEAL

/obj/item/clothing/head/helmet/space/void/yinglet/indie
	name = "small Verne voidsuit helmet"
	color = COLOR_WHITE
	armour_colour = COLOR_CYAN_BLUE
	faceplate_colour = COLOR_PURPLE_GRAY
	stripe_colour = COLOR_TEAL

/obj/random_multi/single_item/matriarch_voidsuit
	name = "Multi Point - matrisuit"
	id = "small matriarch voidsuit"
	item_path = /obj/item/clothing/suit/space/void/yinglet/matriarch

/obj/random_multi/single_item/matriarch_helmet
	name = "Multi Point - matrisuit helmet"
	id = "small matriarch voidsuit helmet"
	item_path = /obj/item/clothing/head/helmet/space/void/yinglet/matriarch
