/datum/computer_file/program/merchant/tradeship
	required_access = list()

/obj/machinery/computer/modular/preset/merchant/tradeship
	default_software = list(
		/datum/computer_file/program/merchant/tradeship,
		/datum/computer_file/program/email_client,
		/datum/computer_file/program/wordprocessor
	)

/datum/goal/scav_hoard_junk
	valid_areas = list(
		/area/ship/trade/aft_port_underside_maint,
		/area/ship/trade/aft_starboard_underside_maint,
		/area/ship/trade/loading_bay,
		/area/ship/trade/fore_port_underside_maint,
		/area/ship/trade/enclave
	)
