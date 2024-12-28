/datum/computer_file/program/merchant/ministation
	read_access = list()

/obj/machinery/computer/modular/preset/merchant/ministation
	default_software = list(
		/datum/computer_file/program/merchant/ministation,
		/datum/computer_file/program/email_client,
		/datum/computer_file/program/wordprocessor,
		/datum/computer_file/program/supply
	)

// This has to be here rather than ministation_define.dm because it's from a modpack.
/datum/map/ministation
	default_law_type = /datum/ai_laws/nanotrasen