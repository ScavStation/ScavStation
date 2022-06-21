/decl/sprite_accessory/marking/yinglet
	name = "Shelltooth"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_YINGLET)
	icon = 'mods/valsalia/icons/species/yinglet/markings.dmi'
	icon_state = "shelltooth"
	blend = ICON_MULTIPLY

/decl/sprite_accessory/marking/yinglet/longtooth
	name = "Long Shelltooth"
	icon_state = "longtooth"

/decl/sprite_accessory/marking/yinglet/recolour_left_hand
	name = "Body Colour (Left Arm)"
	icon_state = "lh"
	body_parts = list(BP_L_HAND)

/decl/sprite_accessory/marking/yinglet/recolour_right_hand
	name = "Body Colour (Right Arm)"
	icon_state = "rh"
	body_parts = list(BP_R_HAND)

/decl/sprite_accessory/marking/yinglet/recolour_left_foot
	name = "Body Colour (Left Leg)"
	icon_state = "lf"
	body_parts = list(BP_L_FOOT)

/decl/sprite_accessory/marking/yinglet/recolour_right_foot
	name = "Body Colour (Right Leg)"
	icon_state = "rf"
	body_parts = list(BP_R_FOOT)

/decl/sprite_accessory/marking/yinglet/short_ears
	name = "Ying Short Ears"
	icon_state = "shortears"

/decl/sprite_accessory/marking/yinglet/long_ears
	name = "Ying Long Ears"
	icon_state = "longears"

/decl/sprite_accessory/hair/yinglet
	name = "Ying Messy"
	icon_state = "hair_messy"
	species_allowed = list(SPECIES_YINGLET)
	icon = 'mods/valsalia/icons/species/yinglet/hair.dmi'
	blend = ICON_MULTIPLY

/decl/sprite_accessory/hair/yinglet/afro
	name = "Ying Afro"
	icon_state = "hair_afro"

/decl/sprite_accessory/hair/yinglet/familyman
	name = "Ying Family Man"
	icon_state = "hair_familyman"

/decl/sprite_accessory/hair/yinglet/spiky
	name = "Ying Spiky"
	icon_state = "hair_spiky"

/decl/sprite_accessory/hair/yinglet/ponytail
	name = "Ying Ponytail"
	icon_state = "hair_ponytail"
	flags = HAIR_TIEABLE

/decl/sprite_accessory/hair/yinglet/long
	name = "Ying Long Hair"
	icon_state = "hair_long"
	flags = HAIR_TIEABLE

/decl/sprite_accessory/hair/yinglet/longmessy
	name = "Ying Long Messy Hair"
	icon_state = "hair_longmessy"
	flags = HAIR_TIEABLE

/decl/sprite_accessory/hair/yinglet/updo
	name = "Ying Updo"
	icon_state = "hair_updo"
	flags = HAIR_TIEABLE

/decl/sprite_accessory/hair/yinglet/bald
	name = "Ying Bald"
	icon_state = "hair_bald"
	flags = VERY_SHORT | HAIR_BALD

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
