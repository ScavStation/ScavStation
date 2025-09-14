/mob/living/proc/update_tail_showing(update_icons = TRUE)

	var/obj/item/organ/external/tail/tail_organ = get_organ(BP_TAIL, /obj/item/organ/external/tail)
	if(!istype(tail_organ))
		set_current_mob_overlay(HO_TAIL_LAYER, null, FALSE)
		set_current_mob_underlay(HU_TAIL_LAYER, null, update_icons)
		return

	// Update tail concealment here since it's cheap and it saves checking elsewhere.
	if(tail_organ.tail_hidden && !tail_organ.can_be_hidden())
		tail_organ.tail_hidden = FALSE
		to_chat(src, SPAN_NOTICE("Your [tail_organ.name] is revealed!"))

	var/tail_state = tail_organ.get_tail()
	if(!tail_state)
		set_current_mob_overlay(HO_TAIL_LAYER, null, FALSE)
		set_current_mob_underlay(HU_TAIL_LAYER, null, update_icons)
		return

	var/obj/item/suit = get_equipped_item(slot_wear_suit_str)
	if(suit && (suit.flags_inv & HIDETAIL))
		set_current_mob_overlay(HO_TAIL_LAYER, null, FALSE)
		set_current_mob_underlay(HU_TAIL_LAYER, null, update_icons)
		return

	var/icon/tail_s = get_tail_icon_for_organ(tail_organ, tail_state)
	if(!tail_s)
		set_tail_animation_state(null)
		return

	var/tail_image = image(tail_s, tail_state)
	if(dir == NORTH)
		set_current_mob_underlay(HU_TAIL_LAYER, null, FALSE)
		set_current_mob_overlay(HO_TAIL_LAYER, tail_image, FALSE)
	else
		set_current_mob_overlay(HO_TAIL_LAYER, null, FALSE)
		set_current_mob_underlay(HU_TAIL_LAYER, tail_image, FALSE)

	if(update_icons)
		update_icon()
		compile_overlays()

/mob/living/proc/get_tail_icon_for_organ(obj/item/organ/external/tail/tail_organ, tail_state)

	if(!istype(tail_organ) || !tail_state)
		return

	if(tail_organ.limb_flags & ORGAN_FLAG_SKELETAL)
		if(!tail_organ.bodytype?.skeletal_icon || !(check_state_in_icon(tail_state, tail_organ.bodytype.skeletal_icon)))
			return
		var/tail_cache_key = "[tail_state][tail_organ.bodytype.skeletal_icon]_skeletal"
		if(!global.tail_icon_cache[tail_cache_key])
			global.tail_icon_cache[tail_cache_key] = icon(tail_organ.bodytype.skeletal_icon, tail_state)
		return global.tail_icon_cache[tail_cache_key]

	var/tail_icon  = tail_organ.get_tail_icon()
	if(!tail_icon)
		return // No tail data!

	if(!check_state_in_icon(tail_state, tail_icon))
		return

	// TODO: merge all of this into get_cached_accessory_icon()

	// These values may be null and are generally optional.
	var/hair_colour      = GET_HAIR_COLOR(src)
	var/tail_hair        = tail_organ.get_tail_hair()
	var/tail_blend       = tail_organ.get_tail_blend()
	var/tail_hair_blend  = tail_organ.get_tail_hair_blend()
	var/list/tail_colors = tail_organ.get_tail_metadata()
	if(!islist(tail_colors) || !length(tail_colors))
		return

	var/tail_color       = LAZYACCESS(tail_colors, SAM_COLOR)
	var/tail_inner_color = LAZYACCESS(tail_colors, SAM_COLOR_INNER)
	var/icon_key = "[tail_state][tail_icon][tail_blend][tail_color][tail_inner_color][tail_hair][tail_hair_blend][hair_colour]"
	var/icon/blended_tail_icon = global.tail_icon_cache[icon_key]
	if(!blended_tail_icon)

		// Generate a new icon.
		blended_tail_icon = icon(tail_icon, tail_state)
		if(!isnull(tail_blend)) // 0 is a valid blend mode
			if(tail_color)
				blended_tail_icon.Blend(tail_color, tail_blend)
			if(tail_inner_color)
				var/tail_inner_state = "[tail_state]_inner"
				if(check_state_in_icon(tail_inner_state, tail_icon))
					var/icon/inner_tail = icon(tail_icon, tail_inner_state)
					inner_tail.Blend(tail_inner_color, tail_blend)
					blended_tail_icon.Blend(inner_tail, ICON_OVERLAY)

		// The following will not work with animated tails.
		if(tail_hair)
			var/tail_hair_state = "[tail_state]_[tail_hair]"
			if(check_state_in_icon(tail_hair_state, tail_icon))
				var/icon/hair_icon = icon(tail_icon, tail_hair_state)
				if(hair_colour && !isnull(tail_hair_blend)) // 0 is a valid blend mode
					hair_icon.Blend(hair_colour, tail_hair_blend)
				blended_tail_icon.Blend(hair_icon, ICON_OVERLAY)
		global.tail_icon_cache[icon_key] = blended_tail_icon
	return blended_tail_icon

