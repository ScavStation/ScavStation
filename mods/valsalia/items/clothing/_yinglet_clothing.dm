// ICON TODO:
// - /obj/item/clothing/dress
// - /obj/item/clothing/skirt
// - /obj/item/clothing/suit/poncho

/obj/item/clothing/costume/yinglet
	bodytype_equip_flags = BODY_FLAG_YINGLET
	_yinglet_icon = null
	abstract_type = /obj/item/clothing/costume/yinglet

/obj/item/clothing/jumpsuit
	_yinglet_icon = 'mods/valsalia/icons/clothing/under/jumpsuit.dmi'

/obj/item/clothing/suit/radiation
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/radsuit_yinglet.dmi'

/obj/item/clothing/head/radiation
	_yinglet_icon = 'mods/valsalia/icons/clothing/head/radsuit_hood_yinglet.dmi'

/obj/item/clothing/shoes/magboots
	_yinglet_icon = 'mods/valsalia/icons/clothing/shoes/magboots.dmi'

/obj/item/clothing/suit/armor/bulletproof
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/ballistic_vest.dmi'

/obj/item/clothing/suit/armor/hos/jensen
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/jensen_yinglet.dmi'

/obj/item/clothing/suit/armor/warden
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/wardenlet.dmi'

/obj/item/clothing/suit/armor/hos
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/hoslet.dmi'

/obj/item/clothing/head/helmet/ablative
	_yinglet_icon = 'mods/valsalia/icons/clothing/head/helmet_ablative.dmi'

/obj/item/clothing/head/helmet/riot
	_yinglet_icon = 'mods/valsalia/icons/clothing/head/helmet_riot.dmi'

/obj/item/clothing/head/cakehat/get_mob_flame_overlay(var/image/overlay, var/bodytype)
	var/image/I = ..()
	if(I && bodytype == BODYTYPE_YINGLET)
		I.pixel_y = 3
	return I

/obj/item/clothing/jumpsuit/hazard/yinglet
	name = "small hazard jumpsuit"
	icon = 'mods/valsalia/icons/clothing/under/hazardjumpsuit_yinglet.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	_yinglet_icon = null

/obj/item/clothing/costume/yinglet/flexsuit
	name = "flex suit"
	desc = "A state of the art mobility suit made for the common yinglet of Mollusc Station. Comes with built in armor and rad padding that can be layered, rumoured to be pressure resistant."
	icon = 'mods/valsalia/icons/clothing/under/flexsuit.dmi'
	color = null
	bodytype_equip_flags = BODY_FLAG_YINGLET
	body_parts_covered = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_FEET|SLOT_ARMS|SLOT_HANDS|SLOT_TAIL
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	min_pressure_protection = -1
	heat_protection = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_FEET|SLOT_ARMS|SLOT_HANDS
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_SMALL,
		ARMOR_RAD = ARMOR_RAD_SMALL,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	max_pressure_protection = VOIDSUIT_MAX_PRESSURE
	markings_color = COLOR_WHITE
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/costume/yinglet/flexsuit/xl
	name = "flex suit"
	desc = "A state of the art mobility suit custom made for the uncommon yinglet of Mollusc Station. Comes with built in armor, rad and laser padding that can be layered, definitely pressure resistant."
	icon = 'mods/valsalia/icons/clothing/under/jumpshootsuit.dmi'
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_KNIVES,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_HANDGUNS,
		ARMOR_RAD = ARMOR_RAD_SMALL,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0.3

/obj/item/clothing/suit/armor/flexsuitvest
	name = "flex suit vest"
	desc = "A custom armor vest chest covering fitted for use with the flex suit."
	icon = 'mods/valsalia/icons/clothing/suit/jumpshootvest.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		ARMOR_MELEE  = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_RIFLE,
		ARMOR_LASER = ARMOR_LASER_HANDGUNS,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB   = ARMOR_BOMB_MINOR
		)
	body_parts_covered = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_ARMS
	cold_protection = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_ARMS
	heat_protection = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_ARMS
	material = /decl/material/solid/organic/leather
	matter = list(
		/decl/material/solid/metal/titanium = MATTER_AMOUNT_REINFORCEMENT,
		/decl/material/solid/metal/steel = MATTER_AMOUNT_REINFORCEMENT
	)

/obj/item/clothing/head/helmet/space/flexsuithelmet
	name = "flex suit helmet"
	desc = "A custom sttreamlined armor helmet covering fitted for use with the flex suit. It is noteably shiny, heavy and made for a user with a large shall tooth and long nose."
	icon = 'mods/valsalia/icons/clothing/head/jumpshoothelm.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		ARMOR_MELEE  = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_RIFLE,
		ARMOR_LASER = ARMOR_LASER_MAJOR,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB   = ARMOR_BOMB_PADDED
		)
	body_parts_covered = SLOT_HEAD
	cold_protection = SLOT_HEAD
	heat_protection = SLOT_HEAD
	material = /decl/material/solid/organic/leather
	matter = list(
		/decl/material/solid/metal/titanium = MATTER_AMOUNT_REINFORCEMENT,
		/decl/material/solid/metal/steel = MATTER_AMOUNT_REINFORCEMENT
	)
	max_pressure_protection = ENG_VOIDSUIT_MAX_PRESSURE
	min_pressure_protection = 0
	siemens_coefficient = 0.7


