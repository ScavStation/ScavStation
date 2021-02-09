/decl/department/enclave
	name = "Yinglet Enclave"
	announce_channel = "Common"
	goals = list(/datum/goal/scav_hoard_junk)

/datum/goal/scav_hoard_junk
	var/target_amount
	var/list/valid_areas = list(
		/area/ship/trade/aft_port_underside_maint,
		/area/ship/trade/aft_starboard_underside_maint,
		/area/ship/trade/loading_bay,
		/area/ship/trade/fore_port_underside_maint,
		/area/ship/trade/enclave
	)

/datum/goal/scav_hoard_junk/update_strings()
	target_amount = rand(10, 20)
	description = "End the round with at least [target_amount] item\s hoarded in junk piles on the enclave sublevel."

/datum/goal/scav_hoard_junk/check_success()
	var/total = 0
	for(var/obj/structure/junkpile/hoard in global.junk_piles)
		var/area/A = get_area(src)
		for(var/atype in valid_areas)
			if(istype(A, atype))
				total += length(hoard.contents)
				if(total >= target_amount)
					return TRUE
				continue
	return FALSE