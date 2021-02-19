/obj/item/clothing/suit/space/void/scav
	name = "small voidsuit"
	desc = "A compact, lightly armoured voidsuit for a nonhuman with a tail."
	icon_state = ICON_STATE_WORLD
	icon = 'mods/valsalia/icons/clothing/suit/voidsuit_yinglet.dmi'
	bodytype_restricted = list(BODYTYPE_YINGLET)
	color = COLOR_BRONZE
	var/armour_colour = COLOR_BEIGE

/obj/item/clothing/suit/space/void/scav/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(slot == slot_wear_suit_str)
		var/image/I = image(ret.icon, "[ret.icon_state]-armour")
		I.appearance_flags |= RESET_COLOR
		I.color = armour_colour
		ret.overlays += I
	return ret

/obj/item/clothing/suit/space/void/scav/on_update_icon(mob/user)
	update_world_inventory_state()
	cut_overlays()
	var/image/I = image(icon, "[icon_state]-armour")
	I.appearance_flags |= RESET_COLOR
	I.color = armour_colour
	add_overlay(I)

/obj/item/clothing/head/helmet/space/void/scav
	name = "small voidsuit helmet"
	desc = "A compact, lightly armoured voidsuit helmet for a nonhuman with large ears and a long nose."
	icon_state = ICON_STATE_WORLD
	icon = 'mods/valsalia/icons/clothing/head/voidsuit_helmet_yinglet.dmi'
	bodytype_restricted = list(BODYTYPE_YINGLET)
	color = COLOR_BRONZE
	var/faceplate_colour = COLOR_SKY_BLUE
	var/armour_colour = COLOR_BEIGE

/obj/item/clothing/head/helmet/space/void/scav/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(slot == slot_head_str)
		var/new_overlays = list()
		var/image/I = image(ret.icon, "[ret.icon_state]-faceplate")
		I.appearance_flags |= RESET_COLOR
		I.color = faceplate_colour
		new_overlays += I
		I = image(ret.icon, "[ret.icon_state]-armour")
		I.appearance_flags |= RESET_COLOR
		I.color = armour_colour
		new_overlays += I
		ret.overlays = new_overlays
	return ret

/obj/item/clothing/head/helmet/space/void/scav/on_update_icon(mob/user)
	update_world_inventory_state()
	cut_overlays()
	var/image/I = image(icon, "[icon_state]-faceplate")
	I.appearance_flags |= RESET_COLOR
	I.color = faceplate_colour
	add_overlay(I)
	I = image(icon, "[icon_state]-armour")
	I.appearance_flags |= RESET_COLOR
	I.color = armour_colour
	add_overlay(I)
