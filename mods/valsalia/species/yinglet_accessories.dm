/decl/sprite_accessory/marking/yinglet
	species_allowed = list(SPECIES_YINGLET)
	icon = 'mods/valsalia/icons/species/yinglet/markings.dmi'
	blend = ICON_MULTIPLY
	mask_to_bodypart = TRUE
	abstract_type = /decl/sprite_accessory/marking/yinglet
	body_parts = list(BP_HEAD)

/decl/sprite_accessory/marking/yinglet/shelltooth
	name = "Shelltooth"
	icon_state = "shelltooth"
	mask_to_bodypart = FALSE
	uid = "marking_yinglet_shelltooth"

/decl/sprite_accessory/marking/yinglet/longtooth
	name = "Long Shelltooth"
	icon_state = "longtooth"
	mask_to_bodypart = FALSE
	uid = "marking_yinglet_longtooth"

/decl/sprite_accessory/marking/yinglet/recolour_limb
	name = "Body Colour (Left Arm)"
	icon_state = "limbs"
	body_parts = list(BP_L_ARM, BP_L_HAND)
	uid = "marking_yinglet_body_l_arm"

/decl/sprite_accessory/marking/yinglet/recolour_limb/right_hand
	name = "Body Colour (Right Arm)"
	body_parts = list(BP_R_ARM, BP_R_HAND)
	uid = "marking_yinglet_body_r_arm"

/decl/sprite_accessory/marking/yinglet/recolour_limb/left_foot
	name = "Body Colour (Left Leg)"
	body_parts = list(BP_L_LEG, BP_L_FOOT)
	uid = "marking_yinglet_body_l_leg"

/decl/sprite_accessory/marking/yinglet/recolour_limb/right_foot
	name = "Body Colour (Right Leg)"
	body_parts = list(BP_R_LEG, BP_R_FOOT)
	uid = "marking_yinglet_body_r_leg"

/decl/sprite_accessory/marking/yinglet/short_ears
	name = "Ying Short Ears"
	icon_state = "shortears"
	mask_to_bodypart = FALSE
	uid = "marking_yinglet_ears_short"

/decl/sprite_accessory/marking/yinglet/long_ears
	name = "Ying Long Ears"
	icon_state = "longears"
	mask_to_bodypart = FALSE
	uid = "marking_yinglet_ears_long"

/decl/sprite_accessory/marking/yinglet/recolour_front_body
	name = "Body Colour (Front)"
	icon_state = "frontfluff"
	mask_to_bodypart = TRUE
	body_parts = list(BP_CHEST, BP_GROIN)
	uid = "marking_yinglet_body_front"

/decl/sprite_accessory/marking/yinglet/recolour_front_head
	name = "Head Colour (Front)"
	icon_state = "fronthead"
	mask_to_bodypart = TRUE
	uid = "marking_yinglet_head_front"

/decl/sprite_accessory/marking/yinglet/recolour_front_torso
	name = "Torso Colour (Front)"
	icon_state = "torsofront"
	mask_to_bodypart = TRUE
	body_parts = list(BP_CHEST, BP_GROIN)
	uid = "marking_yinglet_torso_front"

// this doesnt function do to how the tail code works
// /decl/sprite_accessory/marking/yinglet/recolour_under_tail
//	name = "Tail Underfluff Colour"
//	icon_state = "underfluff"

/decl/sprite_accessory/hair/yinglet
	name = "Ying Messy"
	icon_state = "hair_messy"
	species_allowed = list(SPECIES_YINGLET)
	icon = 'mods/valsalia/icons/species/yinglet/hair.dmi'
	blend = ICON_MULTIPLY
	uid = "hair_ying_messy"

/decl/sprite_accessory/hair/yinglet/afro
	name = "Ying Afro"
	icon_state = "hair_afro"
	uid = "hair_ying_afro"

/decl/sprite_accessory/hair/yinglet/familyman
	name = "Ying Family Man"
	icon_state = "hair_familyman"
	uid = "hair_ying_familyman"

/decl/sprite_accessory/hair/yinglet/spiky
	name = "Ying Spiky"
	icon_state = "hair_spiky"
	uid = "hair_ying_spiky"

/decl/sprite_accessory/hair/yinglet/ponytail
	name = "Ying Ponytail"
	icon_state = "hair_ponytail"
	flags = HAIR_TIEABLE
	uid = "hair_ying_ponytail"

/decl/sprite_accessory/hair/yinglet/long
	name = "Ying Long Hair"
	icon_state = "hair_long"
	flags = HAIR_TIEABLE
	uid = "hair_ying_long"

/decl/sprite_accessory/hair/yinglet/longmessy
	name = "Ying Long Messy Hair"
	icon_state = "hair_longmessy"
	flags = HAIR_TIEABLE
	uid = "hair_ying_longmessy"

/decl/sprite_accessory/hair/yinglet/updo
	name = "Ying Updo"
	icon_state = "hair_updo"
	flags = HAIR_TIEABLE
	uid = "hair_ying_updo"

/decl/sprite_accessory/hair/yinglet/bald
	name = "Ying Bald"
	icon_state = "hair_bald"
	flags = VERY_SHORT | HAIR_BALD
	uid = "hair_ying_bald"

/datum/category_item/underwear/bottom/yinglet_wraps
	name = "Yinglet Wraps"
	underwear_name = "wraps"
	icon_state = "ying_wraps"
	has_color = TRUE

/datum/category_item/underwear/top/yinglet_wraps
	name = "Yinglet Chestwrap"
	underwear_name = "chestwrap"
	icon_state = "ying_chestwrap"
	has_color = TRUE
