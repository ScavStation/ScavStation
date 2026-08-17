/decl/department/enclavecommand
	goals = list(/datum/goal/department/paperwork/valSal_port)

var/global/list/valSal_port_paperwork_spawn_turfs = list()
var/global/list/valSal_port_paperwork_end_areas = list()

/obj/abstract/landmark/paperwork_spawn_valSal_port
	name = "Breeding Schedule Goal Spawn Point"

/obj/abstract/landmark/paperwork_spawn_valSal_port/Initialize()
	..()
	var/turf/T = get_turf(src)
	if(istype(T))
		global.valSal_port_paperwork_spawn_turfs |= T
	return INITIALIZE_HINT_QDEL

/obj/abstract/landmark/paperwork_finish_valSal_port
	name = "Val-Sal Port Paperwork Goal Finish Point"

/obj/abstract/landmark/paperwork_finish_valSal_port/Initialize()
	..()
	var/turf/T = get_turf(src)
	if(istype(T))
		var/area/A = get_area(T)
		if(istype(A))
			global.valSal_port_paperwork_end_areas |= A
	return INITIALIZE_HINT_QDEL

/datum/goal/department/paperwork/valSal_port
	paperwork_types = list(/obj/item/paperwork/valSal_port)
	signatory_job_list = list(
		/datum/job/valSal_port/enclavecommand/matriarch,
		/datum/job/valSal_port/enclavecommand/farmpatriarch,
		/datum/job/valSal_port/enclavecommand/huntpatriarch,
		/datum/job/valSal_port/enclavecommand/healpatriarch,
		/datum/job/valSal_port/enclavecommand/craftpatriarch,
		/datum/job/valSal_port/enclave/daughter
	)

/datum/goal/department/paperwork/valSal_port/get_paper_spawn_turfs()
	return global.valSal_port_paperwork_spawn_turfs

/datum/goal/department/paperwork/valSal_port/get_paper_end_areas()
	return global.valSal_port_paperwork_end_areas

/obj/item/paperwork/valSal_port
	name = "\improper Enclave breeding schedule"
	desc = "A list of pairings between the females of the enclave and the males. This is a very important document that is responsible for the next generation, so don't lose it!"