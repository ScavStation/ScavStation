/datum/map/ministation2
	default_job_type = /datum/job/ministation/assistant
	default_department_type = /decl/department/civilian
	id_hud_icons = 'maps/ministation2/hud.dmi'
	allowed_jobs = list(
		/datum/job/ministation/assistant,
		/datum/job/ministation/bartender,
		/datum/job/ministation/captain,
		/datum/job/ministation/cargo,
		/datum/job/ministation/robot,
		/datum/job/computer,
		/datum/job/ministation/detective,
		/datum/job/ministation/doctor,
		/datum/job/ministation/doctor/head,
		/datum/job/ministation/engineer,
		/datum/job/ministation/engineer/head,
		/datum/job/ministation/hop,
		/datum/job/ministation/janitor,
		/datum/job/ministation/scientist,
		/datum/job/ministation/scientist/head,
		/datum/job/ministation/security,
		/datum/job/ministation/security/head,
		/datum/job/ministation/librarian,
		/datum/job/ministation/tradehouse/rep
	)
	species_to_job_whitelist = list(
		/decl/species/baxxid = list(
			/datum/job/ministation/tradehouse/rep,
			/datum/job/ministation/cargo,
			/datum/job/computer,
			/datum/job/ministation/bartender,
			/datum/job/ministation/assistant,
			/datum/job/ministation/doctor,
			/datum/job/ministation/doctor/head,
			/datum/job/ministation/engineer,
			/datum/job/ministation/engineer/head,
			/datum/job/ministation/scientist,
			/datum/job/ministation/scientist/head,
			/datum/job/ministation/librarian,
			/datum/job/ministation/detective,
			/datum/job/ministation/janitor,
			/datum/job/ministation/robot
		),
		/decl/species/yinglet = list(
			/datum/job/ministation/assistant,
			/datum/job/ministation/bartender,
			/datum/job/ministation/captain,
			/datum/job/ministation/cargo,
			/datum/job/ministation/robot,
			/datum/job/computer,
			/datum/job/ministation/detective,
			/datum/job/ministation/doctor,
			/datum/job/ministation/doctor/head,
			/datum/job/ministation/engineer,
			/datum/job/ministation/engineer/head,
			/datum/job/ministation/hop,
			/datum/job/ministation/janitor,
			/datum/job/ministation/scientist,
			/datum/job/ministation/scientist/head,
			/datum/job/ministation/security,
			/datum/job/ministation/security/head,
			/datum/job/ministation/librarian
		),
		/decl/species/indrel = list(
			/datum/job/ministation/assistant,
			/datum/job/ministation/cargo,
			/datum/job/ministation/engineer
		),
		/decl/species/vox = list(
			/datum/job/ministation/assistant,
			/datum/job/ministation/bartender,
			/datum/job/ministation/cargo,
			/datum/job/ministation/janitor,
			/datum/job/ministation/scientist,
			/datum/job/ministation/scientist/head,
			/datum/job/ministation/engineer,
			/datum/job/ministation/engineer/head,
			/datum/job/ministation/detective,
			/datum/job/ministation/doctor,
			/datum/job/ministation/doctor/head
		),
		/decl/species/neoavian = list(
			/datum/job/ministation/assistant,
			/datum/job/ministation/bartender,
			/datum/job/ministation/cargo,
			/datum/job/ministation/janitor,
			/datum/job/ministation/scientist,
			/datum/job/ministation/scientist/head,
			/datum/job/ministation/engineer,
			/datum/job/ministation/engineer/head,
			/datum/job/ministation/detective,
			/datum/job/ministation/doctor,
			/datum/job/ministation/doctor/head
		),
		/decl/species/serpentid = list(
			/datum/job/ministation/assistant,
			/datum/job/ministation/bartender,
			/datum/job/ministation/cargo,
			/datum/job/ministation/janitor,
			/datum/job/ministation/scientist,
			/datum/job/ministation/scientist/head,
			/datum/job/ministation/engineer,
			/datum/job/ministation/engineer/head,
			/datum/job/ministation/detective,
			/datum/job/ministation/doctor,
			/datum/job/ministation/doctor/head
			),
		/decl/species/adherent = list(
			/datum/job/ministation/assistant,
			/datum/job/ministation/bartender,
			/datum/job/ministation/cargo,
			/datum/job/ministation/janitor,
			/datum/job/ministation/scientist,
			/datum/job/ministation/scientist/head,
			/datum/job/ministation/engineer,
			/datum/job/ministation/engineer/head,
			/datum/job/ministation/detective,
			/datum/job/ministation/doctor,
			/datum/job/ministation/doctor/head
			)

	)
	species_to_job_blacklist = list(
		/decl/species/human = list(
			/datum/job/ministation/captain,
			/datum/job/ministation/robot,
			/datum/job/ministation/detective,
			/datum/job/ministation/doctor,
			/datum/job/ministation/doctor/head,
			/datum/job/ministation/engineer,
			/datum/job/ministation/engineer/head,
			/datum/job/ministation/hop,
			/datum/job/ministation/scientist,
			/datum/job/ministation/scientist/head,
			/datum/job/ministation/security,
			/datum/job/ministation/security/head,
			/datum/job/ministation/librarian
		)
	)