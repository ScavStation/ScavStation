// Plasma spear

#define PLASMA_SPEAR_FULL_FORCE 30

/obj/item/bladed/polearm/spear/plasma
	abstract_type       = /obj/item/bladed/polearm/spear/plasma
	icon_state          = ICON_STATE_WORLD
	material            = /decl/material/solid/metal/plasteel
	material_alteration = MAT_FLAG_ALTERATION_NONE
	hilt_material       = null
	guard_material      = null
	pommel_material     = null
	atom_damage_type    = BURN

/obj/item/bladed/polearm/spear/plasma/plasma_spear
	name               = "plasma spear"
	desc               = "A precursor relic: a long haft tipped with a blade of contained, superheated plasma. Far beyond anything forged in Val Salia."
	icon               = 'mods/valsalia/icons/weapons/plasma_spear.dmi'
	_base_attack_force = PLASMA_SPEAR_FULL_FORCE

/obj/item/bladed/polearm/spear/plasma/holdout_spear
	name               = "holdout spear"
	desc               = "A compact precursor spear, short enough to tuck away out of sight. The plasma edge is throttled down to keep it pocket-safe, at the cost of real bite."
	icon               = 'mods/valsalia/icons/weapons/plasma_spear_short.dmi'
	w_class            = ITEM_SIZE_SMALL
	_base_attack_force = PLASMA_SPEAR_FULL_FORCE / 3
	// Fall back to the full-size spear's sheet for anyone else, rather than rendering with nothing in hand at all.
	// Drop this once a humanoid short-spear hand sprite exists.
	sprite_sheets = list(BODYTYPE_HUMANOID = 'mods/valsalia/icons/weapons/plasma_spear.dmi')

/obj/item/bladed/polearm/spear/plasma/ironpath_spear
	name               = "ironpath spear"
	desc               = "A compact precursor spear that hides a full-strength plasma edge behind its stubby frame - whoever built it clearly didn't believe in compromises."
	icon               = 'mods/valsalia/icons/weapons/plasma_spear.dmi'
	w_class            = ITEM_SIZE_SMALL
	_base_attack_force = PLASMA_SPEAR_FULL_FORCE

#undef PLASMA_SPEAR_FULL_FORCE
