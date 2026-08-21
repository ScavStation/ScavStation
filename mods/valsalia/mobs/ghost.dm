// A restless spirit that drifts through walls and furniture to close in on whoever it's stalking.
/mob/living/simple_animal/hostile/stalker
	name = "restless shade"
	desc = "A flickering, half-seen shape that seems to drift half a step out of reality."
	icon = 'mods/valsalia/icons/mobs/ghost.dmi'
	icon_state = "world"
	real_name = "restless shade"
	response_help_1p = "Your hand passes through $TARGET$."
	response_help_3p = "$USER$'s hand passes through $TARGET$."
	max_health = 60
	status_flags = GODMODE // it can't be harmed or killed, only ran away from
	natural_weapon = /obj/item/natural_weapon/shade_touch
	density = FALSE
	supernatural = TRUE
	min_gas = null
	max_gas = null
	minbodytemp = 0
	maxbodytemp = 4000
	faction = "restless"
	gene_damage = -1
	butchery_data = null
	// Bypasses movement collision entirely
	movement_handlers = list(/datum/movement_handler/mob/multiz_connected, /datum/movement_handler/mob/incorporeal)

	ranged_range = 6
	projectiletype = /obj/item/projectile/beam/shade_wail
	projectilesound = 'sound/hallucinations/wail.ogg'
	fire_desc = "reaches toward"

	// Light is its weakness, see MayEnterTurf()/flee_light() below. Kept close to the ~0.5 unlit
	// baseline so even a single weak source (torch) is enough to register and block it.
	var/light_avoid_threshold = 0.52 // get_lumcount() is 0-1; unlit/ambient tiles read ~0.5
	var/light_smash_radius = 12
	var/light_smash_interval = 30 SECONDS
	var/next_light_smash = 0.
	var/turf/last_flee_turf
	var/flee_stuck_since = 0
	var/flee_stuck_timeout = 10 SECONDS
	var/ignore_light_until = 0
	var/lifespan = 5 MINUTES
	ai = /datum/mob_controller/aggressive/stalker

/mob/living/simple_animal/hostile/stalker/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(expire)), lifespan)

/mob/living/simple_animal/hostile/stalker/proc/expire()
	visible_message(SPAN_DANGER("\The [src] fades away, as if it has returned from whence it came."))
	qdel(src)

// the ranged attack is just a filler while it closes the distance ---- NOT BEING USED CURRENTLY
/obj/item/projectile/beam/shade_wail
	name = "chilling wail"
	damage = 8
	eyeblur = 0

// No windup means it lands almost every swing, so the hit itself is weaker to compensate
/obj/item/natural_weapon/shade_touch
	name = "unnatural grasp"
	attack_verb = list("clawed at", "grasped")
	atom_damage_type = OXY
	_base_attack_force = 3

// Deactivated - melee only for now.
/mob/living/simple_animal/hostile/stalker/has_ranged_attack()
	return FALSE

// No wind up for attack
/mob/living/simple_animal/hostile/stalker/get_attack_telegraph_delay()
	return 0

// Refuses to step into well-lit tiles at all straight up/down through a floor or ceiling,
/mob/living/simple_animal/hostile/stalker/MayEnterTurf(turf/T)
	. = ..()
	if(!. || !istype(T))
		return .
	if(T == GetAbove(src) || T == GetBelow(src))
		return TRUE
	if(world.time < ignore_light_until)
		return TRUE
	if(T.get_lumcount() > light_avoid_threshold)
		. = FALSE

// If it's caught in the light step towards the darkest adjacent tile instead of doing anything else
/mob/living/simple_animal/hostile/stalker/proc/flee_light()
	var/turf/T = get_turf(src)
	if(!istype(T) || T.get_lumcount() <= light_avoid_threshold)
		flee_stuck_since = 0
		return FALSE

	if(T == last_flee_turf)
		if(!flee_stuck_since)
			flee_stuck_since = world.time
		else if(world.time - flee_stuck_since >= flee_stuck_timeout)
			ignore_light_until = world.time + 3 SECONDS
			flee_stuck_since = 0
	else
		flee_stuck_since = world.time
	last_flee_turf = T
	var/turf/darkest = T
	var/darkest_lumcount = T.get_lumcount()
	for(var/turf/nearby in oview(1, src))
		var/nearby_lumcount = nearby.get_lumcount()
		if(nearby_lumcount < darkest_lumcount)
			darkest_lumcount = nearby_lumcount
			darkest = nearby
	if(darkest != T)
		SelfMove(get_dir(src, darkest))
	return TRUE

