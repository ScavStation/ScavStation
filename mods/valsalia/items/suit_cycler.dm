/obj/machinery/suit_cycler/Initialize()
	LAZYDISTINCTADD(available_bodytypes, BODYTYPE_YINGLET)
	. = ..()

/obj/machinery/suit_cycler/tradeship
	boots = /obj/item/clothing/shoes/magboots
	req_access = list()

/obj/machinery/suit_cycler/tradeship/Initialize()
	if(prob(75))
		suit = pick(list(
			/obj/item/clothing/suit/space/void/mining,
			/obj/item/clothing/suit/space/void/engineering,
			/obj/item/clothing/suit/space/void/expedition,
			/obj/item/clothing/suit/space/void/excavation,
			/obj/item/clothing/suit/space/void/engineering/salvage
		))
	if(prob(75))
		helmet = pick(list(
			/obj/item/clothing/head/helmet/space/void/mining,
			/obj/item/clothing/head/helmet/space/void/engineering,
			/obj/item/clothing/head/helmet/space/void/expedition,
			/obj/item/clothing/head/helmet/space/void/excavation,
			/obj/item/clothing/head/helmet/space/void/engineering/salvage
		))
	. = ..()

/obj/item/clothing/suit/space/void/merc/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/merc/suit.dmi')

/obj/item/clothing/head/helmet/space/void/merc/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/merc/helmet.dmi')

/obj/item/clothing/suit/space/void/swat/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/deathsquad/suit.dmi')

/obj/item/clothing/suit/space/void/engineering/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/engineering/suit.dmi')

/obj/item/clothing/head/helmet/space/void/engineering/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/engineering/helmet.dmi')

/obj/item/clothing/suit/space/void/mining/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/mining/suit.dmi')

/obj/item/clothing/head/helmet/space/void/mining/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/mining/helmet.dmi')

/obj/item/clothing/suit/space/void/medical/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/medical/suit.dmi')

/obj/item/clothing/head/helmet/space/void/medical/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/medical/helmet.dmi')

/obj/item/clothing/suit/space/void/security/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/sec/suit.dmi')

/obj/item/clothing/head/helmet/space/void/security/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/sec/helmet.dmi')

/obj/item/clothing/suit/space/void/atmos/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/atmos/suit.dmi')

/obj/item/clothing/head/helmet/space/void/atmos/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/atmos/helmet.dmi')

/obj/item/clothing/suit/space/void/engineering/alt/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/engineering_alt/suit.dmi')

/obj/item/clothing/head/helmet/space/void/engineering/alt/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/engineering_alt/helmet.dmi')

/obj/item/clothing/suit/space/void/mining/alt/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/mining_alt/suit.dmi')

/obj/item/clothing/head/helmet/space/void/mining/alt/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/mining_alt/helmet.dmi')

/obj/item/clothing/suit/space/void/medical/alt/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/medical_alt/suit.dmi')

/obj/item/clothing/head/helmet/space/void/medical/alt/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/medical_alt/helmet.dmi')

/obj/item/clothing/suit/space/void/security/alt/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/sec_alt/suit.dmi')

/obj/item/clothing/head/helmet/space/void/security/alt/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/sec_alt/helmet.dmi')

/obj/item/clothing/suit/space/void/atmos/alt/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/atmos_alt/suit.dmi')

/obj/item/clothing/head/helmet/space/void/atmos/alt/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/atmos_alt/helmet.dmi')

/obj/item/clothing/suit/space/void/engineering/salvage/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/salvage/suit.dmi')

/obj/item/clothing/head/helmet/space/void/engineering/salvage/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/salvage/helmet.dmi')

/obj/item/clothing/suit/space/void/expedition/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/expedition/suit.dmi')

/obj/item/clothing/head/helmet/space/void/expedition/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/expedition/helmet.dmi')

/obj/item/clothing/suit/space/void/Initialize()
	. = ..()
	if(!(bodytype_equip_flags & BODY_FLAG_YINGLET) && !(BODYTYPE_YINGLET in sprite_sheets))
		LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/nasa/suit.dmi')

/obj/item/clothing/head/helmet/space/void/Initialize()
	. = ..()
	if(!(bodytype_equip_flags & BODY_FLAG_YINGLET) && !(BODYTYPE_YINGLET in sprite_sheets))
		LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/nasa/helmet.dmi')

/obj/item/clothing/suit/space/void/wizard/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/wizard/suit.dmi')

/obj/item/clothing/head/helmet/space/void/wizard/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/wizard/helmet.dmi')

/obj/item/clothing/suit/space/void/excavation/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/excavation/suit.dmi')

/obj/item/clothing/head/helmet/space/void/excavation/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/void/excavation/helmet.dmi')

/obj/item/clothing/suit/space/void/merc/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/merc/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/swat/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/engineering/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/engineering/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/mining/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/mining/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/medical/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/medical/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/security/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/security/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/atmos/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/atmos/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/engineering/alt/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/engineering/alt/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/mining/alt/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/mining/alt/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/medical/alt/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/medical/alt/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/security/alt/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/security/alt/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/atmos/alt/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/atmos/alt/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/engineering/salvage/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/engineering/salvage/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/expedition/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/expedition/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/wizard/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/wizard/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/excavation/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/excavation/scav/Initialize()
	. = ..()
	if(bodytype_equip_flags & BODY_FLAG_EXCLUDE)
		bodytype_equip_flags &= ~BODY_FLAG_YINGLET
	else
		bodytype_equip_flags |= BODY_FLAG_YINGLET
