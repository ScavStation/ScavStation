/decl/bodytype/indrel
	uid = "bodytype_indrel"
	name = "indrel"
	bodytype_category = BODYTYPE_INDREL
	bodytype_flag =     BODY_FLAG_INDREL
	icon_base =         'mods/valsalia/icons/species/indrel/body.dmi'
	icon_template =     'mods/valsalia/icons/species/indrel/template.dmi'
	eye_icon = 'mods/valsalia/icons/species/indrel/eyes.dmi'

	appearance_flags = HAS_EYE_COLOR
	has_organ = list(
		BP_HEART           = /obj/item/organ/internal/heart,
		BP_STOMACH         = /obj/item/organ/internal/stomach,
		BP_LUNGS           = /obj/item/organ/internal/lungs,
		BP_LIVER           = /obj/item/organ/internal/liver,
		BP_KIDNEYS         = /obj/item/organ/internal/kidneys,
		BP_BRAIN           = /obj/item/organ/internal/brain,
		BP_EYES            = /obj/item/organ/internal/eyes,
		BP_PHEROMONE_GLAND = /obj/item/organ/internal/pheromone_gland
	)
	has_limbs = list(
		BP_CHEST           = list("path" = /obj/item/organ/external/chest/insectoid),
		BP_GROIN           = list("path" = /obj/item/organ/external/groin/insectoid),
		BP_HEAD            = list("path" = /obj/item/organ/external/head/insectoid),
		BP_L_ARM           = list("path" = /obj/item/organ/external/arm/insectoid),
		BP_L_HAND          = list("path" = /obj/item/organ/external/hand/insectoid),
		BP_L_HAND_UPPER    = list("path" = /obj/item/organ/external/hand/insectoid/upper/indrel),
		BP_R_ARM           = list("path" = /obj/item/organ/external/arm/right/insectoid),
		BP_R_HAND          = list("path" = /obj/item/organ/external/hand/right/insectoid),
		BP_R_HAND_UPPER    = list("path" = /obj/item/organ/external/hand/right/insectoid/upper/indrel),
		BP_R_LEG           = list("path" = /obj/item/organ/external/leg/right/insectoid),
		BP_L_LEG           = list("path" = /obj/item/organ/external/leg/insectoid),
		BP_L_FOOT          = list("path" = /obj/item/organ/external/foot/insectoid),
		BP_R_FOOT          = list("path" = /obj/item/organ/external/foot/right/insectoid)
	)
	limb_mapping = list(
		BP_L_HAND = list(BP_L_HAND, BP_L_HAND_UPPER),
		BP_R_HAND = list(BP_R_HAND, BP_R_HAND_UPPER)
	)

/decl/bodytype/indrel/Initialize()
	. = ..()
	equip_adjust = list(
		BP_L_HAND_UPPER =  list(
			"[NORTH]" = list( 0, 8),
			"[EAST]"  = list( 0, 8),
			"[SOUTH]" = list(-0, 8),
			"[WEST]"  = list( 0, 8)
		),
		BP_R_HAND_UPPER =  list(
			"[NORTH]" = list( 0, 8),
			"[EAST]"  = list( 0, 8),
			"[SOUTH]" = list( 0, 8),
			"[WEST]"  = list( 0, 8)
		),
		slot_head_str = list(
			"[NORTH]" = list( 0, 3),
			"[EAST]" =  list( 3, 3),
			"[WEST]" =  list(-3, 3),
			"[SOUTH]" = list( 0, 3)
		),
		slot_wear_suit_str = list(
			"[NORTH]" = list( 0, 3),
			"[EAST]" =  list( 1, 3),
			"[WEST]" =  list(-1, 3),
			"[SOUTH]" = list( 0, 3)
		),
		slot_back_str = list(
			"[NORTH]" = list( 0, 3),
			"[EAST]" =  list( 3, 3),
			"[WEST]" =  list(-3, 3),
			"[SOUTH]" = list( 0, 3)
		),
		slot_belt_str = list(
			"[NORTH]" = list( 0, 1),
			"[EAST]" =  list( 1, 1),
			"[WEST]" =  list(-1, 1),
			"[SOUTH]" = list( 0, 1)
		),
		slot_glasses_str = list(
			"[NORTH]" = list( 0, 4),
			"[EAST]" =  list( 3, 4),
			"[WEST]" =  list(-3, 4),
			"[SOUTH]" = list( 0, 4)
		),
		slot_wear_mask_str = list(
			"[NORTH]" = list( 0, 4),
			"[EAST]" =  list( 3, 4),
			"[WEST]" =  list(-3, 4),
			"[SOUTH]" = list( 0, 4)
		)
	)
