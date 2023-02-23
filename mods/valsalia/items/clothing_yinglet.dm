/decl/loadout_option/suit/wintercoat_yinglet
	name = "winter coat, yinglet"
	path = /obj/item/clothing/suit/storage/toggle/wintercoat/yinglet

/obj/item/clothing/suit/storage/toggle/redcoat/yinglet
	desc = "The signature uniform of Tradehouse guardsmen. This one seems to be sized for a yinglet."
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/suit/storage/toggle/redcoat/yinglet/officer
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

/obj/item/clothing/head/yinglet
	name = "small hood"
	desc = "A yinglet-sized cloth hood and mantle. It has ear holes."
	icon = 'mods/valsalia/icons/clothing/head/hood_yinglet.dmi'
	flags_inv = BLOCKHAIR
	bodytype_equip_flags = BODY_FLAG_YINGLET
	color = COLOR_BEIGE
	var/detail_color

/obj/item/clothing/head/yinglet/matriarch
	name = "matriarch hood"
	desc = "The well-crafted and heavily decorated hood of an enclave matriarch."
	icon = 'mods/valsalia/icons/clothing/head/hood_matriarch.dmi'
	color = null
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/head/yinglet/get_mob_overlay(mob/user_mob, slot)
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

/obj/item/clothing/shoes/sandal/yinglet
	name = "small sandals"
	desc = "A pair of rather plain wooden sandals. They seem to be the right size and shape for a yinglet."
	bodytype_equip_flags = BODY_FLAG_YINGLET
	icon = 'mods/valsalia/icons/clothing/shoes/sandals.dmi'

/obj/item/clothing/accessory/tailglove
	name = "yinglet tail glove"
	desc = "A nitrile tail covering, sterile!"
	icon = 'mods/valsalia/icons/clothing/accessories/tailglove.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	slot = ACCESSORY_SLOT_MEDAL

/obj/item/clothing/accessory/tailbells
	name = "tail bells"
	desc = "A set of lightweight, jangly tail bells."
	icon = 'mods/valsalia/icons/clothing/accessories/tailbells.dmi'
	gender = PLURAL
	bodytype_equip_flags = BODY_FLAG_YINGLET
	slot = ACCESSORY_SLOT_MEDAL
	slot_flags = SLOT_TIE | SLOT_UPPER_BODY
	material = /decl/material/solid/metal/gold
	item_flags = ITEM_FLAG_HOLLOW
	var/tmp/dingaling_sound = list(
		'mods/valsalia/sounds/dingaling1.ogg',
		'mods/valsalia/sounds/dingaling2.ogg',
		'mods/valsalia/sounds/dingaling3.ogg',
		'mods/valsalia/sounds/dingaling4.ogg'
	)
	var/tmp/dingaling_volume = 80
	var/tmp/dingaling_chance = 30
	var/tmp/dingaling_vary = FALSE

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

/obj/item/clothing/suit/radiation/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/radsuit_yinglet.dmi')

/obj/item/clothing/head/radiation/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/head/radsuit_hood_yinglet.dmi')

/obj/item/clothing/shoes/magboots/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/shoes/magboots.dmi')

/obj/item/clothing/suit/armor/bulletproof/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/suit/ballistic_vest.dmi')

/obj/item/clothing/head/cakehat/Initialize()
	. = ..()
	LAZYSET(sprite_sheets, BODYTYPE_YINGLET, 'mods/valsalia/icons/clothing/head/cakehat.dmi')

/obj/item/clothing/head/cakehat/get_mob_flame_overlay(var/image/overlay, var/bodytype)
	var/image/I = ..()
	if(I && bodytype == BODYTYPE_YINGLET)
		I.pixel_y = 3
	return I

/obj/item/clothing/under/hazardjumpsuit/yinglet
	name = "small hazard jumpsuit"
	icon = 'mods/valsalia/icons/clothing/under/hazardjumpsuit_yinglet.dmi'
	icon_state = "yinglet body-slot_w_uniform"
	bodytype_equip_flags = BODY_FLAG_YINGLET