/turf/simulated/mineral/random/ministation/Initialize()
	.=..()
	var/chosen_rock = pick(80; /turf/simulated/mineral, 15; /turf/simulated/mineral/random, 05; /turf/simulated/mineral/random/high_chance)
	src.ChangeTurf(chosen_rock)

//trash bins
/decl/closet_appearance/crate/ministation
	decals = null
	extra_decals = null
	base_icon =  'bin.dmi'
	decal_icon = 'icons/obj/closets/decals/crate.dmi'
	color = COLOR_WHITE

/obj/structure/closet/crate/bin/ministation
	name = "garbage bin"
	desc = "A large bin for putting trash in."
	icon = 'bin.dmi'
	icon_state = "base"
	closet_appearance = /decl/closet_appearance/crate/ministation
	storage_types = CLOSET_STORAGE_MOBS

//suit cyclers
/obj/machinery/suit_cycler/ministation
	req_access = list()
	suit = /obj/item/clothing/suit/space/emergency
	helmet = /obj/item/clothing/head/helmet/space/emergency

/obj/machinery/suit_cycler/engineering/ministation
	suit = /obj/item/clothing/suit/space/void/engineering
	helmet = /obj/item/clothing/head/helmet/space/void/engineering
	boots = /obj/item/clothing/shoes/magboots

/obj/machinery/suit_cycler/mining/ministation
	suit = /obj/item/clothing/suit/space/void/mining
	helmet = /obj/item/clothing/head/helmet/space/void/mining
	boots = /obj/item/clothing/shoes/magboots