/decl/prosthetics_manufacturer/ying_wooden
	name = "scavenged prosthesis"
	desc = "A stick, tied to the owner's body with rags. Very scav chic."
	icon = 'mods/valsalia/icons/wooden_main.dmi'
	allowed_bodytypes = list(BODYTYPE_YINGLET)
	modifier_string = "wooden"
	hardiness = 0.75
	manual_dexterity = DEXTERITY_SIMPLE_MACHINES
	movement_slowdown = 2
	is_robotic = FALSE

/decl/prosthetics_manufacturer/ying_metal
	name = "Lunar Transit"
	desc = "A cheap robotic prosthetic designed for yinglet owners."
	icon = 'mods/valsalia/icons/metal_main.dmi'
	allowed_bodytypes = list(BODYTYPE_YINGLET)

DEFINE_ROBOLIMB_DESIGNS(/decl/prosthetics_manufacturer/ying_metal, lunar_transit)

/decl/material/wood/generate_recipes(var/reinforce_material)
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

/obj/item/organ/external/arm/yinglet/wooden/Initialize()
	species = all_species[SPECIES_HUMAN]
	. = ..()
	robotize(/decl/prosthetics_manufacturer/ying_wooden)

/obj/item/organ/external/arm/right/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	robotize(/decl/prosthetics_manufacturer/ying_wooden)

/obj/item/organ/external/leg/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	robotize(/decl/prosthetics_manufacturer/ying_wooden)

/obj/item/organ/external/leg/right/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	robotize(/decl/prosthetics_manufacturer/ying_wooden)

/obj/item/organ/external/hand/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	robotize(/decl/prosthetics_manufacturer/ying_wooden)

/obj/item/organ/external/hand/right/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	robotize(/decl/prosthetics_manufacturer/ying_wooden)

/obj/item/organ/external/foot/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	robotize(/decl/prosthetics_manufacturer/ying_wooden)

/obj/item/organ/external/foot/right/yinglet/wooden/Initialize()
	species = all_species[SPECIES_YINGLET]
	. = ..()
	robotize(/decl/prosthetics_manufacturer/ying_wooden)