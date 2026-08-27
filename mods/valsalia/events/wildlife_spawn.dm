// Preset spawn point for valSal port's forest wildlife. Place these on the map instead of mapping
// the animals in directly - see /obj/abstract/landmark/wildlife_spawn.
/obj/abstract/landmark/wildlife_spawn/valSal_port/forest
	name = "forest wildlife spawn point"
	spawn_groups_by_severity = alist(
		EVENT_LEVEL_MUNDANE = alist(
			list("type" = /mob/living/simple_animal/passive/rabbit,       "min" = 3, "max" = 5, "label" = "rabbits") = 10,
			list("type" = /mob/living/simple_animal/passive/rabbit/brown, "min" = 3, "max" = 5, "label" = "rabbits") = 10,
			list("type" = /mob/living/simple_animal/passive/rabbit/black, "min" = 3, "max" = 5, "label" = "rabbits") = 6,
			list("type" = /mob/living/simple_animal/frog,                 "min" = 3, "max" = 5, "label" = "frogs") = 6,
			list("type" = /mob/living/simple_animal/frog/brown,           "min" = 3, "max" = 5, "label" = "frogs") = 4,
			list("type" = /mob/living/simple_animal/frog/yellow,          "min" = 3, "max" = 5, "label" = "frogs") = 2,
			list("type" = /mob/living/simple_animal/frog/purple,          "min" = 3, "max" = 5, "label" = "frogs") = 2,
			list("type" = /mob/living/simple_animal/skittercrab,          "min" = 3, "max" = 5, "label" = "skittercrabs") = 6,
			list("type" = /mob/living/simple_animal/chorp,                "min" = 2, "max" = 3, "label" = "chorps") = 5,
			list("type" = /mob/living/simple_animal/grub_bear,            "min" = 2, "max" = 3, "label" = "grub bears") = 4
		),
		EVENT_LEVEL_MODERATE = alist(
			list("type" = /mob/living/simple_animal/passive/deer,        "min" = 2, "max" = 4, "label" = "deer") = 8,
			list("type" = /mob/living/simple_animal/passive/fox,         "min" = 2, "max" = 4, "label" = "foxes") = 5,
			list("type" = /mob/living/simple_animal/passive/fox/arctic,  "min" = 2, "max" = 4, "label" = "arctic foxes") = 1,
			list("type" = /mob/living/simple_animal/passive/fox/silver,  "min" = 2, "max" = 4, "label" = "silver foxes") = 1,
			list("type" = /mob/living/simple_animal/chorp,               "min" = 3, "max" = 5, "label" = "chorps") = 4,
			list("type" = /mob/living/simple_animal/grub_bear,           "min" = 3, "max" = 5, "label" = "grub bears") = 3
		)
	)


// Place these in/around water. Fish don't care about event severity - always a school of 3-5.
/obj/abstract/landmark/wildlife_spawn/valSal_port/fish
	name = "fish spawn point"
	spawn_groups = alist(
		list("type" = /mob/living/simple_animal/aquatic/fish,                  "min" = 3, "max" = 5, "label" = "small fry") = 10,
		list("type" = /mob/living/simple_animal/aquatic/fish/grump,            "min" = 3, "max" = 5, "label" = "small fish") = 8,
		list("type" = /mob/living/simple_animal/aquatic/fish/large,            "min" = 3, "max" = 5, "label" = "bass") = 4,
		list("type" = /mob/living/simple_animal/aquatic/fish/large/bass,       "min" = 3, "max" = 5, "label" = "largemouth bass") = 3,
		list("type" = /mob/living/simple_animal/aquatic/fish/large/trout/river,"min" = 3, "max" = 5, "label" = "rainbow trout") = 3
	)

var/global/list/wildlife_spawn_count = list() // all tracked wildlife across the whole map, oldest first (queue)

/datum/event/wildlife_spawn
	announceWhen = 1
	endWhen = 2
	var/hard_cap = 25 // population ceiling, cull_oldest() always trims back down to this after spawning
	var/spawned_wildlife = 0
	var/list/spawned_labels = list()

/datum/event/wildlife_spawn/start()
	var/list/spots = get_spawn_points()
	if(!LAZYLEN(spots))
		log_debug("Wildlife spawn event found no spawn points on this level. Aborting.")
		kill()
		return

	var/obj/abstract/landmark/wildlife_spawn/point = pick(spots)
	var/list/result = point.spawn_wildlife(severity)
	var/list/new_mobs = result["mobs"]
	if(LAZYLEN(new_mobs))
		spawned_labels |= result["label"]
		for(var/mob/living/M in new_mobs)
			track_wildlife(M)
			spawned_wildlife++
	cull_oldest()

/datum/event/wildlife_spawn/announce()
	if(!LAZYLEN(spawned_labels))
		return
	priority_stealth.Announce_quiet("A group of [english_list(spawned_labels)] has been sighted nearby.")

/datum/event/wildlife_spawn/proc/get_spawn_points()
	. = list()
	for(var/obj/abstract/landmark/wildlife_spawn/point in global.landmarks_list)
		if(point.z in affecting_z)
			. += point

/datum/event/wildlife_spawn/proc/track_wildlife(mob/living/M)
	LAZYADD(global.wildlife_spawn_count, M)
	events_repository.register(/decl/observ/death, M, src, TYPE_PROC_REF(/datum/event/wildlife_spawn, untrack_wildlife))
	events_repository.register(/decl/observ/destroyed, M, src, TYPE_PROC_REF(/datum/event/wildlife_spawn, untrack_wildlife))

// Drops the longest-standing tracked animals across the whole map until we're back at the hard cap
/datum/event/wildlife_spawn/proc/cull_oldest()
	while(LAZYLEN(global.wildlife_spawn_count) > hard_cap)
		qdel(global.wildlife_spawn_count[1])

/datum/event/wildlife_spawn/proc/untrack_wildlife(mob/living/M)
	LAZYREMOVE(global.wildlife_spawn_count, M)
	events_repository.unregister(/decl/observ/death, M, src, TYPE_PROC_REF(/datum/event/wildlife_spawn, untrack_wildlife))
	events_repository.unregister(/decl/observ/destroyed, M, src, TYPE_PROC_REF(/datum/event/wildlife_spawn, untrack_wildlife))

/datum/event/wildlife_spawn/end()
	log_debug("Wildlife spawn event spawned [spawned_wildlife] critter(s).")
