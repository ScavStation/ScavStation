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
	var/list/adding_overlays
	var/state_modifier = buttons ? "_open" : ""
	if(has_badge)
		LAZYADD(adding_overlays, "[use_state]-[has_badge][state_modifier]")
	if(has_buttons)
		LAZYADD(adding_overlays, "[use_state]-[has_buttons][state_modifier]")
	if(has_collar)
		LAZYADD(adding_overlays, "[use_state]-[has_collar][state_modifier]")
	if(has_buckle)
		LAZYADD(adding_overlays, "[use_state]-[has_buckle][state_modifier]")
	. = adding_overlays

/obj/item/clothing/suit/storage/toggle/redcoat/on_update_icon()
	set_overlays(collect_overlays(get_world_inventory_state()))

/obj/item/clothing/suit/storage/toggle/redcoat/adjust_mob_overlay(var/mob/living/user_mob, var/bodytype,  var/image/overlay, var/slot, var/bodypart)
	if(overlay)
		overlay.overlays += collect_overlays(overlay.icon_state)
	. = ..()

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
