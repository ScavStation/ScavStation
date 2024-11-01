/obj/item/clothing/suit/jacket/redcoat/yinglet
	desc = "The signature uniform of Tradehouse guardsmen. This one seems to be sized for a yinglet."
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/jacket/redcoat/officiated/yinglet
	desc = "The signature uniform of Tradehouse guardsmen. This one seems to be sized for a yinglet."
	has_badge =   "badge"
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/jacket/redcoat/service/yinglet
	name = "\improper Tradehouse service coat"
	desc = "The brown-collared uniform of Tradehouse service staff. This one seems to be sized for a yinglet."
	has_collar = "collar_brown"

/obj/item/clothing/suit/jacket/redcoat/service/officiated/yinglet
	desc = "The signature uniform of Tradehouse guardsmen. This one seems to be sized for a yinglet."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	has_badge =   "badge"

/obj/item/clothing/suit/jacket/redcoat/yinglet/officer
	name = "\improper Tradehouse officer's coat"
	desc = "The striking uniform of a Tradehouse guard officer, complete with gold collar, buttons and trim. This one seems to be sized for a yinglet."
	has_badge =   "badge"
	has_buttons = "buttons_gold"
	has_collar =  "collar_gold"
	has_buckle =  "buckle_gold"
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/under/yinglet
	name = "small loincloth"
	desc = "A few rags that wrap around the legs and crotch for a semblance of modesty."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/under/loincloth.dmi'
	yinglet_icon = null
	color = COLOR_BEIGE
	var/detail_color

/obj/item/clothing/under/yinglet/matriarch
	name = "matriarch robe"
	desc = "An expensive and well-made garment for the enclave matriarch."
	icon = 'mods/valsalia/icons/clothing/under/matriarch.dmi'
	color = null
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/under/yinglet/yinglibrarian
	name = "librarian robe"
	desc = "a well made robe for a clan librarian."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/under/librarian.dmi'
	color = null

/obj/item/clothing/under/yinglet/yingjumpsuit
	name = "yinglet jumpsuit"
	desc = "a jumpsuit in yinglet size, of yinglet quality craftsmenship"
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/under/jumpsuit.dmi'
	color = COLOR_BEIGE

/obj/item/clothing/under/yinglet/speardance
	name = "spear dancer outfit"
	desc = "A skimpy set of 'clothes' for a 'ceremonial' dance. Rumours say this was a joke for an official long, long ago but the style has remained the same."
	icon = 'mods/valsalia/icons/clothing/under/speardancer.dmi'
	color = null
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/under/yinglet/adjust_mob_overlay(mob/living/user_mob, bodytype, image/overlay, slot, bodypart)
	. = ..()
	if(overlay && detail_color && check_state_in_icon("[overlay.icon_state]-detail", overlay.icon))
		var/image/I = image(overlay.icon, "[overlay.icon_state]-detail")
		I.color = detail_color
		I.appearance_flags |= RESET_COLOR
		overlay.overlays += I
	return overlay

/obj/item/clothing/under/yinglet/scout
	name = "scout loincloth"
	desc = "A layered loincloth and skirtlike garment worn by enclave scouts."
	color = "#917756"
	detail_color = "#698a71"
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/under/yinglet/zhorin_robe
	name = "fancy robe"
	desc = "A very comfortable-looking robe fashioned from a large piece of fabric."
	icon = 'mods/valsalia/icons/clothing/under/zhorin_robe.dmi'
	color = "#009fee"
	detail_color = COLOR_WHITE
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/under/yinglet/ball_gown
	name = "ball gown"
	desc = "A voluminous ball gown made for those prone to have intense intrusive day dreams that parts of the daydream become real. So-so pretty but it looks difficult to run in."
	icon = 'mods/valsalia/icons/clothing/under/ballgown.dmi'
	color = null
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/head/yinglet
	name = "small hood"
	desc = "A yinglet-sized cloth hood and mantle. It has ear holes."
	icon = 'mods/valsalia/icons/clothing/head/hood_yinglet.dmi'
	flags_inv = BLOCK_HEAD_HAIR
	bodytype_equip_flags = BODY_FLAG_YINGLET
	color = COLOR_BEIGE
	var/detail_color

