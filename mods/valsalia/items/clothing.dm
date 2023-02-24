/obj/item/clothing
	bodytype_equip_flags = BODY_FLAG_HUMANOID

/obj/item/clothing/gloves
	sprite_sheets = list(BODYTYPE_YINGLET = 'mods/valsalia/icons/clothing/gloves/gloves_yinglet.dmi')
	bodytype_equip_flags = (BODY_FLAG_HUMANOID | BODY_FLAG_YINGLET | BODY_FLAG_INDREL)

/obj/item/clothing/ears
	bodytype_equip_flags = (BODY_FLAG_HUMANOID | BODY_FLAG_YINGLET)

/obj/item/clothing/glasses
	bodytype_equip_flags = (BODY_FLAG_HUMANOID | BODY_FLAG_YINGLET | BODY_FLAG_INDREL | BODY_FLAG_BAXXID)

/obj/item/clothing/head
	bodytype_equip_flags = (BODY_FLAG_HUMANOID | BODY_FLAG_YINGLET | BODY_FLAG_INDREL | BODY_FLAG_BAXXID)

/obj/item/clothing/suit
	bodytype_equip_flags = (BODY_FLAG_HUMANOID | BODY_FLAG_YINGLET | BODY_FLAG_INDREL)

/obj/item/clothing/mask
	bodytype_equip_flags = (BODY_FLAG_HUMANOID | BODY_FLAG_YINGLET | BODY_FLAG_INDREL)

/obj/item/clothing/accessory/cloak
	bodytype_equip_flags = (BODY_FLAG_HUMANOID | BODY_FLAG_YINGLET | BODY_FLAG_INDREL | BODY_FLAG_BAXXID)

/obj/item/clothing/under/tradeship_plain
	name = "plain clothes"
	desc = "Some very boring clothes."
	icon = 'mods/valsalia/icons/clothing/under/plainclothes.dmi'
	icon_state = ICON_STATE_WORLD
	bodytype_equip_flags = BODY_FLAG_HUMANOID

/obj/item/clothing/suit/storage/toggle/redcoat
	name = "\improper Tradehouse redcoat"
	desc = "The signature uniform of Tradeshouse guardsmen."
	icon = 'mods/valsalia/icons/clothing/suit/redcoat.dmi'
	icon_state = ICON_STATE_WORLD
	bodytype_equip_flags = BODY_FLAG_HUMANOID
	var/has_badge
	var/has_buttons
	var/has_collar
	var/has_buckle

/obj/item/clothing/suit/storage/toggle/redcoat/Initialize()
	update_icon()
	. = ..()

/obj/item/clothing/suit/storage/toggle/redcoat/examine(var/mob/user, var/distance)
	. = ..()
	if(has_badge)
		to_chat(user, "This one has a badge sewn to the front indicating the wearer is recognized by the Tradehouse.")

/obj/item/clothing/suit/storage/toggle/redcoat/proc/collect_overlays(var/use_state)
	if(has_badge)
		LAZYADD(., "[use_state]-[has_badge]")
	if(has_buttons)
		LAZYADD(., "[use_state]-[has_buttons]")
	if(has_collar)
		LAZYADD(., "[use_state]-[has_collar]")
	if(has_buckle)
		LAZYADD(., "[use_state]-[has_buckle]")

/obj/item/clothing/suit/storage/toggle/redcoat/on_update_icon()
	. = ..()
	set_overlays(collect_overlays(icon_state))

/obj/item/clothing/suit/storage/toggle/redcoat/adjust_mob_overlay(var/mob/living/user_mob, var/bodytype,  var/image/overlay, var/slot, var/bodypart)
	. = ..()
	if(overlay)
		overlay.overlays += collect_overlays(overlay.icon_state)

/obj/item/clothing/suit/storage/toggle/redcoat/service
	name = "\improper Tradehouse service coat"
	desc = "The brown-collared uniform of Tradehouse service staff."
	has_collar = "collar_brown"

/obj/item/clothing/suit/storage/toggle/redcoat/service/officiated
	has_badge = "badge"

/obj/item/clothing/suit/storage/toggle/redcoat/officiated
	has_badge = "badge"

/obj/item/clothing/suit/storage/toggle/redcoat/officer
	name = "\improper Tradehouse officer's coat"
	desc = "The striking uniform of a Tradehouse guard officer, complete with gold collar and buttons."
	has_badge =   "badge"
	has_buttons = "buttons_gold"
	has_collar =  "collar_gold"
	has_buckle =  "buckle_gold"

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet
	name = "small winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet
	bodytype_equip_flags = BODY_FLAG_YINGLET
	body_parts_covered = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_ARMS
	cold_protection = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_ARMS
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(
		bio = ARMOR_BIO_MINOR
		)
	siemens_coefficient = 0.6
	protects_against_weather = TRUE