/obj/item/clothing/suit/yingtrashbag
	name = "trashbag"
	desc = "A trashbag with tiny arm holes."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/suit/trashbag.dmi'

/obj/item/clothing/suit/yingtrashbag/blue
	desc = "A blue trashbag with tiny arm holes."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/suit/trashbag_blue.dmi'

/obj/item/clothing/head/fancyhat
	name = "yinglet fancy hat"
	desc = "A blue hat with a white feather. A fancy hat for a fancy lad."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/head/fancy_hat_yinglet.dmi'

/obj/item/clothing/suit/yingapron
	name = "yinglet apron"
	desc = "An apron tailored for a yinglet."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/suit/apron_yinglet.dmi'

/obj/item/clothing/suit/fancyclothes
	name = "yinglet fancy clothes"
	desc = "White shorts and a shirt with a blue scarf made for a yinglet. A fancy outfit for a fancy lad."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/suit/fancy_clothes_yinglet.dmi'

/obj/item/clothing/suit/rusticying
	name = "yinglet rustic dress"
	desc = "A cream coloured dress with some green highlights. Worn by rural cuties."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/suit/rusticying.dmi'

/obj/item/clothing/suit/robe/yinglet/mantleying
	name = "yinglet mantle"
	desc = "A blue mantle and skirt fitted for a yinglet. Quite fashionable."
	icon = 'mods/valsalia/icons/clothing/suit/mantleying.dmi'

/obj/item/clothing/suit/robe/yinglet/countercoat
	name = "yinglet longcoat"
	desc = "A leather coat with a green gown underneath. Usually worn by learned ones."
	icon = 'mods/valsalia/icons/clothing/suit/countercoat.dmi'

/obj/item/clothing/suit/yingjacket
	name = "yinglet jacket"
	desc = "A green jacket. It looks like it might fit a yinglet."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/suit/green_jacket_yinglet.dmi'

/obj/item/clothing/suit/fancyrobe
	name = "yinglet robe"
	desc = "A well made robe tailored for a yinglet."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/suit/fancy_robe_yinglet.dmi'

/obj/item/clothing/costume/yinglet/ball_gown
	name = "ball gown"
	desc = "A voluminous ball gown made for those prone to have intense intrusive day dreams that parts of the daydream become real. So-so pretty but it looks difficult to run in."
	icon = 'mods/valsalia/icons/clothing/under/ballgown.dmi'
	color = null
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/yingcape
	name = "small cape"
	desc = "A short length of cloth worked into a cape. Some people would say it looks stupid."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/suit/cape_yinglet.dmi'
	color = COLOR_DARK_RED

/obj/item/clothing/jumpsuit/yinglet
	name = "yinglet jumpsuit"
	desc = "a jumpsuit in yinglet size, of yinglet quality craftsmenship"
	bodytype_equip_flags = BODY_FLAG_YINGLET
	_yinglet_icon = null
	icon = 'mods/valsalia/icons/clothing/under/jumpsuit.dmi'
	color = COLOR_BEIGE

/obj/item/clothing/costume/yinglet/speardance
	name = "spear dancer outfit"
	desc = "A skimpy set of 'clothes' for a 'ceremonial' dance. Rumours say this was a joke for an official long, long ago but the style has remained the same."
	icon = 'mods/valsalia/icons/clothing/under/speardancer.dmi'
	color = null
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/pants/loincloth/scout
	name = "scout loincloth"
	desc = "A layered loincloth and skirtlike garment worn by enclave scouts."
	color = "#917756"
	markings_color = "#698a71"
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/armor/yavlaserproof
	name = "yinglet ablative vest"
	desc = "An armored vest made for a yinglet with advanced shielding to protect against energy weapons."
	icon = 'mods/valsalia/icons/clothing/suit/reflective.dmi'
	icon_state = ICON_STATE_WORLD
	bodytype_equip_flags = BODY_FLAG_YINGLET
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	restricted_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	body_parts_covered = SLOT_UPPER_BODY|SLOT_LOWER_BODY
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_KNIVES,
		ARMOR_BULLET = ARMOR_BALLISTIC_PISTOL,
		ARMOR_LASER = ARMOR_LASER_RIFLES,
		ARMOR_ENERGY = ARMOR_ENERGY_RESISTANT
		)
	siemens_coefficient = 0

/obj/item/clothing/suit/armor/yavlaserproof/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(istype(damage_source, /obj/item/projectile/energy) || istype(damage_source, /obj/item/projectile/beam))
		var/obj/item/projectile/P = damage_source

		var/reflectchance = 40 - round(damage/3)
		if(!(def_zone in list(BP_CHEST, BP_GROIN))) //not changing this so arm and leg shots reflect, gives some incentive to not aim center-mass
			reflectchance /= 2
		if(P.starting && prob(reflectchance))
			visible_message("<span class='danger'>\The [user]'s [src.name] reflects [attack_text]!</span>")

			// Find a turf near or on the original location to bounce to
			var/new_x = P.starting.x + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/new_y = P.starting.y + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/turf/curloc = get_turf(user)

			// redirect the projectile
			P.redirect(new_x, new_y, curloc, user)

			return PROJECTILE_CONTINUE // complete projectile permutation

