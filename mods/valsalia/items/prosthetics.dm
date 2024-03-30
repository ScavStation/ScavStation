/decl/bodytype/prosthetic/ying
	bodytype_flag     = BODY_FLAG_YINGLET
	bodytype_category = BODYTYPE_YINGLET
	mob_size          = MOB_SIZE_SMALL
	abstract_type     = /decl/bodytype/prosthetic/ying
	movement_slowdown = -0.5
	limb_blend        = ICON_MULTIPLY
	eye_blend         = ICON_MULTIPLY
	eye_icon          = 'mods/valsalia/icons/species/yinglet/eyes.dmi'
	cosmetics_icon    = 'mods/valsalia/icons/species/yinglet/cosmetics.dmi'
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
	default_sprite_accessories = list(
		SAC_MARKINGS = list(
			/decl/sprite_accessory/marking/yinglet/long_ears  = COLOR_GUNMETAL,
			/decl/sprite_accessory/marking/yinglet/shelltooth = COLOR_GUNMETAL
		)
	)

/decl/bodytype/prosthetic/ying/Initialize()
	var/decl/bodytype/meatying = GET_DECL(/decl/bodytype/yinglet)
	equip_adjust = deepCopyList(meatying.equip_adjust)
	. = ..()

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
	material = /decl/material/solid/organic/wood

/decl/bodytype/prosthetic/ying/metal
	name = "Lunar Transit"
	desc = "A cheap robotic prosthetic designed for yinglet owners."
	icon_base = 'mods/valsalia/icons/metal_male.dmi'
	material = /decl/material/solid/metal/steel

/decl/bodytype/prosthetic/ying/metal/fbp
	name = "yinglet, gynoid"
	icon_base = 'mods/valsalia/icons/metal_female.dmi'
	appearance_flags = HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_UNDERWEAR

/decl/bodytype/prosthetic/ying/metal/fbp/masculine
	name = "yinglet, android"
	appearance_flags = HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_UNDERWEAR

DEFINE_ROBOLIMB_MODEL_ASPECTS(/decl/bodytype/prosthetic/ying/metal, yinglet_scavenged, 0)
DEFINE_ROBOLIMB_DESIGNS(/decl/bodytype/prosthetic/ying/metal, lunar_transit)

/decl/stack_recipe/wooden_prosthetic
	abstract_type = /decl/stack_recipe/wooden_prosthetic
	required_material = /decl/material/solid/organic/wood

/decl/stack_recipe/wooden_prosthetic/left_arm_ying
	name = "small left arm"
	result_type = /obj/item/organ/external/arm/yinglet/wooden

/decl/stack_recipe/wooden_prosthetic/right_arm_ying
	name = "small right arm"
	result_type = /obj/item/organ/external/arm/right/yinglet/wooden

/decl/stack_recipe/wooden_prosthetic/left_leg_ying
	name = "small left leg"
	result_type = /obj/item/organ/external/leg/yinglet/wooden

/decl/stack_recipe/wooden_prosthetic/right_leg_ying
	name = "small right leg"
	result_type = /obj/item/organ/external/leg/right/yinglet/wooden

/decl/stack_recipe/wooden_prosthetic/left_hand_ying
	name = "small left hand"
	result_type = /obj/item/organ/external/hand/yinglet/wooden

/decl/stack_recipe/wooden_prosthetic/right_hand_ying
	name = "small right hand"
	result_type = /obj/item/organ/external/hand/right/yinglet/wooden

/decl/stack_recipe/wooden_prosthetic/left_foot_ying
	name = "small left foot"
	result_type = /obj/item/organ/external/foot/yinglet/wooden

/decl/stack_recipe/wooden_prosthetic/right_foot_ying
	name = "small right foot"
	result_type = /obj/item/organ/external/foot/right/yinglet/wooden

/obj/item/organ/external/arm/yinglet/wooden
	material = /decl/material/solid/organic/wood
/obj/item/organ/external/arm/yinglet/wooden/Initialize(var/ml, var/material_key)
	species = all_species[SPECIES_HUMAN]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden, material_key)

/obj/item/organ/external/arm/right/yinglet/wooden
	material = /decl/material/solid/organic/wood
/obj/item/organ/external/arm/right/yinglet/wooden/Initialize(var/ml, var/material_key)
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden, material_key)

/obj/item/organ/external/leg/yinglet/wooden
	material = /decl/material/solid/organic/wood
/obj/item/organ/external/leg/yinglet/wooden/Initialize(var/ml, var/material_key)
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden, material_key)

/obj/item/organ/external/leg/right/yinglet/wooden
	material = /decl/material/solid/organic/wood
/obj/item/organ/external/leg/right/yinglet/wooden/Initialize(var/ml, var/material_key)
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden, material_key)

/obj/item/organ/external/hand/yinglet/wooden
	material = /decl/material/solid/organic/wood
/obj/item/organ/external/hand/yinglet/wooden/Initialize(var/ml, var/material_key)
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden, material_key)

/obj/item/organ/external/hand/right/yinglet/wooden
	material = /decl/material/solid/organic/wood
/obj/item/organ/external/hand/right/yinglet/wooden/Initialize(var/ml, var/material_key)
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden, material_key)

/obj/item/organ/external/foot/yinglet/wooden
	material = /decl/material/solid/organic/wood
/obj/item/organ/external/foot/yinglet/wooden/Initialize(var/ml, var/material_key)
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden, material_key)

/obj/item/organ/external/foot/right/yinglet/wooden
	material = /decl/material/solid/organic/wood
/obj/item/organ/external/foot/right/yinglet/wooden/Initialize(var/ml, var/material_key)
	species = all_species[SPECIES_YINGLET]
	. = ..()
	set_bodytype(/decl/bodytype/prosthetic/ying/wooden, material_key)
