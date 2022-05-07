/decl/bodytype/yinglet
	name =                "yinglet, feminine"
	icon_base =           'mods/valsalia/icons/species/yinglet/body_female.dmi'
	husk_icon =           'mods/valsalia/icons/species/yinglet/husk.dmi'
	lip_icon =            'mods/valsalia/icons/species/yinglet/lips.dmi'
	limb_blend =          ICON_MULTIPLY
	bodytype_category =   BODYTYPE_YINGLET
	bodytype_flag =       BODY_FLAG_YINGLET

/decl/bodytype/yinglet/masculine
	name =      "yinglet, masculine"
	icon_base = 'mods/valsalia/icons/species/yinglet/body_male.dmi'

/datum/appearance_descriptor/age/yinglet
	chargen_min_index = 3
	chargen_max_index = 5
	standalone_value_descriptors = list(
		"a hatchling" =     1,
		"an younglet" =     3,
		"an adult" =        6,
		"middle-aged" =    15,
		"aging" =          25,
		"elderly" =        30
	)

/decl/bodytype/yinglet/Initialize()
	equip_adjust = list(
		slot_undershirt_str = list(
			"[NORTH]" = list("x" =  0, "y" = -3),
			"[EAST]" =  list("x" =  1, "y" = -3),
			"[WEST]" =  list("x" = -1, "y" = -3),
			"[SOUTH]" = list("x" =  0, "y" = -3)
		),
		slot_head_str = list(
			"[NORTH]" = list("x" =  0, "y" = -3),
			"[EAST]" =  list("x" =  3, "y" = -3),
			"[WEST]" =  list("x" = -3, "y" = -3),
			"[SOUTH]" = list("x" =  0, "y" = -3)
		),
		slot_back_str = list(
			"[NORTH]" = list("x" =  0, "y" = -5),
			"[EAST]" =  list("x" =  3, "y" = -5),
			"[WEST]" =  list("x" = -3, "y" = -5),
			"[SOUTH]" = list("x" =  0, "y" = -5)
		),
		slot_belt_str = list(
			"[NORTH]" = list("x" =  0, "y" = -1),
			"[EAST]" =  list("x" =  2, "y" = -1),
			"[WEST]" =  list("x" = -2, "y" = -1),
			"[SOUTH]" = list("x" =  0, "y" = -1)
		),
		slot_glasses_str = list(
			"[NORTH]" = list("x" =  0, "y" = -3),
			"[EAST]" =  list("x" =  2, "y" = -3),
			"[WEST]" =  list("x" = -2, "y" = -3),
			"[SOUTH]" = list("x" =  0, "y" = -3)
		),
		BP_L_HAND = list(
			"[NORTH]" = list("x" = 2,  "y" = -3),
			"[EAST]" =  list("x" = 2,  "y" = -3),
			"[WEST]" =  list("x" = -2, "y" = -3),
			"[SOUTH]" = list("x" = -2, "y" = -3)
		),
		BP_R_HAND = list(
			"[NORTH]" = list("x" = -2, "y" = -3),
			"[EAST]" =  list("x" =  2, "y" = -3),
			"[WEST]" =  list("x" = -2, "y" = -3),
			"[SOUTH]" = list("x" =  2, "y" = -3)
		),
		slot_wear_mask_str = list(
			"[NORTH]" = list("x" =  0, "y" = -3),
			"[EAST]" =  list("x" =  2, "y" = -3),
			"[WEST]" =  list("x" = -2, "y" = -3),
			"[SOUTH]" = list("x" =  0, "y" = -3)
		)
	)
	. = ..()

/obj/item/organ/external/tail/yinglet
	tail = "tail_yinglet"
	tail_blend = ICON_MULTIPLY
	tail_hair = "female"
	tail_hair_blend = ICON_MULTIPLY
	tail_icon = 'mods/valsalia/icons/species/yinglet/tail.dmi'

/obj/item/organ/external/tail/yinglet/sync_colour_to_human(var/mob/living/carbon/human/human)
	. = ..()
	if(human.bodytype.type == /decl/bodytype/yinglet/masculine)
		tail_hair = "male"
	else
		tail_hair = "female"
	human.update_tail_showing()