/obj/item/clothing/head/yinglet/matriarch
	name = "matriarch hood"
	desc = "The well-crafted and heavily decorated hood of an enclave matriarch."
	icon = 'mods/valsalia/icons/clothing/head/hood_matriarch.dmi'
	color = null
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/head/yinglet/get_mob_overlay(mob/user_mob, slot, bodypart, use_fallback_if_icon_missing = TRUE)
	var/image/ret = ..()
	if(detail_color && slot == slot_head_str)
		var/image/I = image(icon, "[ret.icon_state]-detail")
		I.color = detail_color
		I.appearance_flags |= RESET_COLOR
		ret.overlays += I
	. = ret

/obj/item/clothing/head/yinglet/scout
	name = "scout hood"
	desc = "A layered hood and mantle worn by enclave scouts."
	color = "#917756"
	detail_color = "#698a71"
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/head/yinglet/pekhat
	name = "sunhat"
	desc = "A wooden sunhat common among yinglets."
	icon = 'mods/valsalia/icons/clothing/head/pekhat.dmi'
	color = null
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/head/yinglet/pekhat_painted
	name = "sunhat"
	desc = "A wooden sunhat common among yinglets. This one is painted with a smile."
	icon = 'mods/valsalia/icons/clothing/head/pekhat_painted.dmi'
	color = null
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/glasses/yinggoggles
	name = "yinglet goggles"
	desc = "well crafted green goggles sized for a yinglet"
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/mask/goggles_yinglet.dmi'
	body_parts_covered = SLOT_EYES
	slot_flags = SLOT_EYES

/obj/item/clothing/suit/yingcape
	name = "small cape"
	desc = "A short length of cloth worked into a cape. Some people would say it looks stupid."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/suit/cape_yinglet.dmi'
	color = COLOR_DARK_RED

/obj/item/clothing/suit/yinglabcoat
	name = "yinglet labcoat"
	desc = "A labcoat tailored to be yinglet-sized."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/suit/labcoat_yinglet.dmi'

/obj/item/clothing/shoes/sandal
	yinglet_icon = 'mods/valsalia/icons/clothing/shoes/sandals.dmi'

/obj/item/clothing/shoes/sandal/yinglet
	name = "small sandals"
	desc = "A pair of rather plain wooden sandals. They seem to be the right size and shape for a yinglet."
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/accessory/tailglove
	name = "yinglet tail glove"
	desc = "A nitrile tail covering, sterile!"
	icon = 'mods/valsalia/icons/clothing/accessories/tailglove.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	accessory_slot = ACCESSORY_SLOT_MEDAL


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


/obj/item/clothing/accessory/yingarmguards/ballistic
	name = "ballistic arm gauntlets"
	desc = "A pair of armored arm pads and pauldrons with heavy plates to protect against ballistic projectiles."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/armguards_ballistic.dmi'
	icon_state = ICON_STATE_WORLD
	bodytype_equip_flags = BODY_FLAG_YINGLET
	body_parts_covered = SLOT_ARMS|SLOT_HANDS
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_RESISTANT,
		ARMOR_BULLET = ARMOR_BALLISTIC_RIFLE,
		ARMOR_LASER = ARMOR_LASER_SMALL,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	color = null
	siemens_coefficient = 0.4
	accessory_slot = ACCESSORY_SLOT_ARMOR_A

	material = /decl/material/solid/metal/plasteel
	matter = list(
		/decl/material/solid/metal/titanium = MATTER_AMOUNT_REINFORCEMENT,
		/decl/material/solid/gemstone/diamond = MATTER_AMOUNT_TRACE
		)
	origin_tech = @'{"materials":3,"engineering":4,"combat":3}'

