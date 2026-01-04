/obj/item/gun/projectile/automatic/assault_rifle/yinglet
	name = "small assault rifle"
	desc = "The ST-4 is a bulpup rifle designed off the Z8 Bulldog but scaled down for use by smaller combatants. You fear your knuckles may get burned using this."
	icon = 'mods/valsalia/icons/weapons/yar.dmi'
	w_class = ITEM_SIZE_NORMAL
	bulk = 2
	minimum_size_to_twohand = MOB_SIZE_SMALL

/obj/item/gun/projectile/automatic/assault_rifle/grenade/yinglet
	name = "small assault rifle"
	desc = "The ST-4 is a bulpup rifle designed off the Z8 Bulldog but scaled down for use by smaller combatants. This one has an underslung grenade launcher. Makes you feel like a tiny space marine when you hold it."
	icon = 'mods/valsalia/icons/weapons/yar_grenade.dmi'
	w_class = ITEM_SIZE_NORMAL
	bulk = 2
	minimum_size_to_twohand = MOB_SIZE_SMALL

/datum/fabricator_recipe/protolathe/weapon/yar
	path = /obj/item/gun/projectile/automatic/assault_rifle/yinglet

/datum/fabricator_recipe/protolathe/weapon/yar_grenade
	path = /obj/item/gun/projectile/automatic/assault_rifle/grenade/yinglet


/obj/item/gun/projectile/pistol/giggle
	name = "Shiri"
	desc = "An almost entirely custom made handgun with a selector switch. designed to be used with the new bluespace magazines."
	icon = 'icons/obj/guns/pistol.dmi'
	load_method = MAGAZINE
	caliber = CALIBER_PISTOL
	origin_tech = @'{"combat":5, "esoteric":8}'
	magazine_type = /obj/item/ammo_magazine/pistol
	allowed_magazines = /obj/item/ammo_magazine/pistol
	accuracy_power = 7
	safety_icon = "safety"
	ammo_indicator = TRUE
	w_class = ITEM_SIZE_SMALL

	firemodes = list(
		list(mode_name="semi auto",      burst=1, fire_delay=null, one_hand_penalty=3, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, one_hand_penalty=4, burst_accuracy=list(0,-0.1,-0.5),       dispersion=list(0, 0.5, 1.1, 1.5)),
		list(mode_name="full auto",      burst=1, fire_delay=0,    burst_delay=1,      one_hand_penalty=5,                 burst_accuracy=list(0,-0.1,-0.5,-0.8,-1), dispersion=list(0, 0.5, 1.1, 1.5, 2.1), autofire_enabled=1)
	)



/obj/item/gun/projectile/pistol/high_capacity
	magazine_type = /obj/item/ammo_magazine/pistol/high_capacity

/obj/item/ammo_magazine/pistol/high_capacity
	name = "pistol magazine of holding"
	icon_state = "pistol"
	origin_tech = @'{"combat":2, "wormholes":5}'
	mag_type = MAGAZINE
	caliber = CALIBER_PISTOL
	material = /decl/material/solid/metal/steel
	ammo_type = /obj/item/ammo_casing/pistol
	max_ammo = 60
	multiple_sprites = 1