SUBSYSTEM_DEF(departments)
	name = "Deparments"
	init_order = SS_INIT_DEPARTMENTS
	flags = SS_NO_FIRE
	var/list/departments = list()

/datum/controller/subsystem/departments/Initialize()
	var/list/all_depts = subtypesof(/datum/department)
	for(var/dtype in all_depts)
		var/datum/department/dept = dtype
		var/dept_name = initial(dept.refrence)
		if(dept_name)
			departments["[dept_name]"] = new dtype
	for(var/thing in departments)
		var/datum/department/dept = departments[thing]
		dept.Initialize()
	. = ..()