/obj/item/clothing/accessory/yinglegguards/ballistic
	name = "ballistic side skirt"
	desc = "A skirt of armor with heavy plated leggings to protect against ballistic projectiles. Looks like they might impair movement."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/legguards_ballistic.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	body_parts_covered = SLOT_LEGS|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_FEET|SLOT_TAIL
	accessory_slot = ACCESSORY_SLOT_ARMOR_L
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
	accessory_slowdown = 0.3

/obj/item/clothing/accessory/yingarmguards/ablative
	name = "ablative arm guards"
	desc = "A pair of armored arm pads and pauldrons with advanced shielding to protect against energy weapons."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/armguards_ablative.dmi'
	icon_state = ICON_STATE_WORLD
	bodytype_equip_flags = BODY_FLAG_YINGLET
	body_parts_covered = SLOT_ARMS|SLOT_HANDS
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_KNIVES,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_RIFLES,
		ARMOR_ENERGY = ARMOR_ENERGY_RESISTANT,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	color = null
	siemens_coefficient = 0
	accessory_slot = ACCESSORY_SLOT_ARMOR_A
	origin_tech = @'{"materials":6,"engineering":7,"combat":5}'

/obj/item/clothing/accessory/yinglegguards/ablative
	name = "ablative leg guards"
	desc = "A skirt of armor with armored leg pads with advanced shielding to protect against energy weapons. Looks like they might impair movement."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/legguards_ablative.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	body_parts_covered = SLOT_LEGS|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_FEET|SLOT_TAIL
	accessory_slot = ACCESSORY_SLOT_ARMOR_L
	color = null
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_KNIVES,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_RIFLES,
		ARMOR_ENERGY = ARMOR_ENERGY_RESISTANT,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0
	accessory_slot = ACCESSORY_SLOT_ARMOR_L
	accessory_slowdown = 0.3
	origin_tech = @'{"materials":6,"engineering":7,"combat":5}'


/obj/item/clothing/accessory/tailbells
	name = "tail bells"
	desc = "A set of lightweight, jangly tail bells."
	icon = 'mods/valsalia/icons/clothing/accessories/tailbells.dmi'
	gender = PLURAL
	bodytype_equip_flags = BODY_FLAG_YINGLET
	accessory_slot = ACCESSORY_SLOT_MEDAL
	slot_flags = SLOT_UPPER_BODY
	material = /decl/material/solid/metal/gold
	obj_flags = OBJ_FLAG_HOLLOW
	var/tmp/dingaling_sound = list(
		'mods/valsalia/sounds/dingaling1.ogg',
		'mods/valsalia/sounds/dingaling2.ogg',
		'mods/valsalia/sounds/dingaling3.ogg',
		'mods/valsalia/sounds/dingaling4.ogg'
	)
	var/tmp/dingaling_volume = 80
	var/tmp/dingaling_chance = 30
	var/tmp/dingaling_vary = FALSE

/obj/item/clothing/accessory/yinglegguards/riot
	name = "riot leg guards"
	desc = "A pair of armored leg pads with heavy padding to protect against melee attacks. Looks like they might impair movement."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/legguards_riot.dmi'
	color = null
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_VERY_HIGH,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_SMALL,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0.5
	accessory_slot = ACCESSORY_SLOT_ARMOR_L
	accessory_slowdown = 0.4
	material = /decl/material/solid/metal/steel
	matter = list(/decl/material/solid/organic/cloth = MATTER_AMOUNT_SECONDARY)
	origin_tech = @'{"materials":1,"engineering":1,"combat":2}'

