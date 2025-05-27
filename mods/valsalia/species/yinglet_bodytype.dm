/decl/bodytype/yinglet
	name =                "yinglet, feminine"
	uid =                 "bodytype_yinglet_fem"
	icon_base =           'mods/valsalia/icons/species/yinglet/body_female.dmi'
	husk_icon =           'mods/valsalia/icons/species/yinglet/husk.dmi'
	cosmetics_icon =      'mods/valsalia/icons/species/yinglet/cosmetics.dmi'
	limb_blend =          ICON_MULTIPLY
	bodytype_category =   BODYTYPE_YINGLET
	bodytype_flag =       BODY_FLAG_YINGLET
	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach/yinglet,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver/yinglet,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys/yinglet,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes/yinglet
	)
	movement_slowdown = -0.5
	mob_size = MOB_SIZE_SMALL
	eye_blend = ICON_MULTIPLY
	eye_icon = 'mods/valsalia/icons/species/yinglet/eyes.dmi'
	appearance_flags = HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_UNDERWEAR
	base_color = "#ab8c65"
	base_eye_color = "#f5c842"
	default_sprite_accessories = list(
		SAC_HAIR = list(
			/decl/sprite_accessory/hair/yinglet               = list(SAM_COLOR = "#6e5331")
		),
		SAC_MARKINGS = list(
			/decl/sprite_accessory/marking/yinglet/long_ears  = list(SAM_COLOR = "#ab8c65"),
			/decl/sprite_accessory/marking/yinglet/shelltooth = list(SAM_COLOR = "#cccccc")
		)
	)
	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/yinglet),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/yinglet),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/yinglet),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/yinglet),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/yinglet),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/yinglet),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/yinglet),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/yinglet),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/yinglet),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/yinglet),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/yinglet),
		BP_TAIL =   list("path" = /obj/item/organ/external/tail/yinglet)
	)
	nail_noun = "claws"
	age_descriptor = /datum/appearance_descriptor/age/yinglet
	appearance_descriptors = list(
		/datum/appearance_descriptor/height = 0.5,
		/datum/appearance_descriptor/build =  0.5
	)

#ifdef MODPACK_SCALING_MODIFIERS
	scaling_adjustments_x = list(
		-0.07,
		-0.05,
		0,
		0.054,
		0.095
	)
#endif

/decl/bodytype/yinglet/masculine
	name =      "yinglet, masculine"
	icon_base = 'mods/valsalia/icons/species/yinglet/body_male.dmi'
	uid =       "bodytype_yinglet_masc"

/decl/bodytype/yinglet/hairymasculine
	name =      "yinglet, masculine with more hair"
	icon_base = 'mods/valsalia/icons/species/yinglet/body_male.dmi'
	uid =       "bodytype_yinglet_masc_hairy"

/datum/appearance_descriptor/age/yinglet
	chargen_min_index = 3
	chargen_max_index = 5
	standalone_value_descriptors = list(
		"a hatchling" =     1,
		"a juvenile" =     2,
		"an adult" =        3,
		"middle-aged" =    13,
		"aging" =          25,
		"elderly" =        30
	)

/decl/bodytype/yinglet/Initialize()
	equip_adjust = list(
		slot_undershirt_str = list(
			"[NORTH]" = list( 0, -3),
			"[EAST]" =  list( 1, -3),
			"[WEST]" =  list(-1, -3),
			"[SOUTH]" = list( 0, -3)
		),
		slot_head_str = list(
			"[NORTH]" = list( 0, -3),
			"[EAST]" =  list( 3, -3),
			"[WEST]" =  list(-3, -3),
			"[SOUTH]" = list( 0, -3)
		),
		slot_back_str = list(
			"[NORTH]" = list( 0, -5),
			"[EAST]" =  list( 3, -5),
			"[WEST]" =  list(-3, -5),
			"[SOUTH]" = list( 0, -5)
		),
		slot_belt_str = list(
			"[NORTH]" = list( 0, -1),
			"[EAST]" =  list( 2, -1),
			"[WEST]" =  list(-2, -1),
			"[SOUTH]" = list( 0, -1)
		),
		slot_glasses_str = list(
			"[NORTH]" = list( 0, -3),
			"[EAST]" =  list( 2, -3),
			"[WEST]" =  list(-2, -3),
			"[SOUTH]" = list( 0, -3)
		),
		BP_L_HAND = list(
			"[NORTH]" = list( 2, -3),
			"[EAST]" =  list( 2, -3),
			"[WEST]" =  list(-2, -3),
			"[SOUTH]" = list(-2, -3)
		),
		BP_R_HAND = list(
			"[NORTH]" = list(-2, -3),
			"[EAST]" =  list( 2, -3),
			"[WEST]" =  list(-2, -3),
			"[SOUTH]" = list( 2, -3)
		),
		slot_wear_mask_str = list(
			"[NORTH]" = list( 0, -3),
			"[EAST]" =  list( 2, -3),
			"[WEST]" =  list(-2, -3),
			"[SOUTH]" = list( 0, -3)
		)
	)
	. = ..()

/obj/item/organ/external/tail/yinglet
	tail_state = "tail_yinglet"
	tail_blend = ICON_MULTIPLY
	tail_hair = "female"
	tail_hair_blend = ICON_MULTIPLY
	tail_icon = 'mods/valsalia/icons/species/yinglet/tail.dmi'

/obj/item/organ/external/tail/yinglet/sync_colour_to_human(var/mob/living/human/human)
	. = ..()
	var/decl/bodytype/human_bodytype = human.get_bodytype()?.type
	if(human_bodytype == /decl/bodytype/yinglet/masculine || human_bodytype == /decl/bodytype/prosthetic/ying/metal/fbp/masculine)
		tail_hair = "male"
	else if(human_bodytype == /decl/bodytype/yinglet || human_bodytype == /decl/bodytype/prosthetic/ying/metal/fbp)
		tail_hair = "female"
	else
		tail_hair = "hairymale"

/obj/item/organ/external/tail/get_grooming_results(obj/item/grooming/tool)
	if(tool?.grooming_flags & (GROOMABLE_COMB|GROOMABLE_BRUSH))
		if(tail_hair == "female")
			return list(
				"success"    = GROOMING_RESULT_SUCCESS,
				"descriptor" = "tailpoof"
			)
		if(tail_hair == "hairymale")
			return list(
				"success"    = GROOMING_RESULT_PARTIAL,
				"descriptor" = "tail's ridge fur"
			)
	return ..()

/obj/item/organ/external/tail/yinglet/robot
	tail_icon = 'mods/valsalia/icons/species/yinglet/tail_robot.dmi'