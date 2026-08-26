// Generic marker for ambient wildlife spawn points
/obj/abstract/landmark/wildlife_spawn
	name = "wildlife spawn point"
	icon = 'icons/effects/landmarks.dmi'
	icon_state = "x"
	anchored = TRUE
	invisibility = INVISIBILITY_ABSTRACT
	// each entry: list("type" = mob typepath, "min" = X, "max" = Y, "label" = "rabbits") = weight
	var/list/spawn_groups = list()
	var/list/spawn_groups_by_severity = list() // EVENT_LEVEL_* = spawn_groups-formatted list

// severity is optional - pass it to use spawn_groups_by_severity[severity] if set, otherwise falls back to spawn_groups.
// Returns list("mobs" = list of spawned mobs, "label" = the group's label) - "mobs" is empty if nothing spawned.
/obj/abstract/landmark/wildlife_spawn/proc/spawn_wildlife(severity)
	var/list/groups = (severity && LAZYLEN(spawn_groups_by_severity)) ? spawn_groups_by_severity[severity] : spawn_groups
	if(!LAZYLEN(groups))
		return list("mobs" = list())

	var/list/group = pickweight(groups)
	var/spawn_type = LAZYLEN(group) && group["type"]
	if(!spawn_type)
		return list("mobs" = list())

	var/list/mobs = list()
	for(var/i = 1 to rand(group["min"], group["max"]))
		mobs += new spawn_type(loc)

	return list("mobs" = mobs, "label" = group["label"])
