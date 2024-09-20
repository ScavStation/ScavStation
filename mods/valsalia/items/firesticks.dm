/obj/item/gun/projectile/automatic/yassault_rifle
	name = "Yinglet assault rifle"
	desc = "The ST-4 is a bulpup rifle designed off the Z8 Bulldog but scaled down for use by yinglets. You fear your knuckles may get burned using this."
	icon = 'mods/valsalia/icons/weapons/yar.dmi'
	w_class = ITEM_SIZE_NORMAL
	force = 10
	caliber = CALIBER_RIFLE
	origin_tech = "{'combat':8,'materials':3}"
	fire_sound = 'sound/weapons/gunshot/rifshot.ogg'
	ammo_type = /obj/item/ammo_casing/rifle
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/rifle
	allowed_magazines = /obj/item/ammo_magazine/rifle
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	accuracy = 2
	accuracy_power = 7
	one_hand_penalty = 8
	bulk = 2
	burst_delay = 1
	mag_insert_sound = 'sound/weapons/guns/interaction/batrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/batrifle_magout.ogg'
	material = /decl/material/solid/metal/steel
	matter = list(
		/decl/material/solid/metal/silver = MATTER_AMOUNT_REINFORCEMENT,
		/decl/material/solid/gemstone/diamond = MATTER_AMOUNT_TRACE
	)
	firemodes = list(
		list(mode_name="semi auto",      burst=1,    fire_delay=null, use_launcher=null, one_hand_penalty=8,  burst_accuracy=null,            dispersion=null),
		list(mode_name="3-round bursts", burst=3,    fire_delay=null, use_launcher=null, one_hand_penalty=9,  burst_accuracy=list(0,0,-1),   dispersion=list(0.0, 0.4, 0.8)),
		list(mode_name="full auto",      burst=1,    fire_delay=0,    burst_delay=1,     use_launcher=null,   one_hand_penalty=7,             burst_accuracy = list(0,0,-1), dispersion=list(0.0, 0.4, 0.8), autofire_enabled=1)
	)

	var/use_launcher = 0
	var/obj/item/gun/launcher/grenade/underslung/launcher

/obj/item/gun/projectile/automatic/yassault_rifle/Initialize()
	. = ..()
	launcher = new(src)

/obj/item/gun/projectile/automatic/yassault_rifle/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/gun/projectile/automatic/yassault_rifle/attack_hand(mob/user)
	if(user.is_holding_offhand(src) && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/gun/projectile/automatic/yassault_rifle/Fire(atom/target, atom/movable/firer, clickparams, pointblank = FALSE, reflex = FALSE, set_click_cooldown = TRUE, target_zone = BP_CHEST)
	if(use_launcher)
		launcher.Fire(target, firer, clickparams, pointblank, reflex, set_click_cooldown, target_zone)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/automatic/yassault_rifle/update_base_icon_state()
	if(ammo_magazine)
		if(ammo_magazine.stored_ammo.len)
			icon_state = "[get_world_inventory_state()]-loaded"
		else
			icon_state = "[get_world_inventory_state()]-empty"
	else
		icon_state = get_world_inventory_state()



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
