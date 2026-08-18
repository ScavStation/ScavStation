/proc/cmp_departments_dsc(var/decl/department/a, var/decl/department/b)
	. = b.display_priority - a.display_priority

/decl/department
	var/name
	var/noun = "department"
	var/noun_adj = "departmental"
	var/announce_channel = "Common" // The Channel for spawn annoncement. Leave as common if unsure. The channel will be selected based of the first deparment listed in a jobs .department_types
	var/list/goals = list()
	// Goal type paths that are always instantiated, in addition to the random min_goals..max_goals drawn from goals.
	var/list/mandatory_goals = list()
	var/min_goals = 1
	var/max_goals = 2
	var/colour = "#808080"
	var/request_console_flags = 0   // use RC_ASSIST etc here to control department console behavior
	var/display_priority = 0
	var/display_color = "#ffffff"
	// If TRUE, a department's goals are shown to every mob regardless of their assigned department (helps with general enclave goals).
	var/public_goals = FALSE
	// If public_goals is TRUE and this is non-null, only mobs whose own department is in this list see the public goals (in addition to always seeing their own department's goals). If null, public goals are shown to everyone.
	var/list/public_goals_audience

/decl/department/Initialize()
	. = ..()
	if(type == /decl/department && global.using_map.default_department_type == type)
		name = "Debug Department"
	var/list/possible_goals = goals.Copy()
	goals.Cut()
	for(var/goal in mandatory_goals)
		var/datum/goal/deptgoal = new goal(src)
		if(deptgoal.is_valid())
			LAZYADD(goals, deptgoal)
		else
			qdel(deptgoal)
	var/goals_to_pick = min(LAZYLEN(possible_goals), rand(min_goals, max_goals))
	while(goals_to_pick && LAZYLEN(possible_goals))
		var/goal = pick_n_take(possible_goals)
		var/datum/goal/deptgoal = new goal(src)
		if(deptgoal.is_valid())
			LAZYADD(goals, deptgoal)
			goals_to_pick--
		else
			qdel(deptgoal)
	if (request_console_flags & RC_ASSIST)
		req_console_assistance |= name
	if (request_console_flags & RC_SUPPLY)
		req_console_supplies |= name
	if (request_console_flags & RC_INFO)
		req_console_information |= name

/decl/department/proc/summarize_goals(var/show_success = FALSE)
	. = list()
	for(var/i = 1 to LAZYLEN(goals))
		var/datum/goal/goal = goals[i]
		. += "[i]. [goal.summarize(show_success, position = i)]"

/decl/department/proc/update_progress(var/goal_type, var/progress)
	var/datum/goal/goal = locate(goal_type) in goals
	if(goal)
		goal.update_progress(progress)