// Add some storage capacity so it can fit the extra suit.
/obj/structure/closet/emcloset/Initialize()
	var/static/list/additional_suits = list(
		/obj/item/clothing/head/helmet/space/void/yinglet,
		/obj/item/clothing/suit/space/void/yinglet,
		/obj/item/clothing/head/helmet/space/void/baxxid,
		/obj/item/clothing/suit/space/void/baxxid
	)
	for(var/suit_part_type in additional_suits)
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

	. += new /datum/atom_creator/simple(
		list(
			/obj/item/clothing/head/helmet/space/void/baxxid,
			/obj/item/clothing/suit/space/void/baxxid),
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
	_yinglet_icon = null
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
	. = ..()
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
	_yinglet_icon = null
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
	. = ..()
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

/* baxxid! */
#define BAXIXID_COVERED SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_ARMS|SLOT_TAIL|SLOT_HANDS|SLOT_FEET
/obj/item/clothing/suit/space/void/baxxid
	name = "tubular voidsuit"
	desc = "A larger, armored voidsuit for usage by a sufficiently tubal lifeform."
	bodytype_equip_flags = BODY_FLAG_BAXXID
	icon = 'mods/valsalia/icons/clothing/suit/baxxid_voidsuit.dmi'
	move_trail = /obj/effect/decal/cleanable/blood/tracks/baxxid
	accessory_slot = ACCESSORY_SLOT_OVER
	body_parts_covered = BAXIXID_COVERED
	heat_protection = BAXIXID_COVERED
	cold_protection = BAXIXID_COVERED
	siemens_coefficient = 0
	permeability_coefficient = 0.05

/obj/item/clothing/head/helmet/space/void/baxxid
	name = "tubular voidsuit helmet"
	desc = "A larger, armored voidsuit helmet, with a maneuverable rubber mouthpiece; a small breathing tube prods through the side."
	bodytype_equip_flags = BODY_FLAG_BAXXID
	icon = 'mods/valsalia/icons/clothing/head/baxxid_voidsuit_helmet.dmi'
	move_trail = /obj/effect/decal/cleanable/blood/tracks/baxxid
	accessory_slot = ACCESSORY_SLOT_OVER
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	body_parts_covered = SLOT_HEAD|SLOT_HANDS
	slot_flags = SLOT_HEAD|SLOT_HANDS

/obj/item/clothing/head/helmet/space/rig/baxxid_eng
	icon = 'mods/valsalia/icons/clothing/head/baxxid_hardsuit_helmet.dmi'
	bodytype_equip_flags = BODY_FLAG_BAXXID
	accessory_slot = ACCESSORY_SLOT_OVER

/obj/item/clothing/suit/space/rig/baxxid_eng
	icon = 'mods/valsalia/icons/clothing/suit/baxxid_hardsuit.dmi'
	bodytype_equip_flags = BODY_FLAG_BAXXID
	move_trail = /obj/effect/decal/cleanable/blood/tracks/baxxid
	accessory_slot = ACCESSORY_SLOT_OVER
	body_parts_covered = BAXIXID_COVERED
	heat_protection = BAXIXID_COVERED
	cold_protection = BAXIXID_COVERED
	siemens_coefficient = 0
	permeability_coefficient = 0.05

/obj/item/rig/baxxid_eng
	name = "tubular engineering hardsuit"
	desc = "A hardsuit for usage by a sufficiently tubal lifeform!"
	suit_type = "engineering hardsuit"
	chest = /obj/item/clothing/suit/space/rig/baxxid_eng
	helmet = /obj/item/clothing/head/helmet/space/rig/baxxid_eng
	boots = null
	gloves = null
	initial_modules = list(
		/obj/item/rig_module/mounted/plasmacutter,
		/obj/item/rig_module/device/drill,
		/obj/item/rig_module/device/orescanner,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/device/paperdispenser,
		/obj/item/rig_module/cooling_unit
	)

/obj/structure/closet/secure_closet/engineering_chief/WillContain()
	. = ..()
	. += new/datum/atom_creator/weighted(list(/obj/item/rig/baxxid_eng))

/obj/item/gun/special_check(var/mob/user) /* Allows for the mounted hardsuit guns to be used in spite of dexterity. */
	if (user.get_species_name() == "Baxxid" && istype(user.get_equipped_item(slot_wear_suit_str), /obj/item/clothing/suit/space/rig/baxxid_eng))
		if (istype(user.get_equipped_item(slot_back_str), /obj/item/rig/baxxid_eng))
			var/list/my_held_item_slots = user.get_held_item_slots()
			for(var/current_slot in my_held_item_slots)
			{
				var/datum/inventory_slot/inv_slot = user.get_inventory_slot_datum(current_slot)
				var/obj/item/held = inv_slot.get_equipped_item()
				if (istype(held, /obj/item/gun))
					return 0
			}
			return 1
	. = ..()

