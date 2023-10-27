/decl/bodytype/prosthetic/ying
	bodytype_flag     = BODY_FLAG_YINGLET
	bodytype_category = BODYTYPE_YINGLET
	mob_size          = MOB_SIZE_SMALL
	abstract_type     = /decl/bodytype/prosthetic/ying
	movement_slowdown = -0.5
	limb_blend        = ICON_MULTIPLY
	eye_blend         = ICON_MULTIPLY
	eye_icon          = 'mods/valsalia/icons/species/yinglet/eyes.dmi'
	lip_icon          = 'mods/valsalia/icons/species/yinglet/lips.dmi'
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
		BP_TAIL =   list("path" = /obj/item/organ/external/tail/yinglet/robot)
	)
	base_markings = list(
		/decl/sprite_accessory/marking/yinglet/long_ears  = COLOR_GUNMETAL,
		/decl/sprite_accessory/marking/yinglet/shelltooth = COLOR_GUNMETAL
	)

/decl/bodytype/prosthetic/ying/wooden
	name = "scavenged"
	desc = "A stick, tied to the owner's body with rags. Very scav chic."
	icon_base = 'mods/valsalia/icons/wooden_main.dmi'
	modifier_string = "wooden"
	hardiness = 0.75
	manual_dexterity = DEXTERITY_SIMPLE_MACHINES
	movement_slowdown = 2
	is_robotic = FALSE
	eye_icon = 'mods/valsalia/icons/species/yinglet/eyes.dmi'

/decl/bodytype/prosthetic/ying/metal
	name = "Lunar Transit"
	desc = "A cheap robotic prosthetic designed for yinglet owners."
	icon_base = 'mods/valsalia/icons/metal_main.dmi'

/decl/bodytype/prosthetic/ying/metal/fbp
	name = "yinglet, gynoid"
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_LIPS | HAS_UNDERWEAR

/decl/bodytype/prosthetic/ying/metal/fbp/masculine
	name = "yinglet, android"
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_LIPS | HAS_UNDERWEAR

DEFINE_ROBOLIMB_MODEL_ASPECTS(/decl/bodytype/prosthetic/ying/metal, yinglet_scavenged, 0)
DEFINE_ROBOLIMB_DESIGNS(/decl/bodytype/prosthetic/ying/metal, lunar_transit)

/decl/material/solid/wood/generate_recipes(var/reinforce_material)
	. = ..()
	if(!reinforce_material)
		. += new/datum/stack_recipe/wooden_prosthetic/left_arm_ying(src)
		. += new/datum/stack_recipe/wooden_prosthetic/right_arm_ying(src)
		. += new/datum/stack_recipe/wooden_prosthetic/left_leg_ying(src)
		. += new/datum/stack_recipe/wooden_prosthetic/right_leg_ying(src)
		. += new/datum/stack_recipe/wooden_prosthetic/left_hand_ying(src)
		. += new/datum/stack_recipe/wooden_prosthetic/right_hand_ying(src)
		. += new/datum/stack_recipe/wooden_prosthetic/left_foot_ying(src)
		. += new/datum/stack_recipe/wooden_prosthetic/right_foot_ying(src)

/datum/stack_recipe/wooden_prosthetic/left_arm_ying
	title = "small left arm"
	result_type = /obj/item/organ/external/arm/yinglet/wooden

/datum/stack_recipe/wooden_prosthetic/right_arm_ying
	title = "small right arm"
	result_type = /obj/item/organ/external/arm/right/yinglet/wooden

/datum/stack_recipe/wooden_prosthetic/left_leg_ying
	title = "small left leg"
	result_type = /obj/item/organ/external/leg/yinglet/wooden

/datum/stack_recipe/wooden_prosthetic/right_leg_ying
	title = "small right leg"
	result_type = /obj/item/organ/external/leg/right/yinglet/wooden

/datum/stack_recipe/wooden_prosthetic/left_hand_ying
	title = "small left hand"
	result_type = /obj/item/organ/external/hand/yinglet/wooden

/datum/stack_recipe/wooden_prosthetic/right_hand_ying
	title = "small right hand"
	result_type = /obj/item/organ/external/hand/right/yinglet/wooden

/datum/stack_recipe/wooden_prosthetic/left_foot_ying
	title = "small left foot"
	result_type = /obj/item/organ/external/foot/yinglet/wooden

/datum/stack_recipe/wooden_prosthetic/right_foot_ying
	title = "small right foot"
	result_type = /obj/item/organ/external/foot/right/yinglet/wooden

/obj/item/organ/external/arm/yinglet/wooden
	material = /decl/material/solid/wood
/obj/item/organ/external/arm/yinglet/wooden/Initialize()
	species = all_species[SPECIES_HUMAN]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden)

/obj/item/organ/external/arm/right/yinglet/wooden
	material = /decl/material/solid/wood
/obj/item/organ/external/arm/right/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden)

/obj/item/organ/external/leg/yinglet/wooden
	material = /decl/material/solid/wood
/obj/item/organ/external/leg/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden)

/obj/item/organ/external/leg/right/yinglet/wooden
	material = /decl/material/solid/wood
/obj/item/organ/external/leg/right/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden)

/obj/item/organ/external/hand/yinglet/wooden
	material = /decl/material/solid/wood
/obj/item/organ/external/hand/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden)

/obj/item/organ/external/hand/right/yinglet/wooden
	material = /decl/material/solid/wood
/obj/item/organ/external/hand/right/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden)

/obj/item/organ/external/foot/yinglet/wooden
	material = /decl/material/solid/wood
/obj/item/organ/external/foot/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden)

/obj/item/organ/external/foot/right/yinglet/wooden
	material = /decl/material/solid/wood
/obj/item/organ/external/foot/right/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden)
