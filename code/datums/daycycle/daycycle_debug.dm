/datum/admins/proc/force_daycycle_period()
	set name = "Force Daycycle Period"
	set desc = "Jump a daycycle straight to a given period - affects every z-level registered to it, not just the one you're standing on. Your current turf just picks which daycycle to target."
	set category = "Debug"

	if(!check_rights(R_DEBUG))
		return

	var/turf/T = get_turf(usr)
	if(!istype(T))
		to_chat(usr, SPAN_WARNING("You need to have a turf to use this verb."))
		return

	var/datum/level_data/level = SSmapping.levels_by_z[T.z]
	if(!level?.daycycle_id)
		to_chat(usr, SPAN_WARNING("This z-level has no daycycle_id set."))
		return

	var/datum/daycycle/cycle = SSdaycycle.get_daycycle(level.daycycle_id)
	if(!istype(cycle))
		to_chat(usr, SPAN_WARNING("No daycycle is currently registered for '[level.daycycle_id]' - it may be disabled server-wide."))
		return

	var/datum/daycycle_period/chosen = input(usr, "Which period do you wish to force?", "Target Period") as null|anything in cycle.cycle_periods
	if(!chosen || cycle != SSdaycycle.get_daycycle(level.daycycle_id))
		return

	// Land time_in_cycle in the middle of the chosen period's range so it doesn't sit right on a
	// boundary and immediately roll into the next period on the following tick.
	var/index = cycle.cycle_periods.Find(chosen)
	var/datum/daycycle_period/previous = (index > 1) ? cycle.cycle_periods[index - 1] : null
	var/lower_bound = previous ? previous.period : 0
	cycle.time_in_cycle = cycle.cycle_duration * ((lower_bound + chosen.period) / 2)
	cycle.last_update = world.time
	cycle.tick()

	to_chat(usr, SPAN_NOTICE("Forced '[level.daycycle_id]' to [chosen.name || chosen.type] (affects all [length(cycle.levels_affected)] linked z-level(s))."))
