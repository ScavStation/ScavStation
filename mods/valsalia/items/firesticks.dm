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
