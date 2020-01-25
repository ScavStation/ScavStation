/datum/unit_test/station_wires_shall_be_connected
	exceptions = list(list(48, 54, 3, EAST))

/datum/map/tradeship
	// Unit test exemptions

	apc_test_exempt_areas = list(
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/turbolift = NO_SCRUBBER|NO_VENT|NO_APC
	)
