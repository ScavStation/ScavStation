/obj/item/gun/projectile/automatic/assault_rifle/yinglet
	name = "yinglet assault rifle"
	desc = "The ST-4 is a bulpup rifle designed off the Z8 Bulldog but scaled down for use by yinglets. You fear your knuckles may get burned using this."
	icon = 'mods/valsalia/icons/weapons/yar.dmi'
	w_class = ITEM_SIZE_NORMAL
	bulk = 2

/datum/fabricator_recipe/protolathe/weapon/yar
	path = /obj/item/gun/projectile/automatic/assault_rifle/yinglet
//obj/item/gun/projectile/shotgun/quadbarrel
//	name = "quad-barreled shotgun"
//	desc = "A true classic but doubled."
//	icon = 'icons/obj/guns/shotgun/doublebarrel.dmi'
//	//SPEEDLOADER because rapid unloading.
//	//In principle someone could make a speedloader for it, so it makes sense.
//	load_method = SINGLE_CASING|SPEEDLOADER
//	handle_casings = CYCLE_CASINGS
//	max_shells = 4
//	w_class = ITEM_SIZE_HUGE
//	force = 10
//	obj_flags =  OBJ_FLAG_CONDUCTIBLE
//	slot_flags = SLOT_BACK
//	caliber = CALIBER_SHOTGUN
//	origin_tech = @'{"combat":6,"materials,"esoteric":9}'
//	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
//	one_hand_penalty = 4
//
//	burst_delay = 0
//	firemodes = list(
//		list(mode_name="fire one barrel at a time", burst=1),
//		list(mode_name="fire two barrels at once", burst=2),
//		list(mode_name="fire all barrels at once", burst=4)
//		)

//obj/item/gun/projectile/shotgun/quadbarrel/unload_ammo(user, allow_dump)
//	return ..(user, allow_dump=1)
