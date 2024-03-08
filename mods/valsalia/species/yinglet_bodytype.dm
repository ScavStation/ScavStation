/decl/bodytype/yinglet
	name =                "yinglet, feminine"
	icon_base =           'mods/valsalia/icons/species/yinglet/body_female.dmi'
	husk_icon =           'mods/valsalia/icons/species/yinglet/husk.dmi'
	lip_icon =            'mods/valsalia/icons/species/yinglet/lips.dmi'
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
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_LIPS | HAS_UNDERWEAR
	base_color = "#ab8c65"
	base_hair_color = "#6e5331"
	base_eye_color = "#f5c842"
	base_markings = list(
		/decl/sprite_accessory/marking/yinglet/long_ears = "#ab8c65",
		/decl/sprite_accessory/marking/yinglet/shelltooth = "#cccccc"
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
	var/tail_hair = "female"

/decl/bodytype/yinglet/masculine
	name =      "yinglet, masculine"
	icon_base = 'mods/valsalia/icons/species/yinglet/body_male.dmi'
	tail_hair = "male"

/decl/bodytype/yinglet/hairymasculine
	name =      "yinglet, masculine with more hair"
	icon_base = 'mods/valsalia/icons/species/yinglet/body_male.dmi'
	tail_hair = "hairymale"

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
	tail = "tail_yinglet"
	tail_blend = ICON_MULTIPLY
	tail_hair = "female"
	tail_hair_blend = ICON_MULTIPLY
	tail_icon = 'mods/valsalia/icons/species/yinglet/tail.dmi'

/obj/item/organ/external/tail/yinglet/sync_colour_to_human(var/mob/living/carbon/human/human)
	. = ..()
	var/decl/bodytype/human_bodytype = human.get_bodytype()
	if(istype(human_bodytype, /decl/bodytype/yinglet))
		var/decl/bodytype/yinglet/yingbody = human_bodytype
		tail_hair = yingbody.tail_hair
	else if(istype(human_bodytype, /decl/bodytype/prosthetic/ying))
		var/decl/bodytype/prosthetic/ying/yingbody = human_bodytype
		tail_hair = yingbody.tail_hair
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