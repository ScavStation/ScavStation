/obj/item/clothing/gloves/ring
	name = "ring"
	icon = 'icons/clothing/accessories/jewelry/rings/ring.dmi'
	w_class = ITEM_SIZE_TINY
	gender = NEUTER
	material = /decl/material/solid/metal/silver
	var/can_fit_under_gloves = TRUE
	var/can_inscribe = FALSE
	var/inscription
	var/base_desc

/obj/item/clothing/gloves/ring/Initialize()
	if(desc)
		base_desc = desc
	. = ..()

/obj/item/clothing/gloves/ring/set_material(var/new_material)
	. = ..()
	update_desc()

// To avoid clobbering custom loadout descriptions.
/obj/item/clothing/gloves/ring/set_custom_desc(new_desc)
	base_desc = new_desc
	update_desc()

/obj/item/clothing/gloves/ring/proc/update_desc()
	if(istype(material) && (material_alteration & MAT_FLAG_ALTERATION_DESC))
		desc = "A ring made from [material.solid_name]."
	if(inscription)
		desc += "<br>Written on \the [src] is the inscription \"[inscription]\""
	if(base_desc)
		desc = "[base_desc] [desc]"

/obj/item/clothing/gloves/ring/attackby(var/obj/item/tool, var/mob/user)
	if(can_inscribe && tool.sharp)
		var/new_inscription = sanitize(input("Enter an inscription to engrave.", "Inscription") as null|text)
		if(user.stat || !user.incapacitated() || !user.Adjacent(src) || tool.loc != user)
			return TRUE
		if(!new_inscription)
			return TRUE
		to_chat(user, SPAN_WARNING("You carve \"[new_inscription]\" into \the [src]."))
		inscription = new_inscription
		update_desc()
		return TRUE
	return ..()

/obj/item/clothing/gloves/ring/OnTopic(var/mob/user, var/list/href_list)
	if(href_list["examine"])
		if(istype(user))
			var/mob/living/human/H = get_recursive_loc_of_type(/mob/living/human)
			if(H.Adjacent(user))
				user.examinate(src)
				return TOPIC_HANDLED
	return ..()

/obj/item/clothing/gloves/ring/get_examine_line()
	. = ..()
	. += " <a href='byond://?src=\ref[src];examine=1'>\[View\]</a>"