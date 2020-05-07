/datum/map/shelltooth
	default_assistant_title = "Deck Hand"
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
		/datum/species/baxxid = list(
			/datum/job/assistant
		),
		/datum/species/yinglet = list(
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
		),
		/datum/species/yinglet/southern = list(
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
