/obj/machinery/suit_cycler/Initialize()
	LAZYDISTINCTADD(available_bodytypes, BODYTYPE_YINGLET)
	LAZYDISTINCTADD(available_bodytypes, BODYTYPE_BAXXID)
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

/obj/item/clothing/suit/space/void/merc
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/merc/suit.dmi'

/obj/item/clothing/head/helmet/space/void/merc
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/merc/helmet.dmi'

/obj/item/clothing/suit/space/void/swat
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/deathsquad/suit.dmi'

/obj/item/clothing/suit/space/void/engineering
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/engineering/suit.dmi'

/obj/item/clothing/head/helmet/space/void/engineering
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/engineering/helmet.dmi'

/obj/item/clothing/suit/space/void/mining
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/mining/suit.dmi'

/obj/item/clothing/head/helmet/space/void/mining
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/mining/helmet.dmi'

/obj/item/clothing/suit/space/void/medical
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/medical/suit.dmi'

/obj/item/clothing/head/helmet/space/void/medical
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/medical/helmet.dmi'

/obj/item/clothing/suit/space/void/security
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/sec/suit.dmi'

/obj/item/clothing/head/helmet/space/void/security
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/sec/helmet.dmi'

/obj/item/clothing/suit/space/void/atmos
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/atmos/suit.dmi'

/obj/item/clothing/head/helmet/space/void/atmos
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/atmos/helmet.dmi'

/obj/item/clothing/suit/space/void/engineering/alt
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/engineering_alt/suit.dmi'

/obj/item/clothing/head/helmet/space/void/engineering/alt
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/engineering_alt/helmet.dmi'

/obj/item/clothing/suit/space/void/mining/alt
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/mining_alt/suit.dmi'

/obj/item/clothing/head/helmet/space/void/mining/alt
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/mining_alt/helmet.dmi'

/obj/item/clothing/suit/space/void/medical/alt
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/medical_alt/suit.dmi'

/obj/item/clothing/head/helmet/space/void/medical/alt
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/medical_alt/helmet.dmi'

/obj/item/clothing/suit/space/void/security/alt
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/sec_alt/suit.dmi'

/obj/item/clothing/head/helmet/space/void/security/alt
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/sec_alt/helmet.dmi'

/obj/item/clothing/suit/space/void/atmos/alt
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/atmos_alt/suit.dmi'

/obj/item/clothing/head/helmet/space/void/atmos/alt
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/atmos_alt/helmet.dmi'

/obj/item/clothing/suit/space/void/engineering/salvage
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/salvage/suit.dmi'

/obj/item/clothing/head/helmet/space/void/engineering/salvage
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/salvage/helmet.dmi'

/obj/item/clothing/suit/space/void/expedition
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/expedition/suit.dmi'

/obj/item/clothing/head/helmet/space/void/expedition
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/expedition/helmet.dmi'

/obj/item/clothing/suit/space/void
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/nasa/suit.dmi'

/obj/item/clothing/head/helmet/space/void
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/nasa/helmet.dmi'

/obj/item/clothing/suit/space/void/wizard
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/wizard/suit.dmi'

/obj/item/clothing/head/helmet/space/void/wizard
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/wizard/helmet.dmi'

/obj/item/clothing/suit/space/void/excavation
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/excavation/suit.dmi'

/obj/item/clothing/head/helmet/space/void/excavation
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/void/excavation/helmet.dmi'

/obj/item/clothing/suit/space/void/merc/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/merc/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/swat/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/engineering/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/engineering/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/mining/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/mining/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/medical/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/medical/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/security/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/security/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/atmos/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/atmos/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/engineering/alt/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/engineering/alt/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/mining/alt/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/mining/alt/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/medical/alt/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/medical/alt/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/security/alt/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/security/alt/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/atmos/alt/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/atmos/alt/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/engineering/salvage/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/engineering/salvage/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/expedition/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/expedition/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/wizard/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/wizard/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/suit/space/void/excavation/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/obj/item/clothing/head/helmet/space/void/excavation/scav
	guarantee_body_flag_compatible = BODY_FLAG_YINGLET

/* baxxid! */
/obj/item/clothing/head/helmet/space/void/engineering/setup_sprite_sheets()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_BAXXID, 'mods/valsalia/icons/clothing/head/baxxid_voidsuit_helmet.dmi')

/obj/item/clothing/suit/space/void/engineering/setup_sprite_sheets()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_BAXXID, 'mods/valsalia/icons/clothing/suit/baxxid_voidsuit.dmi')
