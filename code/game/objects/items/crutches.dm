/obj/item/crutch
	abstract_type = /obj/item/crutch
	name = "crutch"
	desc = "A mobility aid for those with impaired use of their legs or feet, placed underneath the arm for support."
	icon = 'icons/obj/items/crutches.dmi'
	icon_state = ICON_STATE_WORLD
	base_parry_chance = 10
	material_alteration = MAT_FLAG_ALTERATION_ALL
	w_class = ITEM_SIZE_LARGE
	max_health = null // autoset from material
	/// The material used for the padding. If null, the crutch is unpadded. Initially a typepath, set to an instance in Initialize.
	var/decl/material/padding_material
	/// The color used for the padding, in the case of paint or dye. If null, falls back to padding material color.
	var/padding_color = null

/obj/item/crutch/Initialize(ml, material_key)
	padding_material = GET_DECL(padding_material)
	return ..()

// potential todo: to avoid matter shenanigans make padding a separate item that can be removed via alt interaction and added via attackby?
// add padding by clicking with sewing tools in active hand and fabric in offhand?
/obj/item/crutch/create_matter()
	. = ..()
	if(padding_material)
		matter[padding_material.type] += MATTER_AMOUNT_TRACE

/obj/item/crutch/get_stance_support_value()
	return LIMB_UNUSABLE

/obj/item/crutch/get_autopsy_descriptors()
	. = ..() + "narrow"

/obj/item/crutch/on_update_icon()
	. = ..()
	if(padding_material)
		add_overlay(overlay_image(icon, "[icon_state]-padding", padding_color || padding_material.color, RESET_COLOR | RESET_ALPHA))

/obj/item/crutch/apply_additional_mob_overlays(mob/living/user_mob, bodytype, image/overlay, slot, bodypart, use_fallback_if_icon_missing = TRUE)
	if(padding_material)
		overlay.add_overlay(overlay_image(icon, "[overlay.icon_state]-padding", padding_color || padding_material.color, RESET_COLOR | RESET_ALPHA))
	. = ..()

/obj/item/crutch/examine(mob/user, distance, infix, suffix)
	. = ..()
	if(padding_material)
		to_chat(user, "It has been padded with [padding_color ? "<font color='[padding_color]'>[padding_material.paint_verb]</font> " : null][padding_material.use_name].")

/obj/item/crutch/aluminum
	material = /decl/material/solid/metal/aluminium

/obj/item/crutch/aluminum/padded
	padding_material = /decl/material/solid/organic/plastic/foam
	padding_color = COLOR_GRAY20

/obj/item/crutch/wooden
	material = /decl/material/solid/organic/wood // oak

/obj/item/crutch/wooden/padded
	padding_material = /decl/material/solid/organic/leather