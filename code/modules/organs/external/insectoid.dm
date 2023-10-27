/obj/item/organ/external/arm/insectoid
	name = "left forelimb"
	amputation_point = "coxa"
	icon_position = LEFT
	encased = "carapace"

/obj/item/organ/external/arm/right/insectoid
	name = "right forelimb"
	amputation_point = "coxa"
	icon_position = RIGHT
	encased = "carapace"

/obj/item/organ/external/leg/insectoid
	encased = "carapace"

/obj/item/organ/external/leg/right/insectoid
	encased = "carapace"

/obj/item/organ/external/foot/insectoid
	encased = "carapace"

/obj/item/organ/external/foot/right/insectoid
	encased = "carapace"

/obj/item/organ/external/hand/insectoid
	name = "left grasper"
	icon_position = LEFT
	encased = "carapace"

/obj/item/organ/external/hand/right/insectoid
	name = "right grasper"
	icon_position = RIGHT
	encased = "carapace"

/obj/item/organ/external/groin/insectoid
	name = "abdomen"
	icon_position = UNDER
	encased = "carapace"

/obj/item/organ/external/head/insectoid
	name = "head"
	has_lips = 0
	encased = "carapace"

/obj/item/organ/external/chest/insectoid
	name = "thorax"
	encased = "carapace"

/obj/item/organ/external/hand/insectoid/upper
	name = "left raptorial"
	joint = "left upper wrist"
	amputation_point = "left upper wrist"
	organ_tag = BP_L_HAND_UPPER
	gripper_type = /datum/inventory_slot/gripper/upper_left_hand

/obj/item/organ/external/hand/insectoid/upper/get_manual_dexterity()
	return (..() & ~(DEXTERITY_WEAPONS|DEXTERITY_COMPLEX_TOOLS))

/obj/item/organ/external/hand/right/insectoid/upper
	name = "right raptorial"
	joint = "right upper wrist"
	amputation_point = "right upper wrist"
	organ_tag = BP_R_HAND_UPPER
	gripper_type = /datum/inventory_slot/gripper/upper_right_hand

/obj/item/organ/external/hand/right/insectoid/upper/get_manual_dexterity()
	return (..() & ~(DEXTERITY_WEAPONS|DEXTERITY_COMPLEX_TOOLS))