/decl/species/indrel
	name = SPECIES_INDREL
	name_plural = SPECIES_INDREL
	description = "A species of large insectoids that inhabit the giant Indrel Mountain range that dominates the continent. \
	They usually keep to themselves, and aren't very keen on people settling within their territory, but they can be open to \
	cooperation if there is a good incentive for them and their hive."

	sniff_message_3p = "waves their antennae."
	sniff_message_1p = "You wave your antennae, searching for scents."

	available_bodytypes = list(
		/decl/bodytype/indrel
	)

	spawn_flags = SPECIES_CAN_JOIN
	species_flags = SPECIES_FLAG_NO_MINOR_CUT

	base_external_prosthetics_model = null

	unarmed_attacks = list(
		/decl/natural_attack/claws/strong,
		/decl/natural_attack/bite/strong
	)
	hazard_low_pressure = -1

	available_background_info = list(
		/decl/background_category/heritage =  list(
			/decl/background_detail/heritage/indrel/mountains,
			/decl/background_detail/heritage/other
		),
		/decl/background_category/homeworld = list(
			/decl/background_detail/location/tradehousespace,
			/decl/background_detail/location/stateless
		),
		/decl/background_category/faction =   list(
			/decl/background_detail/faction/tradehouse_indrel,
			/decl/background_detail/faction/indrel,
			/decl/background_detail/faction/hiveless,
			/decl/background_detail/faction/wanderer
		),
		/decl/background_category/religion =  list(
			/decl/background_detail/religion/dinnaism,
			/decl/background_detail/religion/veil_worship,
			/decl/background_detail/religion/angel_worship,
			/decl/background_detail/religion/ancestor_worship,
			/decl/background_detail/religion/faithless,
		)
	)

// TODO: stronger melee attack from these limbs.
/datum/inventory_slot/gripper/right_hand/indrel
	slot_name = "Upper Right Hand"
	slot_id = BP_R_HAND_UPPER
	requires_organ_tag = BP_R_HAND_UPPER
	dexterity = (DEXTERITY_HOLD_ITEM|DEXTERITY_SIMPLE_MACHINES|DEXTERITY_KEYBOARDS)
	overlay_slot = BP_R_HAND_UPPER
	ui_label = "UR"
	hand_sort_priority = 2

/datum/inventory_slot/gripper/left_hand/indrel
	slot_name = "Upper Left Hand"
	slot_id = BP_L_HAND_UPPER
	requires_organ_tag = BP_L_HAND_UPPER
	dexterity = (DEXTERITY_HOLD_ITEM|DEXTERITY_SIMPLE_MACHINES|DEXTERITY_KEYBOARDS)
	overlay_slot = BP_L_HAND_UPPER
	ui_label = "UL"
	hand_sort_priority = 2

/obj/item/organ/external/hand/right/insectoid/upper/indrel
	gripper_type = /datum/inventory_slot/gripper/right_hand/indrel

/obj/item/organ/external/hand/insectoid/upper/indrel
	gripper_type = /datum/inventory_slot/gripper/left_hand/indrel

/decl/species/indrel/handle_autohiss(message, decl/language/lang, mode)
	if(autohiss_exempt && (lang.name in autohiss_exempt))
		return message
	. = ""

	var/upperset = prob(50)
	var/caseperiod = rand(2,10)
	var/khxxted = FALSE
	for(var/i = 1 to length(message))
		var/add_char = message[i]
		if(!khxxted && prob(25) && (i == 1 || add_char == "," || add_char == "."))
			var/khxxt = ""
			khxxted = prob(25)
			if(i != 1)
				khxxt += " "
			khxxt += "k"
			if(prob(66))
				for(var/j = 1 to rand(2,3))
					khxxt += "h"
			for(var/j = 1 to rand(1,3))
				khxxt += "x"
			for(var/j = 1 to rand(1,3))
				khxxt += "t"
			if(i == 1)
				khxxt += " "
			add_char = "[khxxt][add_char]"
		if(upperset)
			add_char = uppertext(add_char)
		caseperiod--
		if(caseperiod <= 0)
			caseperiod = rand(2,10)
			upperset = prob(33)
		if((add_char in global.alphabet_no_vowels) && prob(15))
			for(var/j = 1 to rand(2,4))
				. += add_char
		. += add_char
	. = capitalize(trim(.))