/obj/item/clothing/shoes/legguards/yinglet
	abstract_type = /obj/item/clothing/shoes/legguards/yinglet
	bodytype_equip_flags = BODY_FLAG_YINGLET
	body_parts_covered = SLOT_LEGS|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_FEET|SLOT_TAIL
	color = null
	accessory_slot = ACCESSORY_SLOT_ARMOR_L
	accessory_slowdown = 0.3

/obj/item/clothing/gloves/armguards/yinglet
	abstract_type = /obj/item/clothing/gloves/armguards/yinglet
	bodytype_equip_flags = BODY_FLAG_YINGLET
	body_parts_covered = SLOT_ARMS|SLOT_HANDS
	color = null
	accessory_slot = ACCESSORY_SLOT_ARMOR_A

/obj/item/clothing/gloves/armguards/yinglet/ballistic
	name = "ballistic arm gauntlets"
	desc = "A pair of armored arm pads and pauldrons with heavy plates to protect against ballistic projectiles."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/armguards_ballistic.dmi'
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_RIFLE,
		ARMOR_LASER = ARMOR_LASER_SMALL,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0.4
	material = /decl/material/solid/metal/plasteel
	matter = list(
		/decl/material/solid/metal/titanium = MATTER_AMOUNT_REINFORCEMENT,
		/decl/material/solid/gemstone/diamond = MATTER_AMOUNT_TRACE
		)
	origin_tech = @'{"materials":3,"engineering":4,"combat":3}'

/obj/item/clothing/shoes/legguards/yinglet/ballistic
	name = "ballistic side skirt"
	desc = "A skirt of armor with heavy plated leggings to protect against ballistic projectiles. Looks like they might impair movement."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/legguards_ballistic.dmi'
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_RIFLE,
		ARMOR_LASER = ARMOR_LASER_SMALL,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0.4
	matter = list(
		/decl/material/solid/metal/steel = MATTER_AMOUNT_SECONDARY
	)
	origin_tech = @'{"materials":3,"engineering":4,"combat":3}'

/obj/item/clothing/gloves/armguards/yinglet/ablative
	name = "ablative arm guards"
	desc = "A pair of armored arm pads and pauldrons with advanced shielding to protect against energy weapons."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/armguards_ablative.dmi'
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_KNIVES,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_RIFLES,
		ARMOR_ENERGY = ARMOR_ENERGY_RESISTANT,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0
	origin_tech = @'{"materials":6,"engineering":7,"combat":5}'

/obj/item/clothing/shoes/legguards/yinglet/ablative
	name = "ablative leg guards"
	desc = "A skirt of armor with armored leg pads with advanced shielding to protect against energy weapons. Looks like they might impair movement."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/legguards_ablative.dmi'
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_KNIVES,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_RIFLES,
		ARMOR_ENERGY = ARMOR_ENERGY_RESISTANT,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0
	origin_tech = @'{"materials":6,"engineering":7,"combat":5}'


/obj/item/clothing/shoes/legguards/yinglet/riot
	name = "riot leg guards"
	desc = "A pair of armored leg pads with heavy padding to protect against melee attacks. Looks like they might impair movement."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/legguards_riot.dmi'
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_VERY_HIGH,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_SMALL,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0.5
	accessory_slowdown = 0.4
	material = /decl/material/solid/metal/steel
	matter = list(/decl/material/solid/organic/cloth = MATTER_AMOUNT_SECONDARY)
	origin_tech = @'{"materials":1,"engineering":1,"combat":2}'

/obj/item/clothing/gloves/armguards/yinglet/riot
	name = "riot arm guards"
	desc = "A pair of armored arm pads with heavy padding to protect against melee attacks."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/armguards_riot.dmi'
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_VERY_HIGH,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_SMALL,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0.5
	material = /decl/material/solid/metal/steel
	matter = list(/decl/material/solid/organic/cloth = MATTER_AMOUNT_SECONDARY)
	origin_tech = @'{"materials":1,"engineering":1,"combat":2}'

/obj/item/clothing/costume/yinglet/matriarch
	name = "matriarch robe"
	desc = "An expensive and well-made garment for the enclave matriarch."
	icon = 'mods/valsalia/icons/clothing/under/matriarch.dmi'
	color = null

/obj/item/clothing/suit/yinglabcoat
	name = "yinglet labcoat"
	desc = "A labcoat tailored to be yinglet-sized."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/suit/labcoat_yinglet.dmi'

/obj/item/clothing/costume/yinglet/librarian
	name = "librarian robe"
	desc = "A well-made robe for a clan librarian."
	icon = 'mods/valsalia/icons/clothing/under/librarian.dmi'
	color = null
