/obj/structure
	icon = 'icons/obj/structures/barricade.dmi'
	w_class = ITEM_SIZE_STRUCTURE
	layer = STRUCTURE_LAYER
	abstract_type = /obj/structure
	max_health = 50
	temperature_sensitive = TRUE

	/// Multiplier for degree of comfort offered to mobs buckled to this furniture.
	var/user_comfort = 0 // TODO: extremely uncomfortable chairs

	var/structure_flags
	var/last_damage_message
	var/hitsound = 'sound/weapons/Genhit.ogg'
	var/parts_type
	var/parts_amount
	var/footstep_type
	var/mob_offset

	var/paint_color
	var/paint_verb

/obj/structure/get_color()
	if(paint_color)
		return paint_color
	if(istype(material) && (material_alteration & MAT_FLAG_ALTERATION_COLOR))
		return material.color
	return initial(color)

/obj/structure/set_color(new_color)
	if(new_color == COLOR_WHITE)
		new_color = null
	if(paint_color != new_color)
		paint_color = new_color
		. = TRUE
		refresh_color()

/obj/structure/refresh_color()
	if(paint_color)
		color = paint_color
	else if(material && (material_alteration & MAT_FLAG_ALTERATION_COLOR))
		color = material.color
	else
		color = null

/obj/structure/create_matter()
	..()
	if(material || reinf_material)
		LAZYINITLIST(matter)
		var/matter_mult = get_matter_amount_modifier()
		if(material)
			matter[material.type] = max(matter[material.type], round(MATTER_AMOUNT_PRIMARY * matter_mult))
		if(reinf_material)
			matter[reinf_material.type] = max(matter[reinf_material.type], round(MATTER_AMOUNT_REINFORCEMENT * matter_mult))
		UNSETEMPTY(matter)

/obj/structure/Initialize(var/ml, var/_mat, var/_reinf_mat)
	if(ispath(_mat, /decl/material))
		material = _mat
	if(ispath(material, /decl/material))
		material = GET_DECL(material)
	if(ispath(_reinf_mat, /decl/material))
		reinf_material = _reinf_mat
	if(ispath(reinf_material, /decl/material))
		reinf_material = GET_DECL(reinf_material)
	. = ..()
	update_materials()
	paint_verb ||= "painted" // fallback for the case of no material
	if(lock && !istype(loc))
		lock = new /datum/lock(src, lock)
	if(!CanFluidPass())
		fluid_update(TRUE)

/obj/structure/examine(mob/user, distance, infix, suffix)
	. = ..()

	if(distance <= 3)

		if(distance <= 1 && lock)
			to_chat(user, SPAN_NOTICE("\The [src] appears to have a lock, opened by '[lock.lock_data]'."))

		var/damage_desc = get_examined_damage_string()
		if(length(damage_desc))
			to_chat(user, damage_desc)

		if(paint_color)
			var/decl/pronouns/structure_pronouns = get_pronouns() // so we can do 'have' for plural objects like sheets
			to_chat(user, "\The [src] [structure_pronouns.has] been <font color='[paint_color]'>[paint_verb]</font>.")

		if(tool_interaction_flags & TOOL_INTERACTION_ANCHOR)
			if(anchored)
				to_chat(user, SPAN_SUBTLE("Can be unanchored with a wrench or hammer, and moved around."))
			else
				to_chat(user, SPAN_SUBTLE("Can be anchored in place with a wrench or hammer."))

		if(tool_interaction_flags & TOOL_INTERACTION_DECONSTRUCT)
			var/removed_with = "a crowbar or hammer"
			if(material && material.removed_by_welder)
				removed_with = "a welding torch"
			if(tool_interaction_flags & TOOL_INTERACTION_ANCHOR)
				if(anchored)
					to_chat(user, SPAN_SUBTLE("Can be deconstructed with [removed_with]."))
				else
					to_chat(user, SPAN_SUBTLE("Can be deconstructed with [removed_with], if anchored down with a wrench or hammer first."))
			else
				to_chat(user, SPAN_SUBTLE("Can be deconstructed with [removed_with]."))

		if(tool_interaction_flags & TOOL_INTERACTION_WIRING)
			if(tool_interaction_flags & TOOL_INTERACTION_ANCHOR)
				if(wired)
					if(anchored)
						to_chat(user, SPAN_SUBTLE("Can have its wiring removed with wirecutters."))
					else
						to_chat(user, SPAN_SUBTLE("Can have its wiring removed with wirecutters, if anchored down with a wrench first."))
				else
					if(anchored)
						to_chat(user, SPAN_SUBTLE("Can have wiring installed with a cable coil."))
					else
						to_chat(user, SPAN_SUBTLE("Can have wiring installed with a cable coil, if anchored down with a wrench first."))
			else
				if(wired)
					to_chat(user, SPAN_SUBTLE("Can have its wiring removed with wirecutters."))
				else
					to_chat(user, SPAN_SUBTLE("Can have wiring installed with a cable coil."))

