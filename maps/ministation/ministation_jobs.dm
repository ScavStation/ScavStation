/datum/map/ministation
	default_assistant_title = "Assistant"
	allowed_jobs = list(
		/datum/job/assistant,
		/datum/job/ministation/bartender,
		/datum/job/ministation/captain,
		/datum/job/ministation/cargo,
		/datum/job/cyborg,
		/datum/job/ministation/detective,
		/datum/job/ministation/doctor,
		/datum/job/ministation/engineer,
		/datum/job/ministation/hop,
		/datum/job/ministation/janitor,
		/datum/job/ministation/scientist,
		/datum/job/ministation/security,
		/datum/job/yinglet/yinglet_rep,
		/datum/job/ministation/librarian
	)
	species_to_job_whitelist = list(
		/decl/species/baxxid = list(
			/datum/job/assistant
		),
		/decl/species/yinglet = list(
			/datum/job/assistant,
			/datum/job/ministation/bartender,
			/datum/job/ministation/cargo,
			/datum/job/cyborg,
			/datum/job/ministation/detective,
			/datum/job/ministation/doctor,
			/datum/job/ministation/engineer,
			/datum/job/ministation/janitor,
			/datum/job/ministation/scientist,
			/datum/job/ministation/security,
			/datum/job/yinglet/yinglet_rep,
			/datum/job/ministation/librarian
		)
	)