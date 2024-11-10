//Todo: add leather and cloth for arbitrary coloured stools.
/obj/item/stool
	name                = "stool"
	desc                = "Apply butt."
	icon                = 'icons/obj/stool.dmi'
	icon_state          = ICON_STATE_WORLD
	randpixel           = 0
	w_class             = ITEM_SIZE_HUGE
	material            = DEFAULT_FURNITURE_MATERIAL
	material_alteration = MAT_FLAG_ALTERATION_NAME | MAT_FLAG_ALTERATION_COLOR
	obj_flags           = OBJ_FLAG_SUPPORT_MOB | OBJ_FLAG_ROTATABLE
	_base_attack_force  = 10
	var/padding_color
	var/decl/material/padding_material

/obj/item/stool/padded
	icon_state = "stool_padded_preview" //set for the map
	padding_material = /decl/material/solid/organic/cloth
	padding_color = "#9d2300"

/obj/item/stool/Initialize()
	. = ..()
	if(!istype(material))
		return INITIALIZE_HINT_QDEL
	if(ispath(padding_material, /decl/material))
		padding_material = GET_DECL(padding_material)
	update_icon()

/obj/item/stool/bar
	name = "bar stool"
	icon = 'icons/obj/bar_stool.dmi'

/obj/item/stool/bar/padded
	icon_state = "bar_stool_padded_preview"
	padding_material = /decl/material/solid/organic/cloth
	padding_color = "#9d2300"

/obj/item/stool/update_name()
	..()
	if(material_alteration & MAT_FLAG_ALTERATION_NAME)
		SetName("[padding_material?.adjective_name || material.adjective_name] [base_name || initial(name)]")
	update_desc()

/obj/item/stool/proc/update_desc()
	if(padding_material)
		desc = "A padded stool. Apply butt. It's made of [material.use_name] and covered with [padding_material.use_name]."
	else
		desc = "A stool. Apply butt with care. It's made of [material.use_name]."

/obj/item/stool/on_update_icon()
	. = ..()
	icon_state = get_world_inventory_state()
	if(padding_material)
		add_overlay(overlay_image(icon, "[icon_state]-padding", padding_color || padding_material.color, RESET_COLOR|RESET_ALPHA))
	// Strings.
	update_name()
	update_desc()

/obj/item/stool/apply_additional_mob_overlays(mob/living/user_mob, bodytype, image/overlay, slot, bodypart, use_fallback_if_icon_missing)
	. = ..()
	if(padding_material)
		overlay.add_overlay(overlay_image(icon, "[overlay.icon_state]-padding", padding_color || padding_material.color, RESET_COLOR|RESET_ALPHA))

/obj/item/stool/proc/add_padding(var/padding_type, var/new_padding_color)
	padding_material = GET_DECL(padding_type)
	padding_color = new_padding_color
	update_icon()

/obj/item/stool/proc/remove_padding()
	if(padding_material)
		var/list/res = padding_material.create_object(get_turf(src))
		if(padding_color)
			for(var/obj/item/thing in res)
				thing.set_color(padding_color)
	padding_material = null
	padding_color = null
	update_icon()

/obj/item/stool/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if (prob(5))
		user.visible_message("<span class='danger'>[user] breaks [src] over [target]'s back!</span>")
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.do_attack_animation(target)
		dismantle() //This deletes self.

		var/blocked = target.get_blocked_ratio(hit_zone, BRUTE, damage = 20)
		SET_STATUS_MAX(target, STAT_WEAK, (10 * (1 - blocked)))
		target.apply_damage(20, BRUTE, hit_zone, src)
		return 1

	return ..()

/obj/item/stool/explosion_act(severity)
	. = ..()
	if(. && !QDELETED(src) && (severity == 1 || (severity == 2 && prob(50)) || (severity == 3 && prob(5))))
		physically_destroyed()

/obj/item/stool/proc/dismantle()
	if(material)
		material.create_object(get_turf(src))
	if(padding_material)
		padding_material.create_object(get_turf(src))
	qdel(src)

/// Return TRUE if the stool is capable of supporting padding.
/// This should not check existing padding state, just whether
/// the behavior is supported at all.
/obj/item/stool/proc/can_be_padded()
	return TRUE

/obj/item/stool/attackby(obj/item/W, mob/user)
	if(IS_WRENCH(W))
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		dismantle()
		return TRUE
	else if(can_be_padded())
		if(istype(W,/obj/item/stack))
			if(padding_material)
				to_chat(user, "\The [src] is already padded.")
				return TRUE
			var/obj/item/stack/C = W
			if(C.get_amount() < 1) // How??
				qdel(C)
				return TRUE

			var/padding_type
			var/new_padding_color
			if(istype(W, /obj/item/stack/tile) || istype(W, /obj/item/stack/material/bolt))
				padding_type = W.material?.type
				new_padding_color = W.paint_color

			if(padding_type)
				var/decl/material/padding_mat = GET_DECL(padding_type)
				if(!istype(padding_mat) || !(padding_mat.flags & MAT_FLAG_PADDING))
					padding_type = null

			if(!padding_type)
				to_chat(user, "You cannot pad \the [src] with that.")
				return TRUE

			C.use(1)
			if(!isturf(src.loc))
				user.drop_from_inventory(src)
				src.dropInto(loc)
			to_chat(user, "You add padding to \the [src].")
			add_padding(padding_type, new_padding_color)
			return TRUE

		else if(IS_WIRECUTTER(W))
			if(!padding_material)
				to_chat(user, "\The [src] has no padding to remove.")
				return TRUE
			to_chat(user, "You remove the padding from \the [src].")
			playsound(src, 'sound/items/Wirecutter.ogg', 100, 1)
			remove_padding()
			return TRUE
	return ..()

/obj/item/stool/rustic
	name = "stool"
	icon = 'icons/obj/stool_rustic.dmi'
	material = /decl/material/solid/organic/wood/walnut
	color = /decl/material/solid/organic/wood/walnut::color

/obj/item/stool/rustic/update_name()
	..()
	SetName("rustic [name]") // rustic oaken stool, not oaken rustic stool

/obj/item/stool/rustic/can_be_padded()
	return FALSE

/obj/item/stool/rustic/update_desc()
	desc = "A rustic stool carved from wood. It's a little rickety and wobbles under any weight, but it'll do."

//Generated subtypes for mapping porpoises
/obj/item/stool/wood
	material = /decl/material/solid/organic/wood