/obj/item/clothing/accessory/yingarmguards/riot
	name = "riot arm guards"
	desc = "A pair of armored arm pads with heavy padding to protect against melee attacks."
	icon = 'mods/valsalia/icons/clothing/accessories/armor/armguards_riot.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	body_parts_covered = SLOT_LEGS|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_FEET|SLOT_TAIL
	accessory_slot = ACCESSORY_SLOT_ARMOR_L
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_VERY_HIGH,
		ARMOR_BULLET = ARMOR_BALLISTIC_SMALL,
		ARMOR_LASER = ARMOR_LASER_SMALL,
		ARMOR_ENERGY = ARMOR_ENERGY_MINOR,
		ARMOR_BOMB = ARMOR_BOMB_PADDED
		)
	color = null
	siemens_coefficient = 0.5
	accessory_slot = ACCESSORY_SLOT_ARMOR_A
	material = /decl/material/solid/metal/steel
	matter = list(/decl/material/solid/organic/cloth = MATTER_AMOUNT_SECONDARY)
	origin_tech = @'{"materials":1,"engineering":1,"combat":2}'







/obj/item/clothing/accessory/tailbells/Initialize()
	. = ..()
	if(dingaling_sound && dingaling_chance)
		events_repository.register(/decl/observ/moved, src, src, .proc/dingaling)

/obj/item/clothing/accessory/tailbells/Destroy()
	events_repository.unregister(/decl/observ/moved, src, src)
	return ..()

/obj/item/clothing/accessory/tailbells/proc/dingaling()
	if(dingaling_sound && prob(dingaling_chance))
		if(islist(dingaling_sound) && length(dingaling_sound))
			playsound(get_turf(src), pick(dingaling_sound), dingaling_volume, dingaling_vary)
		else
			playsound(get_turf(src), dingaling_sound, dingaling_volume, dingaling_vary)

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

/obj/item/clothing/suit/radiation
	yinglet_icon = 'mods/valsalia/icons/clothing/suit/radsuit_yinglet.dmi'

/obj/item/clothing/head/radiation
	yinglet_icon = 'mods/valsalia/icons/clothing/head/radsuit_hood_yinglet.dmi'

/obj/item/clothing/shoes/magboots
	yinglet_icon = 'mods/valsalia/icons/clothing/shoes/magboots.dmi'

/obj/item/clothing/suit/armor/bulletproof
	yinglet_icon = 'mods/valsalia/icons/clothing/suit/ballistic_vest.dmi'

/obj/item/clothing/suit/armor/riot
	yinglet_icon = 'mods/valsalia/icons/clothing/suit/riot.dmi'

/obj/item/clothing/head/cakehat
	yinglet_icon = 'mods/valsalia/icons/clothing/head/cakehat.dmi'

/obj/item/clothing/suit/armor/hos/jensen
	yinglet_icon = 'mods/valsalia/icons/clothing/suit/jensen_yinglet.dmi'

/obj/item/clothing/suit/armor/warden
	yinglet_icon = 'mods/valsalia/icons/clothing/suit/wardenlet.dmi'

/obj/item/clothing/suit/armor/hos
	yinglet_icon = 'mods/valsalia/icons/clothing/suit/hoslet.dmi'

/obj/item/clothing/head/helmet/ablative
	yinglet_icon = 'mods/valsalia/icons/clothing/head/helmet_ablative.dmi'

/obj/item/clothing/head/helmet/riot
	yinglet_icon = 'mods/valsalia/icons/clothing/head/helmet_riot.dmi'

/obj/item/clothing/head/cakehat/get_mob_flame_overlay(var/image/overlay, var/bodytype)
	var/image/I = ..()
	if(I && bodytype == BODYTYPE_YINGLET)
		I.pixel_y = 3
	return I

/obj/item/clothing/under/color
	yinglet_icon = 'mods/valsalia/icons/clothing/under/jumpsuit.dmi'

/obj/item/clothing/under/hazardjumpsuit/yinglet
	name = "small hazard jumpsuit"
	icon = 'mods/valsalia/icons/clothing/under/hazardjumpsuit_yinglet.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	yinglet_icon = null

/obj/item/clothing/under/yinglet/flexsuit
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
	detail_color = COLOR_WHITE
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/under/yinglet/flexsuit/xl
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