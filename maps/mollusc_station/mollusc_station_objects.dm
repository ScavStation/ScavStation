/turf/wall/natural/random/mollusc_station
	initial_gas = null
	floor_type = /turf/floor/barren/airless

/turf/floor/barren/airless
	initial_gas = null

/turf/wall/natural/random/mollusc_station/get_weighted_mineral_list()
	if(prob(80))
		. = list()
	else if(prob(75))
		if(strata_override)
			var/decl/strata/strata_info = GET_DECL(strata_override)
			. = strata_info.ores_sparse
			. = strata_info.ores_sparse
		if(!.)
			. = SSmaterials.weighted_minerals_sparse
	else
		if(strata_override)
			var/decl/strata/strata_info = GET_DECL(strata_override)
			. = strata_info.ores_rich
		if(!.)
			. = SSmaterials.weighted_minerals_rich

//trash bins
/decl/closet_appearance/crate/mollusc_station
	decals = null
	extra_decals = null
	base_icon =  'bin.dmi'
	decal_icon = 'icons/obj/closets/decals/crate.dmi'
	color = COLOR_WHITE

/obj/structure/closet/crate/bin/mollusc_station
	name = "garbage bin"
	desc = "A large bin for putting trash in."
	icon = 'bin.dmi'
	icon_state = "base"
	closet_appearance = /decl/closet_appearance/crate/mollusc_station
	storage_types = CLOSET_STORAGE_MOBS | CLOSET_STORAGE_ITEMS

//suit cyclers
/obj/machinery/suit_cycler/mollusc_station //this one goes in eva
	req_access = list()
	suit = /obj/item/clothing/suit/space
	helmet = /obj/item/clothing/head/helmet/space

/obj/machinery/suit_cycler/engineering/mollusc_station
	suit = /obj/item/clothing/suit/space/void/engineering
	helmet = /obj/item/clothing/head/helmet/space/void/engineering
	boots = /obj/item/clothing/shoes/magboots

/obj/machinery/suit_cycler/mining/mollusc_station
	suit = /obj/item/clothing/suit/space/void/mining
	helmet = /obj/item/clothing/head/helmet/space/void/mining
	boots = /obj/item/clothing/shoes/magboots

/obj/structure/closet/medical_wall/mollusc_station/WillContain() // for common area, has slightly less than normal
	return list(
		/obj/random/firstaid,
		/obj/random/medical/lite = 8)

/obj/machinery/vending/assist/mollusc_station/Initialize() //vending machines found in maint tunnels
	. = ..()
	contraband += list(/obj/item/multitool = 1)

//cameras
/obj/machinery/camera/network/mollusc_station/sat
	preset_channels = list("Satellite")
	req_access = list(access_engine)

/obj/machinery/camera/motion/mollusc_station
	preset_channels = list("Satellite")

/obj/machinery/camera/network/command
	preset_channels = list("Command")
	initial_access = list(access_bridge)
	req_access = list(access_bridge)

/obj/machinery/camera/network/hallway
	preset_channels = list("Hallway")

/mob/living/simple_animal/crow/doctor
	desc = "She's not a real doctor, but she is a real bird."
	name = "Dr. Bird"
