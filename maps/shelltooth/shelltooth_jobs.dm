/datum/map/shelltooth
	default_job_type = /datum/job/assistant
	allowed_jobs = list(
		/datum/job/shelltooth_captain,
		/datum/job/shelltooth_engineer/head,
		/datum/job/shelltooth_doctor,
		/datum/job/shelltooth_researcher/head,
		/datum/job/shelltooth_first_mate,
		/datum/job/cyborg,
		/datum/job/assistant,
		/datum/job/shelltooth_engineer,
		/datum/job/shelltooth_doctor/head,
		/datum/job/shelltooth_researcher,
		/datum/job/yinglet/worker,
		/datum/job/yinglet/scout,
		/datum/job/yinglet/patriarch,
		/datum/job/yinglet/matriarch
	)
	species_to_job_whitelist = list(
		/decl/species/baxxid = list(
			/datum/job/assistant
		),
		/decl/species/yinglet = list(
			/datum/job/shelltooth_captain,
			/datum/job/shelltooth_engineer/head,
			/datum/job/shelltooth_doctor,
			/datum/job/shelltooth_researcher/head,
			/datum/job/shelltooth_first_mate,
			/datum/job/cyborg,
			/datum/job/assistant,
			/datum/job/shelltooth_engineer,
			/datum/job/shelltooth_doctor/head,
			/datum/job/shelltooth_researcher,
			/datum/job/yinglet/worker,
			/datum/job/yinglet/scout,
			/datum/job/yinglet/patriarch,
			/datum/job/yinglet/matriarch
		)
	)