/obj/structure/proc/mob_breakout(var/mob/living/escapee)
	set waitfor = FALSE
	return FALSE

/obj/structure/take_damage(damage, damage_type = BRUTE, damage_flags, inflicter, armor_pen = 0, silent, do_update_health)
	if(current_health == -1) // This object does not take damage.
		return

	if(material && material.is_brittle())
		if(reinf_material)
			if(reinf_material.is_brittle())
				damage *= STRUCTURE_BRITTLE_MATERIAL_DAMAGE_MULTIPLIER
		else
			damage *= STRUCTURE_BRITTLE_MATERIAL_DAMAGE_MULTIPLIER

	playsound(loc, hitsound, 60, 1)
	var/current_max_health = get_max_health()
	current_health = clamp(current_health - damage, 0, current_max_health)
	show_damage_message(current_health/current_max_health)

	if(current_health == 0)
		physically_destroyed()

/obj/structure/proc/show_damage_message(var/perc)
	if(perc > 0.75)
		return
	if(perc <= 0.25 && last_damage_message < 0.25)
		visible_message(SPAN_DANGER("\The [src] looks like it's about to break!"))
		last_damage_message = 0.25
	else if(perc <= 0.5 && last_damage_message < 0.5)
		visible_message(SPAN_WARNING("\The [src] looks seriously damaged!"))
		last_damage_message = 0.5
	else if(perc <= 0.75 && last_damage_message < 0.75)
		visible_message(SPAN_WARNING("\The [src] is showing some damage!"))
		last_damage_message = 0.75

/obj/structure/physically_destroyed(var/skip_qdel)
	if((. = ..(TRUE)))
		return dismantle_structure()

/obj/structure/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	. = ..()
	var/dmg = 100
	if(istype(material))
		dmg = round(dmg * material.combustion_effect(get_turf(src),temperature, 0.3))
	if(dmg)
		take_damage(dmg)

/obj/structure/ProcessAtomTemperature()
	var/update_mats = FALSE
	if(material && material.bakes_into_material && !isnull(material.bakes_into_at_temperature) && temperature >= material.bakes_into_at_temperature)
		material = GET_DECL(material.bakes_into_material)
		update_mats = TRUE
	if(reinf_material && reinf_material.bakes_into_material && !isnull(reinf_material.bakes_into_at_temperature) && temperature >= reinf_material.bakes_into_at_temperature)
		reinf_material = GET_DECL(reinf_material.bakes_into_material)
		update_mats = TRUE
	if(update_mats)
		update_materials()
	. = ..()

/obj/structure/Destroy()
	QDEL_NULL(lock)
	var/turf/T = get_turf(src)
	. = ..()
	if(T)
		T.fluid_update()
		for(var/atom/movable/AM in T)
			AM.reset_offsets()
			AM.reset_plane_and_layer()

/obj/structure/Crossed(atom/movable/AM)
	. = ..()
	if(!ismob(AM))
		return
	var/mob/M = AM
	M.reset_offsets()
	M.reset_plane_and_layer()

/obj/structure/Uncrossed(atom/movable/AM)
	. = ..()
	if(!ismob(AM))
		return
	var/mob/M = AM
	M.reset_offsets()
	M.reset_plane_and_layer()

/obj/structure/Move()
	var/turf/T = get_turf(src)
	. = ..()
	if(. && !CanFluidPass())
		fluid_update()
		if(T)
			T.fluid_update()
			for(var/atom/movable/AM in T)
				AM.reset_offsets()
				AM.reset_plane_and_layer()

