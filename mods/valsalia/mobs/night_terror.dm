// A relentless, wendigo-like hunter that only stalks the night. Always beelines for the nearest
// player it can actually path to. It dissolves at dawn
/mob/living/simple_animal/hostile/night_terror
	name = "night terror"
	desc = "A gaunt, antlered horror that moves wrong, all long limbs and hunger."
	icon = 'mods/valsalia/icons/mobs/night_terror.dmi'
	real_name = "night terror"
	response_help_1p = "You reach toward $TARGET$, and immediately think better of it."
	response_help_3p = "$USER$ reaches toward $TARGET$."
	max_health = 150
	natural_weapon = /obj/item/natural_weapon/claws/strong
	move_intents = list(
		/decl/move_intent/walk/night_terror,
		/decl/move_intent/run/night_terror
	)
	base_movement_delay = 0
	faction = "night_terror"
	gene_damage = -1
	butchery_data = null
	ai = /datum/mob_controller/aggressive/night_terror
	// How far it reaches to snuff out light sources
	var/light_smash_radius = 3
	var/light_smash_interval = 10 SECONDS
	var/next_light_smash = 0

// 100% faster than the standard animal move speeds
/decl/move_intent/walk/night_terror
	move_delay = 1 // was 3

/decl/move_intent/run/night_terror
	move_delay = 4/3 // was 2

/mob/living/simple_animal/hostile/night_terror/can_pry_door()
	return FALSE

/mob/living/simple_animal/hostile/night_terror/can_open_doors()
	return FALSE

// Snuffs out anything burning or powered within reach, once every light_smash_interval
/mob/living/simple_animal/hostile/night_terror/proc/try_smash_nearby_lights()
	if(world.time < next_light_smash)
		return
	next_light_smash = world.time + light_smash_interval
	var/smashed_any = FALSE
	for(var/obj/machinery/light/L in orange(light_smash_radius, src))
		if(L.get_status() != LIGHT_BROKEN)
			L.broken()
			smashed_any = TRUE
	for(var/obj/structure/wall_sconce/S in orange(light_smash_radius, src))
		if(S.light_source?.lit)
			S.light_source.extinguish(null, TRUE)
			smashed_any = TRUE
	for(var/obj/item/flame/F in orange(light_smash_radius, src))
		if(isturf(F.loc) && F.lit)
			F.extinguish(null, TRUE)
			smashed_any = TRUE
	if(smashed_any)
		visible_message(SPAN_DANGER("The lights around \the [src] gutter and die!"))

// Checks the daycycle of whatever z-level we're currently standing on (not a hardcoded map) so this
// works on any level with a registered night cycle. Dissolves the instant that level leaves night.
/mob/living/simple_animal/hostile/night_terror/proc/check_dawn()
	var/turf/T = get_turf(src)
	if(!T)
		return FALSE
	var/datum/level_data/level = SSmapping.levels_by_z[T.z]
	if(!level?.daycycle_id)
		return FALSE
	var/datum/daycycle/cycle = SSdaycycle.get_daycycle(level.daycycle_id)
	if(!istype(cycle))
		return FALSE
	var/has_night_period = FALSE
	for(var/datum/daycycle_period/period in cycle.cycle_periods)
		if(istype(period, /datum/daycycle_period/night))
			has_night_period = TRUE
			break
	if(!has_night_period)
		return FALSE
	if(!istype(cycle.current_period, /datum/daycycle_period/night))
		visible_message(SPAN_DANGER("\The [src] unravels into shadow as dawn breaks!"))
		qdel(src)
		return TRUE
	return FALSE

// Cardinal turfs a night terror could actually walk into doors are always impassable to it

/turf/proc/night_terror_open_turfs(ignored_id)
	var/list/open_turfs = list()
	for(var/d in global.cardinal)
		var/turf/T = get_step(src, d)
		if(T?.night_terror_passable())
			open_turfs += T
	return open_turfs

/turf/proc/night_terror_passable()
	if(!simulated || density)
		return FALSE
	for(var/obj/machinery/door/D in src)
		if(D.density)
			return FALSE
	return TRUE

// Used by find_target() below to identify a fallback target when nobody's outdoors
/turf/proc/is_near_wall()
	for(var/d in global.cardinal)
		var/turf/T = get_step(src, d)
		if(!istype(T) || T.density)
			return TRUE
	return FALSE

