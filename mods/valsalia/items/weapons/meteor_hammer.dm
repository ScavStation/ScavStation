// Meteor hammer - a weighted head on a chain/haft. Blunt trauma only; sharp/edge and
// atom_damage_type are left at their /obj/item defaults (0, 0, BRUTE).
/obj/item/meteor_hammer
	name = "meteor hammer"
	desc = "A heavy metal weight swung on a length of chain. Crude, but it hits like a falling star."
	icon = 'mods/valsalia/icons/weapons/meteor_hammer.dmi'
	icon_state = ICON_STATE_WORLD
	item_flags = ITEM_FLAG_IS_WEAPON
	w_class = ITEM_SIZE_NORMAL
	material = /decl/material/solid/metal/steel
	material_alteration = MAT_FLAG_ALTERATION_COLOR | MAT_FLAG_ALTERATION_NAME
	attack_verb = list("bludgeoned", "smashed", "battered")
	_base_attack_force = 18
