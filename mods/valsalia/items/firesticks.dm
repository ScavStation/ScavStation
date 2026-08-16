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

/obj/item/gun/projectile/pistol/holdout/service
	name = "service pistol"
	desc = "An Ivenco licensed copy of the P3 Whisper. Commonly used by tradehouse agents. This one is a little worn."

/*
/obj/item/gun/projectile/pistol/holdout/can_have_silencer()
	return TRUE
*/

/obj/item/gun/energy/gun/reloadable/vayryn
	name = "\proper Sword of Light"
	desc = "It appears to be a modified LAEP90 Perun, a versatile energy based sidearm, capable of switching between low, medium and high power projectile settings. In other words: stun, shock or kill. The name \"Sword of Light\" has been etched into the plate where a serial number should be. <span class='danger'>It gives you a weird vibe.</span>"
	self_recharge = 1 // Recharges itself slowly, not fast enough to sustain fire on a blob or anything.
	// Every [recharge_time] (default 4) calls to Process(), it returns one shot worth (20 power) to the cell (Weapon energy cell holds 500 energy, or 25 shots)
	// Testing results in it taking roughly 100 seconds to recharge all 25 shots, so roughly four seconds between shots.
	// Sustained fire from a full charge allows roughly 34 shots before running dry.
	// Setting charge_cost to 0 would make it infinitely firing.