/mob/living/set_dir()
	var/lastdir = dir
	. = ..()
	if(. && ((lastdir == NORTH) != (dir == NORTH)))
		var/obj/item/organ/external/tail/tail_organ = get_organ(BP_TAIL, /obj/item/organ/external/tail)
		if(tail_organ?.get_tail())
			update_tail_showing()

/mob/living/proc/set_tail_animation_state(var/t_state, update_icons = TRUE)
	var/obj/item/organ/external/tail/tail_organ = get_organ(BP_TAIL, /obj/item/organ/external/tail)
	if(!tail_organ || (tail_organ.limb_flags & ORGAN_FLAG_SKELETAL))
		return null
	// If we don't have animation states, don't try to force us to use one.
	if(t_state != null && !tail_organ.get_tail_animation_states())
		t_state = null
	if(tail_organ.tail_animation_state != t_state)
		tail_organ.tail_animation_state = t_state
		update_tail_showing(update_icons)
	. = get_current_tail_image()

//Not really once, since BYOND can't do that.
//Update this if the ability to flick() images or make looping animation start at the first frame is ever added.
/mob/living/proc/get_current_tail_image()
	return get_current_mob_overlay(HO_TAIL_LAYER) || get_current_mob_underlay(HU_TAIL_LAYER)

/mob/living/proc/animate_tail_once(var/update_icons=1)
	var/obj/item/organ/external/tail/tail_organ = get_organ(BP_TAIL, /obj/item/organ/external/tail)
	if(!tail_organ || (tail_organ.limb_flags & ORGAN_FLAG_SKELETAL))
		return
	var/tail_states = tail_organ.get_tail_animation_states()
	if(tail_states)
		. = set_tail_animation_state("_once[rand(1, tail_states)]", update_icons)
		if(.)
			spawn(2 SECONDS)
				set_tail_animation_state(null, TRUE)

/mob/living/proc/animate_tail_start(var/update_icons=1)
	var/obj/item/organ/external/tail/tail_organ = get_organ(BP_TAIL, /obj/item/organ/external/tail)
	if(!tail_organ || (tail_organ.limb_flags & ORGAN_FLAG_SKELETAL))
		return
	var/tail_states = tail_organ.get_tail_animation_states()
	if(tail_states)
		return set_tail_animation_state("_slow[rand(1, tail_states)]", update_icons)

/mob/living/proc/animate_tail_fast(var/update_icons=1)
	var/obj/item/organ/external/tail/tail_organ = get_organ(BP_TAIL, /obj/item/organ/external/tail)
	if(!tail_organ || (tail_organ.limb_flags & ORGAN_FLAG_SKELETAL))
		return
	var/tail_states = tail_organ.get_tail_animation_states()
	if(tail_states)
		return set_tail_animation_state("_loop[rand(1, tail_states)]", update_icons)

/mob/living/proc/animate_tail_reset(var/update_icons=1)
	var/obj/item/organ/external/tail/tail_organ = get_organ(BP_TAIL, /obj/item/organ/external/tail)
	if(!tail_organ || (tail_organ.limb_flags & ORGAN_FLAG_SKELETAL))
		return
	if(stat != DEAD)
		var/tail_states = tail_organ.get_tail_animation_states()
		if(tail_states)
			return set_tail_animation_state("_idle[rand(1, tail_states)]", update_icons)
	return set_tail_animation_state(null, update_icons)
