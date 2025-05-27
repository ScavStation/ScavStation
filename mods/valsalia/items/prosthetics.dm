/decl/bodytype/prosthetic/ying
	abstract_type     = /decl/bodytype/prosthetic/ying

/decl/bodytype/prosthetic/ying/Initialize()
	var/decl/bodytype/meatying = GET_DECL(/decl/bodytype/yinglet)
	bodytype_flag              = meatying.bodytype_flag
	bodytype_category          = meatying.bodytype_category
	mob_size                   = meatying.mob_size
	movement_slowdown          = meatying.movement_slowdown
	limb_blend                 = meatying.limb_blend
	eye_blend                  = meatying.eye_blend
	eye_icon                   = meatying.eye_icon
	cosmetics_icon             = meatying.cosmetics_icon
	equip_adjust               = deepCopyList(meatying.equip_adjust)
	has_limbs                  = deepCopyList(meatying.has_limbs)
	default_sprite_accessories = deepCopyList(meatying.default_sprite_accessories)
#ifdef MODPACK_SCALING_MODIFIERS
	scaling_adjustments_x      = meatying.scaling_adjustments_x?.Copy()
	scaling_adjustments_y      = meatying.scaling_adjustments_y?.Copy()
#endif
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
	organ_material = /decl/material/solid/organic/wood
	uid = "bodytype_prosthetic_yinglet_wooden"

/decl/bodytype/prosthetic/ying/metal
	name = "Lunar Transit"
	desc = "A cheap robotic prosthetic designed for yinglet owners."
	icon_base = 'mods/valsalia/icons/metal_male.dmi'
	organ_material = /decl/material/solid/metal/steel
	uid = "bodytype_prosthetic_yinglet_metal"

/decl/bodytype/prosthetic/ying/metal/fbp
	name = "yinglet, gynoid"
	icon_base = 'mods/valsalia/icons/metal_female.dmi'
	appearance_flags = HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_UNDERWEAR
	uid = "bodytype_prosthetic_yinglet_fbp_fem"
	age_descriptor = /datum/appearance_descriptor/age/yinglet
	appearance_descriptors = list(
		/datum/appearance_descriptor/height = 0.5,
		/datum/appearance_descriptor/build =  0.5
	)


/decl/bodytype/prosthetic/ying/metal/fbp/masculine
	name = "yinglet, android"
	appearance_flags = HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_UNDERWEAR
	uid = "bodytype_prosthetic_yinglet_fbp_masc"

DEFINE_ROBOLIMB_MODEL_TRAITS(/decl/bodytype/prosthetic/ying/metal, yinglet_scavenged, 0, "yinglet_scavenged")
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
