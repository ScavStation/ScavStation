/datum/map/mollusc_station
	default_job_type = /datum/job/mollusc_station/assistant
	default_department_type = /decl/department/civilian
	id_hud_icons = 'maps/mollusc_station/hud.dmi'
	allowed_jobs = list(
		/datum/job/mollusc_station/assistant,
		/datum/job/mollusc_station/bartender,
		/datum/job/mollusc_station/captain,
		/datum/job/mollusc_station/cargo,
		/datum/job/mollusc_station/robot,
		/datum/job/computer,
		/datum/job/mollusc_station/detective,
		/datum/job/mollusc_station/doctor,
		/datum/job/mollusc_station/doctor/head,
		/datum/job/mollusc_station/engineer,
		/datum/job/mollusc_station/engineer/head,
		/datum/job/mollusc_station/hop,
		/datum/job/mollusc_station/janitor,
		/datum/job/mollusc_station/scientist,
		/datum/job/mollusc_station/scientist/head,
		/datum/job/mollusc_station/security,
		/datum/job/mollusc_station/security/head,
		/datum/job/mollusc_station/librarian,
		/datum/job/mollusc_station/tradehouse/rep,
		/datum/job/mollusc_station/warden,
		/datum/job/mollusc_station/lawyer
	)

	species_to_job_whitelist = list(
		/decl/species/yinglet = list(
			/datum/job/mollusc_station/assistant,
			/datum/job/mollusc_station/bartender,
			/datum/job/mollusc_station/captain,
			/datum/job/mollusc_station/cargo,
			/datum/job/mollusc_station/robot,
			/datum/job/computer,
			/datum/job/mollusc_station/detective,
			/datum/job/mollusc_station/doctor,
			/datum/job/mollusc_station/doctor/head,
			/datum/job/mollusc_station/engineer,
			/datum/job/mollusc_station/engineer/head,
			/datum/job/mollusc_station/hop,
			/datum/job/mollusc_station/janitor,
			/datum/job/mollusc_station/scientist,
			/datum/job/mollusc_station/scientist/head,
			/datum/job/mollusc_station/security,
			/datum/job/mollusc_station/security/head,
			/datum/job/mollusc_station/librarian,
			/datum/job/mollusc_station/tradehouse/rep,
			/datum/job/mollusc_station/warden,
			/datum/job/mollusc_station/lawyer
		)
	)

	species_to_job_whitelist = list(
		/decl/species/grafadreka = list(
			/datum/job/mollusc_station/assistant,
			/datum/job/mollusc_station/lawyer,
			/datum/job/mollusc_station/librarian,
			/datum/job/mollusc_station/tradehouse/rep,
		)
	)