/datum/mob_controller/aggressive/night_terror/do_process()
	var/mob/living/simple_animal/hostile/night_terror/terror = body
	if(terror.check_dawn())
		return TRUE
	terror.try_smash_nearby_lights()
	return ..()

// start_automove() (BYOND's built-in walk_to) can't path across z-levels, so once its target crosses
// a map-stitch edge onto a connected level it would otherwise just get stuck, unable to "see" someone
/datum/mob_controller/aggressive/night_terror/move_to_target(var/move_only = FALSE)
	if(!body.can_act())
		return
	if(HAS_STATUS(body, STAT_CONFUSE))
		body.start_automove(pick(orange(2, body)))
		return
	stop_wandering()
	var/atom/target = get_target()
	if(!istype(target) || !attackable(target) || !(target in list_targets()))
		lose_target()
		return

	set_stance(STANCE_ATTACKING)

	var/turf/my_turf = get_turf(body)
	var/turf/target_turf = get_turf(target)
	if(!my_turf || !target_turf)
		return

	if(my_turf.z == target_turf.z)
		body.start_automove(target)
		return

	var/datum/level_data/my_level = SSmapping.levels_by_z[my_turf.z]
	var/datum/level_data/target_level = SSmapping.levels_by_z[target_turf.z]
	var/edge_dir = (my_level && target_level) ? LAZYACCESS(my_level.connected_levels, target_level.level_id) : null
	if(!edge_dir)
		return

	var/turf/edge_target
	switch(edge_dir)
		if(WEST)
			edge_target = locate(max(1, my_level.level_inner_min_x - 1), my_turf.y, my_turf.z)
		if(EAST)
			edge_target = locate(min(world.maxx, my_level.level_inner_max_x + 1), my_turf.y, my_turf.z)
		if(SOUTH)
			edge_target = locate(my_turf.x, max(1, my_level.level_inner_min_y - 1), my_turf.z)
		if(NORTH)
			edge_target = locate(my_turf.x, min(world.maxy, my_level.level_inner_max_y + 1), my_turf.z)
	if(edge_target)
		body.start_automove(edge_target)

/datum/mob_controller/aggressive/night_terror/proc/pick_nearest_reachable(list/candidates, turf/my_turf)
	candidates = candidates.Copy()
	while(length(candidates))
		var/mob/living/human/nearest
		var/nearest_dist = INFINITY
		for(var/mob/living/human/H in candidates)
			if(candidates[H] < nearest_dist)
				nearest_dist = candidates[H]
				nearest = H
		if(!nearest)
			break
		if(AStar(my_turf, get_turf(nearest), TYPE_PROC_REF(/turf, night_terror_open_turfs), TYPE_PROC_REF(/turf, Distance), 0, 60))
			return nearest
		candidates -= nearest
	return null

/datum/mob_controller/aggressive/night_terror/find_target()
	if(!body.can_act() || !body.faction)
		return null
	resume_wandering()

	var/turf/my_turf = get_turf(body)
	if(!my_turf)
		return null

	var/list/outdoor_candidates = list()
	var/list/wall_candidates = list()
	var/list/all_candidates = list()
	for(var/mob/living/human/H in global.human_mob_list)
		if(!valid_target(H))
			continue
		var/turf/target_turf = get_turf(H)
		if(!target_turf || target_turf.z != my_turf.z)
			continue
		var/dist = get_dist(my_turf, target_turf)
		all_candidates[H] = dist
		if(H.is_outside() == OUTSIDE_YES)
			outdoor_candidates[H] = dist
		else if(target_turf.is_near_wall())
			wall_candidates[H] = dist

	var/mob/living/human/target = pick_nearest_reachable(outdoor_candidates, my_turf) || pick_nearest_reachable(wall_candidates, my_turf) || pick_nearest_reachable(all_candidates, my_turf)
	if(!target)
		return null

	set_stance(STANCE_ATTACK)
	body.face_atom(target)
	return target

/datum/mob_controller/aggressive/night_terror/list_targets(var/dist = 7)
	var/atom/current = get_target()
	if(istype(current) && valid_target(current))
		return list(current)
	return list()
