#define SOAP_MAX_VOLUME     30 //Maximum volume the soap can contain
#define SOAP_CLEANER_ON_WET 15 //Volume of cleaner generated when wetting the soap

/obj/item/soap
	name = "soap"
	desc = "A cheap bar of soap. Doesn't smell."
	gender = PLURAL
	icon = 'icons/obj/items/soap.dmi'
	icon_state = "soap"
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	w_class = ITEM_SIZE_SMALL
	throw_speed = 4
	throw_range = 20
	material = /decl/material/liquid/cleaner/soap
	max_health = 5
	_base_attack_force = 0
	var/key_data

	var/list/valid_colors = list(COLOR_GREEN_GRAY, COLOR_RED_GRAY, COLOR_BLUE_GRAY, COLOR_BROWN, COLOR_PALE_PINK, COLOR_PALE_BTL_GREEN, COLOR_OFF_WHITE, COLOR_GRAY40, COLOR_GOLD)
	var/list/valid_scents = list("fresh air", "cinnamon", "mint", "cocoa", "lavender", "an ocean breeze", "a summer garden", "vanilla", "cheap perfume")
	var/list/scent_intensity = list("faintly", "strongly", "overbearingly")
	var/list/valid_shapes = list("oval", "circular", "rectangular", "square")
	var/decal_name
	var/list/decals = list("diamond", "heart", "circle", "triangle", "")

/obj/item/soap/crafted
	desc = "A lump of home-made soap."
	icon_state = "soap-lump"
	material_alteration = MAT_FLAG_ALTERATION_COLOR

/obj/item/soap/crafted/generate_icon()
	return

/obj/item/soap/initialize_reagents(populate = TRUE)
	create_reagents(SOAP_MAX_VOLUME)
	. = ..()

/obj/item/soap/populate_reagents()
	wet()

/obj/item/soap/Initialize()
	. = ..()
	initialize_reagents()
	generate_icon()

/obj/item/soap/proc/generate_icon()
	var/shape = pick(valid_shapes)
	var/scent = pick(valid_scents)
	var/smelly = pick(scent_intensity)
	icon_state = "soap-[shape]"
	set_color(pick(valid_colors))
	decal_name = pick(decals)
	desc = "\A [shape] bar of soap. It smells [smelly] of [scent]."
	update_icon()

/obj/item/soap/proc/wet()
	add_to_reagents(/decl/material/liquid/cleaner/soap, SOAP_CLEANER_ON_WET)

/obj/item/soap/Crossed(atom/movable/AM)
	var/mob/living/victim = AM
	if(istype(victim))
		victim.slip("\the [src]", 3)
	return ..()

/obj/item/soap/afterattack(atom/target, mob/user, proximity)

	if(!proximity)
		return ..()

	if(istype(target,/obj/structure/hygiene/sink))
		to_chat(user, SPAN_NOTICE("You wet \the [src] in the sink."))
		wet()
		return TRUE

	if(reagents?.total_volume < 1)
		to_chat(user, SPAN_WARNING("\The [src] is too dry to clean \the [target]."))
		return TRUE

	if(isturf(target) || istype(target, /obj/structure/catwalk))
		target = get_turf(target)
		if(!isturf(target))
			return ..()
		user.visible_message(SPAN_NOTICE("\The [user] starts scrubbing \the [target]."))
		if(!do_after(user, 8 SECONDS, target) && reagents?.total_volume)
			return TRUE
		to_chat(user, SPAN_NOTICE("You scrub \the [target] clean."))
	else if(istype(target,/obj/effect/decal/cleanable))
		to_chat(user, SPAN_NOTICE("You scrub \the [target.name] out."))
	else
		to_chat(user, SPAN_NOTICE("You clean \the [target.name]."))

	reagents.touch_atom(target)
	reagents.remove_any(1)
	user.update_personal_goal(/datum/goal/clean, 1)
	return TRUE

//attack_as_weapon
/obj/item/soap/use_on_mob(mob/living/target, mob/living/user, animate = TRUE)
	if(ishuman(target) && user?.a_intent != I_HURT)
		var/mob/living/human/victim = target
		if(user.get_target_zone() == BP_MOUTH && victim.check_has_mouth())
			user.visible_message(SPAN_DANGER("\The [user] washes \the [target]'s mouth out with soap!"))
			if(reagents)
				reagents.trans_to_mob(target, reagents.total_volume / 2, CHEM_INGEST)
		else
			user.visible_message(SPAN_NOTICE("\The [user] cleans \the [target]."))
			if(reagents)
				reagents.trans_to(target, reagents.total_volume / 8)
			target.clean()
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN) //prevent spam
		return TRUE
	return ..()

/obj/item/soap/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/key))
		if(key_data)
			to_chat(user, SPAN_WARNING("\The [src] already has a key imprint."))
		else
			to_chat(user, SPAN_NOTICE("You imprint \the [I] into \the [src]."))
			var/obj/item/key/K = I
			key_data = K.key_data
			update_icon()
		return TRUE
	return ..()

/obj/item/soap/on_update_icon()
	. = ..()
	if(key_data)
		add_overlay("soap_key_overlay")
	else if(decal_name)
		add_overlay("decal-[decal_name]")

#undef SOAP_MAX_VOLUME
#undef SOAP_CLEANER_ON_WET