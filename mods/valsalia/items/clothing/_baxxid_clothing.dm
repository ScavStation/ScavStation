/obj/item/clothing/head/baxxid
	abstract_type = /obj/item/clothing/head/baxxid
	desc = "A parent item for stuff you put on top of a baxxid."
	bodytype_equip_flags = BODY_FLAG_BAXXID

/obj/item/clothing/head/baxxid/hood
	name = "short baxxid hood"
	desc = "A large piece of cloth with holes in it, designed to be worn by baxxid."
	icon = 'mods/valsalia/icons/clothing/head/hood_short_baxxid.dmi'

/obj/item/clothing/head/baxxid/hood/long
	name = "baxxid hood"
	icon = 'mods/valsalia/icons/clothing/head/hood_long_baxxid.dmi'
	paint_color = COLOR_PURPLE
	var/apply_trim = TRUE

/obj/item/clothing/head/baxxid/hood/long/on_update_icon()
	. = ..()
	if(apply_trim)
		var/image/I = image(icon, "[get_world_inventory_state()]-trim")
		I.appearance_flags |= RESET_COLOR
		overlays = list(I)

/obj/item/clothing/head/baxxid/hood/long/adjust_mob_overlay(mob/living/user_mob, bodytype, image/overlay, slot, bodypart)
	. = ..()
	if(overlay && slot == slot_head_str && apply_trim)
		var/image/I = image(overlay.icon, "[overlay.icon_state]-trim")
		I.appearance_flags |= RESET_COLOR
		overlay.overlays = list(I)
	return overlay

/obj/item/clothing/head/baxxid/headflag
	name = "baxxid headflag"
	icon = 'mods/valsalia/icons/clothing/head/headflag_baxxid.dmi'
	paint_color = COLOR_RED

/obj/item/clothing/head/baxxid/headflag/officer
	icon = 'mods/valsalia/icons/clothing/head/headflag_officer_baxxid.dmi'
	paint_color = null

/obj/item/clothing/head/baxxid/big_wig
	name = "big wig"
	desc = "A large blonde wig, which is unfortunately too large for a regular human."
	icon = 'mods/valsalia/icons/clothing/head/wig_big_blonde.dmi'

/* Overrides that I don't know where else to place :-( */
/decl/loadout_option/clothing/mantle
	name = "mantle, color select"
	path = /obj/item/clothing/suit/mantle
	loadout_flags = GEAR_HAS_COLOR_SELECTION
	slot = slot_wear_suit_str
	uid = "gear_clothing_suit_mantle"

/decl/loadout_option/clothing/mantle/fated
	name = "fated mantle, color select"
	path = /obj/item/clothing/suit/mantle/fated
	slot = slot_wear_suit_str
	uid = "gear_clothing_suit_mantle_fated"