/obj/structure/grab_attack(obj/item/grab/grab, mob/user)

	if (!grab.force_danger())
		to_chat(user, SPAN_WARNING("You need a better grip to do that!"))
		return TRUE

	var/mob/living/victim = grab.get_affecting_mob()
	if(user.a_intent == I_HURT)

		if(!istype(victim))
			to_chat(user, SPAN_WARNING("You need to be grabbing a living creature to do that!"))
			return TRUE

		// Slam their face against the table.
		var/blocked = victim.get_blocked_ratio(BP_HEAD, BRUTE, damage = 8)
		if (prob(30 * (1 - blocked)))
			SET_STATUS_MAX(victim, STAT_WEAK, 5)

		victim.apply_damage(8, BRUTE, BP_HEAD)
		visible_message(SPAN_DANGER("[user] slams [victim]'s face against \the [src]!"))
		if (material)
			playsound(loc, material.tableslam_noise, 50, 1)
		else
			playsound(loc, 'sound/weapons/tablehit1.ogg', 50, 1)
		var/list/L = take_damage(rand(1,5))
		for(var/obj/item/shard/S in L)
			if(S.sharp && prob(50))
				victim.visible_message(
					SPAN_DANGER("\The [S] slices into [victim]'s face!"),
					SPAN_DANGER("\The [S] slices into your face!")
				)
				victim.standard_weapon_hit_effects(S, user, S.get_attack_force()*2, BP_HEAD)
		qdel(grab)
	else if(atom_flags & ATOM_FLAG_CLIMBABLE)
		var/obj/occupied = turf_is_crowded()
		if (occupied)
			to_chat(user, SPAN_WARNING("There's \a [occupied] in the way."))
			return TRUE
		grab.affecting.forceMove(src.loc)
		if(victim)
			SET_STATUS_MAX(victim, STAT_WEAK, rand(2,5))
		visible_message(SPAN_DANGER("\The [user] puts \the [grab.affecting] on \the [src]."))
		qdel(grab)
		return TRUE

/obj/structure/explosion_act(severity)
	..()
	if(!QDELETED(src))
		if(severity == 1)
			physically_destroyed()
		else if(severity == 2)
			take_damage(rand(20, 30))
		else
			take_damage(rand(5, 15))

/obj/structure/proc/can_repair(var/mob/user)
	if(current_health >= get_max_health())
		to_chat(user, SPAN_NOTICE("\The [src] does not need repairs."))
		return FALSE
	return TRUE

/obj/structure/bullet_act(var/obj/item/projectile/Proj)
	if(take_damage(Proj.get_structure_damage(), Proj.atom_damage_type))
		return PROJECTILE_CONTINUE

/*
Automatic alignment of items to an invisible grid, defined by CELLS and CELLSIZE, defined in code/__defines/misc.dm.
Since the grid will be shifted to own a cell that is perfectly centered on the turf, we end up with two 'cell halves'
on edges of each row/column.
Each item defines a center_of_mass, which is the pixel of a sprite where its projected center of mass toward a turf
surface can be assumed. For a piece of paper, this will be in its center. For a bottle, it will be (near) the bottom
of the sprite.
auto_align() will then place the sprite so the defined center_of_mass is at the bottom left corner of the grid cell
closest to where the cursor has clicked on.
Note: This proc can be overwritten to allow for different types of auto-alignment.
*/
/obj/structure/proc/auto_align(obj/item/W, click_params)
	if (!W.center_of_mass) // Clothing, material stacks, generally items with large sprites where exact placement would be unhandy.
		W.pixel_x = rand(-W.randpixel, W.randpixel)
		W.pixel_y = rand(-W.randpixel, W.randpixel)
		W.pixel_z = 0
		return
	if (!click_params)
		return
	var/list/click_data = params2list(click_params)
	if (!click_data["icon-x"] || !click_data["icon-y"])
		return
	// Calculation to apply new pixelshift.
	var/mouse_x = text2num(click_data["icon-x"])-1 // Ranging from 0 to 31
	var/mouse_y = text2num(click_data["icon-y"])-1
	var/span_x = CELLS
	var/span_y = CELLS
	// In case we're a multitile object.
	if(bound_width > world.icon_size)
		span_x = bound_width / CELLSIZE
	if(bound_height > world.icon_size)
		span_y = bound_height / CELLSIZE
	var/cell_x = clamp(round(mouse_x/CELLSIZE), 0, span_x-1) // Ranging from 0 to span_x-1
	var/cell_y = clamp(round(mouse_y/CELLSIZE), 0, span_y-1)
	var/list/center = cached_json_decode(W.center_of_mass)
	W.pixel_x = (CELLSIZE * (cell_x + 0.5)) - center["x"]
	W.pixel_y = (CELLSIZE * (cell_y + 0.5)) - center["y"]
	W.pixel_z = 0

// Does this structure override turf depth for the purposes of mob offsets?
/obj/structure/proc/is_platform()
	return FALSE

/obj/structure/proc/is_z_passable()
	return TRUE

/obj/structure/on_turf_height_change(new_height)
	 // We may be a fixed point.
	return !is_platform() && ..()