// Shatters/snuffs every unbroken light within light_smash_radius
/mob/living/simple_animal/hostile/stalker/proc/try_smash_nearby_lights()
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
		visible_message(SPAN_DANGER("The lights around \the [src] shatter and gutter out!"))

// Always closes the distance for melee
/datum/mob_controller/aggressive/stalker
	var/list/marked_targets
	var/max_marked_targets = 2
	var/ranged_attack_interval = 6 SECONDS
	var/next_ranged_attack = 0

/datum/mob_controller/aggressive/stalker/open_fire()
	if(world.time < next_ranged_attack)
		return FALSE
	next_ranged_attack = world.time + ranged_attack_interval
	return ..()

// Tries to smash / flee any light it's currently standing in before doing anything but never while next to target
/datum/mob_controller/aggressive/stalker/do_process()
	var/mob/living/simple_animal/hostile/stalker/shade = body
	shade.try_smash_nearby_lights()
	var/atom/target = get_target()
	var/mid_attack = istype(target) && shade.Adjacent(target)
	if(!mid_attack && shade.flee_light())
		return TRUE
	return ..()

/datum/mob_controller/aggressive/stalker/move_to_target(var/move_only = FALSE)
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
	var/same_z = my_turf && target_turf && my_turf.z == target_turf.z

	if(same_z)
		body.start_automove(target)
	else if(my_turf && target_turf)
		// start_automove()'s default pathing doesnt track z level, so step through floors/ceilings by hand until correct z.
		body.stop_automove()
		var/step_dir = get_dir_multiz(my_turf, target_turf)
		if(step_dir)
			body.SelfMove(step_dir)

	// Can't melee yet (not adjacent) - take a ranged potshot if it's in range
	if(!move_only && same_z && !body.Adjacent(target) && body.has_ranged_attack() && get_dist(body, target) <= body.get_ranged_attack_distance())
		open_fire()

// It's untouchable so being attacked isn't a threat worth reacting to, but retaliate() is required
// to call its parent, and the parent retargets/moves toward whoever just hit it. So let it run, then
// immediately restore whatever it was hunting before, undoing that retarget instead of skipping it.
/datum/mob_controller/aggressive/stalker/retaliate(atom/source)
	var/atom/original_target = get_target()
	. = ..()
	set_target(original_target)

/datum/mob_controller/aggressive/stalker/list_targets(var/dist = 7)
	. = list()
	for(var/weakref/W in marked_targets)
		var/mob/living/M = W.resolve()
		if(M)
			. += M

/datum/mob_controller/aggressive/stalker/find_target()
	if(!body.can_act() || !body.faction)
		return null
	resume_wandering()

	for(var/weakref/W in marked_targets?.Copy())
		var/mob/living/M = W.resolve()
		if(!M || !valid_target(M))
			LAZYREMOVE(marked_targets, W)

	// Top up the hitlist, not just whoever happens to be nearby.
	if(LAZYLEN(marked_targets) < max_marked_targets)
		var/list/candidates = list()
		for(var/mob/living/human/H in global.human_mob_list)
			if(H == body || (weakref(H) in marked_targets))
				continue
			if(valid_target(H))
				candidates += H
		while(LAZYLEN(marked_targets) < max_marked_targets && length(candidates))
			LAZYDISTINCTADD(marked_targets, weakref(pick_n_take(candidates)))

	if(!LAZYLEN(marked_targets))
		return null

	set_stance(STANCE_ATTACK)
	var/weakref/chosen = marked_targets[1]
	return chosen.resolve()
