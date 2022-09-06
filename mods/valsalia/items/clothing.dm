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

/obj/item/clothing/head/winterhood/yinglet
	name = "small winter hood"
	icon = 'mods/valsalia/icons/clothing/head/winterhood.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

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