/obj/item/clothing/head/winterhood/yinglet
	name = "small winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	body_parts_covered = SLOT_HEAD
	cold_protection = SLOT_HEAD
	flags_inv = HIDEEARS | BLOCKHEADHAIR
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	protects_against_weather = TRUE

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/toggle_hood()
	. = ..()
	if(hood.loc != src)
		update_icon()

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/remove_hood()
	. = ..()
	update_icon()

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/adjust_mob_overlay(var/mob/living/user_mob, var/bodytype,  var/image/overlay, var/slot, var/bodypart)
	. = ..()
	if(hood.loc == src && overlay)
		overlay.icon_state = "[overlay.icon_state]_hood"

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/on_update_icon()
	. = ..()
	if(hood.loc == src)
		icon_state = "[icon_state]_hood"

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/atmos
	name = "small atmospherics winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/atmos.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/atmos
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		rad = ARMOR_RAD_MINOR
	)

/obj/item/clothing/head/winterhood/yinglet/atmos
	name = "small atmospherics winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/atmos.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/captain
	name = "small Matriarch's winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/cap.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/captain
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR
	)

/obj/item/clothing/head/winterhood/yinglet/captain
	name = "small Matriarch's winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/cap.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/cargo
	name = "small cargo winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/cargo.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/cargo
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/head/winterhood/yinglet/cargo
	name = "small cargo winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/cargo.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/ce
	name = "small Patriarch of Engineering's winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/CE.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/ce
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		rad = ARMOR_RAD_MINOR
	)

/obj/item/clothing/head/winterhood/yinglet/ce
	name = "small Patriarch of Engineering's winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/CE.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/chemistry
	name = "small chemistry winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/chem.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/chemistry
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		bomb = ARMOR_BOMB_MINOR
	)

/obj/item/clothing/head/winterhood/yinglet/chemistry
	name = "small chemistry winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/chem.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/cmo
	name = "small Patriarch of Medicine's winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/CMO.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/cmo
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		bio = ARMOR_BIO_RESISTANT
	)

/obj/item/clothing/head/winterhood/yinglet/cmo
	name = "small Patriarch of Medicine's winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/CMO.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/engineering
	name = "small engineering winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/engi.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/engineering
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		rad = ARMOR_RAD_MINOR
	)

/obj/item/clothing/head/winterhood/yinglet/engineering
	name = "small engineering winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/engi.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/HoP
	name = "small Patriarch of Personnell's winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/HoP.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/HoP
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/head/winterhood/yinglet/HoP
	name = "small Patriarch of Personnell's winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/HoP.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/HoS
	name = "small Patriarch of Security's winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/HoS.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/HoS
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR
	)

/obj/item/clothing/head/winterhood/yinglet/HoS
	name = "small Patriarch of Security's winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/HoS.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/hydroponics
	name = "small hydroponics winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/hydro.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/hydroponics
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/head/winterhood/yinglet/hydroponics
	name = "small hydroponics winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/hydro.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/janitor
	name = "small janitor's winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/jani.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/janitor
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/head/winterhood/yinglet/janitor
	name = "small janitor's winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/jani.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/medical
	name = "small medical winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/medi.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/medical
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		bio = ARMOR_BIO_RESISTANT
	)

/obj/item/clothing/head/winterhood/yinglet/medical
	name = "small medical winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/medi.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/mining
	name = "small miner's winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/mining.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/mining
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		melee = ARMOR_MELEE_SMALL
	)

/obj/item/clothing/head/winterhood/yinglet/mining
	name = "small miner's winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/mining.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/paramedic
	name = "small paramedic winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/paramedic.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/paramedic
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		bio = ARMOR_BIO_RESISTANT
	)

/obj/item/clothing/head/winterhood/yinglet/paramedic
	name = "small paramedic winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/paramedic.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/quartermaster
	name = "small Patriarch of Logistic's winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/QM.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/quartermaster
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/head/winterhood/yinglet/quartermaster
	name = "small Patriarch of Logistic's winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/QM.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/rd
	name = "small Patriarch of Science's winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/RD.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/rd
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		bomb = ARMOR_BOMB_MINOR
	)

/obj/item/clothing/head/winterhood/yinglet/rd
	name = "small Patriarch of Science's winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/RD.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/robotics
	name = "small robotics winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/robo.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/robotics
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		bomb = ARMOR_BOMB_MINOR
	)

/obj/item/clothing/head/winterhood/yinglet/robotics
	name = "small robotics winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/robo.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/science
	name = "small science winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/sci.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/science
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		bomb = ARMOR_BOMB_MINOR
	)

/obj/item/clothing/head/winterhood/yinglet/science
	name = "small science winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/sci.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/wintercoat/yinglet/security
	name = "small security winter coat"
	icon = 'mods/valsalia/icons/clothing/suit/wintercoat/sec.dmi'
	hood = /obj/item/clothing/head/winterhood/yinglet/security
	bodytype_equip_flags = BODY_FLAG_YINGLET
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR
	)

/obj/item/clothing/head/winterhood/yinglet/security
	name = "small security winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood/sec.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET