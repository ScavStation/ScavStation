/obj/item/clothing/suit/storage/toggle/redcoat/yinglet
	desc = "The signature uniform of Tradehouse guardsmen. This one seems to be sized for a yinglet."
	bodytype_restricted = list(BODYTYPE_YINGLET)
	icon = 'mods/valsalia/icons/suit_yinglet.dmi'

/obj/item/clothing/suit/storage/toggle/redcoat/yinglet/officer
	name = "\improper Tradehouse officer's coat"
	desc = "The striking uniform of a Tradehouse guard officer, complete with gold collar, buttons and trim. This one seems to be sized for a yinglet."
	has_badge =   "badge"
	has_buttons = "buttons_gold"
	has_collar =  "collar_gold"
	has_buckle =  "buckle_gold"

/obj/item/clothing/under/yinglet
	name = "small loincloth"
	desc = "A few rags that wrap around the legs and crotch for a semblance of modesty."
	bodytype_restricted = list(BODYTYPE_YINGLET)
	icon = 'mods/valsalia/icons/under_yinglet.dmi'
	icon_state = "loincloth"
	sprite_sheets = list(BODYTYPE_YINGLET = 'mods/valsalia/icons/onmob_under_yinglet.dmi')
	color = COLOR_BEIGE
	var/detail_color

/obj/item/clothing/under/yinglet/matriarch
	name = "matriarch robe"
	desc = "An expensive and well-made garment for the enclave matriarch."
	icon_state = "matriarch_robe"
	color = null

/obj/item/clothing/under/yinglet/yinglibrarian
	name = "librarian robe"
	desc = "a well made robe for a clan librarian."
	bodytype_restricted = list(BODYTYPE_YINGLET)
	icon_state = "librarian_robe"
	color = null

/obj/item/clothing/under/yinglet/yingjumpsuit
	name = "yinglet jumpsuit"
	desc = "a jumpsuit in yinglet size, of yinglet quality craftsmenship"
	bodytype_restricted = list(BODYTYPE_YINGLET)
	icon = 'mods/valsalia/icons/under_yinglet.dmi'
	icon_state = "ying_jumpsuit"
	sprite_sheets = list(BODYTYPE_YINGLET = 'mods/valsalia/icons/onmob_under_yinglet.dmi')
	color = COLOR_BEIGE

/obj/item/clothing/under/yinglet/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(detail_color && slot == slot_w_uniform_str)
		var/image/I = image('mods/valsalia/icons/onmob_under_yinglet.dmi', "[icon_state]_detail")
		I.color = detail_color
		I.appearance_flags |= RESET_COLOR
		ret.overlays += I
	. = ret

/obj/item/clothing/under/yinglet/scout
	name = "scout loincloth"
	desc = "A layered loincloth and skirtlike garment worn by enclave scouts."
	color = "#917756"
	detail_color = "#698a71"

/obj/item/clothing/head/yinglet
	name = "small hood"
	desc = "A yinglet-sized cloth hood and mantle. It has ear holes."
	icon = 'mods/valsalia/icons/head_yinglet.dmi'
	icon_state = "ying_hood"
	flags_inv = BLOCKHAIR
	bodytype_restricted = list(BODYTYPE_YINGLET)
	sprite_sheets = list(BODYTYPE_YINGLET = 'mods/valsalia/icons/onmob_head_yinglet.dmi')
	color = COLOR_BEIGE
	var/detail_color

/obj/item/clothing/head/yinglet/matriarch
	name = "matriarch hood"
	desc = "The well-crafted and heavily decorated hood of an enclave matriarch."
	icon_state = "matriarch_hood"
	color = null

/obj/item/clothing/head/yinglet/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(detail_color && slot == slot_head_str)
		var/image/I = image('mods/valsalia/icons/onmob_head_yinglet.dmi', "[icon_state]_detail")
		I.color = detail_color
		I.appearance_flags |= RESET_COLOR
		ret.overlays += I
	. = ret

/obj/item/clothing/head/yinglet/scout
	name = "scout hood"
	desc = "A layered hood and mantle worn by enclave scouts."
	color = "#917756"
	detail_color = "#698a71"

/obj/item/clothing/eyes/yinglet/yinggoggles
	name = "Yinglet goggles"
	desc = "well crafted green goggles sized for a yinglet"
	bodytype_restricted = list(BODYTYPE_YINGLET)
	icon = 'mods/valsalia/icons/eyes_yinglet.dmi'
	icon_state = "ying_goggles"
	sprite_sheets = list(BODYTYPE_YINGLET = 'mods/valsalia/icons/onmob_eyes_yinglet.dmi')
	body_parts_covered = EYES
	slot_flags = SLOT_EYES

/obj/item/clothing/suit/yinglet
	name = "small cape"
	desc = "A short length of cloth worked into a cape. Some people would say it looks stupid."
	bodytype_restricted = list(BODYTYPE_YINGLET)
	icon = 'mods/valsalia/icons/suit_yinglet.dmi'
	icon_state = "cape"
	color = COLOR_DARK_RED
	sprite_sheets = list(BODYTYPE_YINGLET = 'mods/valsalia/icons/onmob_suit_yinglet.dmi')

/obj/item/clothing/suit/yinglabcoat
	name = "Yinglet Labcoat"
	desc = "A labcoat tailored to be yinglet sized"
	bodytype_restricted = list(BODYTYPE_YINGLET)
	icon = 'mods/valsalia/icons/suit_yinglet.dmi'
	icon_state = "ying_labcoat"
	sprite_sheets = list(BODYTYPE_YINGLET = 'mods/valsalia/icons/onmob_suit_yinglet.dmi')

/obj/item/clothing/shoes/sandal/yinglet
	name = "small sandals"
	desc = "A pair of rather plain wooden sandals. They seem to be the right size and shape for a yinglet."
	bodytype_restricted = list(BODYTYPE_YINGLET)
	item_icons = list(
		slot_shoes_str = 'mods/valsalia/icons/onmob_shoes_yinglet.dmi'
	)

/obj/item/clothing/accessory/tailglove
	name = "Yinglet Tail glove"
	desc = "A nitrile tail covering, sterile!"
	icon = 'mods/valsalia/icons/accessory_yinglet.dmi'
	icon_state = "tail_glove"
	sprite_sheets = list(BODYTYPE_YINGLET = 'mods/valsalia/icons/onmob_accessory_yinglet.dmi')
	slot = ACCESSORY_SLOT_MEDAL

/obj/item/clothing/suit/yingtrashbag
	name = "Trashbag"
	desc = "A trashbag with tiny arm holes."
	bodytype_restricted = list(BODYTYPE_YINGLET)
	icon = 'mods/valsalia/icons/suit_yinglet.dmi'
	icon_state = "garbage_bag"
	sprite_sheets = list(BODYTYPE_YINGLET = 'mods/valsalia/icons/onmob_suit_yinglet.dmi')

/obj/item/clothing/suit/yingtrashbag/blue
	desc = "A blue trashbag with tiny arm holes."
	icon_state = "garbage_bag_blue"
