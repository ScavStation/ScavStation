/decl/bodytype/baxxid
	bodytype_category = BODYTYPE_BAXXID
	bodytype_flag =     BODY_FLAG_BAXXID
	icon_template =     'mods/valsalia/icons/species/baxxid/template.dmi'
	icon_base =         'mods/valsalia/icons/species/baxxid/body.dmi'
	limb_blend = ICON_MULTIPLY
	manual_dexterity = (DEXTERITY_SIMPLE_MACHINES|DEXTERITY_KEYBOARDS)
	mob_size = MOB_SIZE_LARGE
	base_color = "#c7b8aa"
	base_eye_color = "#003366"
	default_sprite_accessories = list(
		SAC_MARKINGS = list(
			/decl/sprite_accessory/marking/baxxid        = "#d1cab7",
			/decl/sprite_accessory/marking/baxxid/bones  = "#d1cab7",
			/decl/sprite_accessory/marking/baxxid/plates = "#d1a170"
		)
	)
	eye_icon = 'mods/valsalia/icons/species/baxxid/eyes.dmi'
	appearance_flags = HAS_SKIN_COLOR | HAS_EYE_COLOR
	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes
	)
	override_limb_types = list(
		BP_L_HAND = /obj/item/organ/external/hand/baxxid,
		BP_R_HAND = /obj/item/organ/external/hand/right/baxxid,
		BP_HEAD =   /obj/item/organ/external/head/baxxid
	)

/decl/bodytype/baxxid/Initialize()
	. = ..()
	equip_adjust = list(
		slot_back_str = list(
			"[NORTH]" = list( 0, 0),
			"[EAST]"  = list( 6, 0),
			"[WEST]"  = list(-6, 0),
			"[SOUTH]" = list( 0, 0),
		),
		slot_wear_mask_str = list (
			"[NORTH]" = list(-1, 2),
			"[EAST]"  = list( 4, 4),
			"[WEST]"  = list(-4, 4),
			"[SOUTH]" = list(-1, 2)
		),
		slot_head_str = list (
			"[NORTH]" = list( 0, 10),
			"[EAST]"  = list(-1, 10),
			"[WEST]"  = list( 1, 10),
			"[SOUTH]" = list( 0, 10)
		),
		slot_glasses_str  = list (
			"[NORTH]" = list( 0, 1),
			"[EAST]"  = list( 4, 4),
			"[WEST]"  = list(-4, 4),
			"[SOUTH]" = list( 0, 1)
		),
		slot_belt_str = list (
			"[NORTH]" = list( 0, 0),
			"[EAST]"  = list( 6, 0),
			"[WEST]"  = list(-6, 0),
			"[SOUTH]" = list( 0, 0)
		)
	)

/decl/hierarchy/outfit/baxxid
	name = "Baxxid Hood"
	head = /obj/item/clothing/head/baxxid/hood/long

/decl/species/baxxid
	name = SPECIES_BAXXID
	name_plural = SPECIES_BAXXID
	available_bodytypes = list(
		/decl/bodytype/baxxid
	)

	unarmed_attacks = list(
		/decl/natural_attack/claws/strong/baxxid,
		/decl/natural_attack/bite/strong
	)

	base_external_prosthetics_model = null
	preview_outfit = /decl/hierarchy/outfit/baxxid

	hud_type = /datum/hud_data/baxxid
	species_flags = SPECIES_FLAG_NO_MINOR_CUT | SPECIES_FLAG_NO_SLIP
	spawn_flags = SPECIES_CAN_JOIN

	available_cultural_info = list(
		TAG_CULTURE =   list(
			/decl/cultural_info/culture/baxxid,
			/decl/cultural_info/culture/other
		),
		TAG_HOMEWORLD = list(
			/decl/cultural_info/location/tradehousespace,
			/decl/cultural_info/location/stateless
		),
		TAG_FACTION =   list(
			/decl/cultural_info/faction/baxxid,
			/decl/cultural_info/faction/tradehouse_baxxid,
			/decl/cultural_info/faction/other
		),
		TAG_RELIGION =  list(
			/decl/cultural_info/religion/other
		)
	)

/decl/species/baxxid/proc/generate_autohnnn(var/first_char)
	var/ptr = first_char
	switch(first_char)
		if("?") return pick("hnnngh", "hnnnngh")
		if("a","e","i","o","u") ptr=pick(35; "h", 43; "n", 10; "r", 8; "m")
		if("c","g","k","q","w","x","y") ptr=pick(41; "n", 20; "h", 6; "r", 3; "w")
		if("n","t","d","s","z","r","l") ptr=pick(60; "n", 26; "h", 6; "r", 6; "m")
		if("m","p","b","f","v") ptr=pick(50; "m", 25; "h", 25; "n")
		if("h") ptr=pick(4; "n", 6; "h")
		else ptr="n"
	. = ptr
	var/t = 0
	for(var/i = 1 to 8)
		t += rand()
		if(t>1.8)
			break
		switch(ptr)
			if("h") ptr=pick(81; "h",  5; "g", 2; "n", 2; "r")
			if("n") ptr=pick(29; "h", 95; "n", 5; "m", 3; "r")
			if("m") ptr=pick(1;  "r", 48; "m", 5; "h")
			if("g") ptr=pick(3;  "n",  1; "h")
			if("r") ptr=pick(12; "h", 19; "r")
			if("w") ptr=pick(30; "w",  1; "h")
		. = ptr + .

/decl/species/baxxid/proc/autodrawl(message, var/k=1)
	. = "*"
	var/word = ""
	var/ch = ""
	var/p = 1
	while (length(message))
		var/c = copytext_char(message, 1, 2)
		ch = lowertext(c)
		if ((text2ascii(ch, 0)<97)||(text2ascii(ch, 0)>122))
			if (p!=0) // previous character was alpha, ch is not alpha
				p = 0
				. += word
				word = ""
				k = min(k*1.2, 100) // increasing for next step
			else
				p = 0 // don't double non-alphabet
		else // ch isalpha
			p = 0.1 // default for various
			switch(ch)
				if("x","n","s") p = 33
				if("l","g","y","f","w") p=10
				if("u","e","i","h","v","o") p=5
				if("r","m") p = 3
		word += c
		if(prob(p*k))
			if (ch == uppertext(c)) // upper or nonascii
				switch (text2ascii(message,2))
					if (65 to 90)
						word += c + c // caps
					else
						word += ch + ch // capitalized
			else
				word += c+c
			k *= 0.8	
		message = copytext_char(message, 2)
	switch(text2ascii(uppertext(ch)))
		if (65 to 90)
			. += word + "*"
		else
			if (. == "*")
				. = word // skip over **
			else
				. += "*" + word //punctuation to get correct vervs


/decl/species/baxxid/handle_autohiss(message, decl/language/lang, mode)
	if(lang.flags & LANG_FLAG_NO_STUTTER)
		return message
	if(autohiss_exempt && (lang.name in autohiss_exempt))
		return message
	. = message
	if(!istype(lang, /decl/language/baxxid))
		var/first_char = copytext(message, 1, 2)
		var/hnnn = capitalize(generate_autohnnn(lowertext(first_char)))
		if (mode == PREF_BASIC)
			. = "[hnnn][uppertext(message)]"
		else
			if ((message == uppertext(message)) && (message != lowertext(message)))
				hnnn = uppertext(hnnn) // capitalize if all caps
			. = "[hnnn][autodrawl(message)]"

/decl/sprite_accessory/marking/baxxid
	name = "Crest"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_BAXXID)
	icon = 'mods/valsalia/icons/species/baxxid/markings.dmi'
	icon_state = "crest"
	color_blend = ICON_MULTIPLY
	mask_to_bodypart = FALSE
	uid = "marking_baxxid_crest"

/decl/sprite_accessory/marking/baxxid/plates
	name = "Armour Plates"
	body_parts = list(BP_CHEST, BP_GROIN)
	icon_state = "plates"
	mask_to_bodypart = TRUE
	uid = "marking_baxxid_plates"

/decl/sprite_accessory/marking/baxxid/bones
	name = "Bony Segments"
	body_parts = list(BP_CHEST, BP_GROIN, BP_HEAD, BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG, BP_R_FOOT, BP_L_FOOT)
	icon_state = "bones"
	mask_to_bodypart = TRUE
	uid = "marking_baxxid_bones"

/datum/hud_data/baxxid
	inventory_slots = list(
		/datum/inventory_slot/handcuffs,
		/datum/inventory_slot/id,
		/datum/inventory_slot/back,
		/datum/inventory_slot/pocket,
		/datum/inventory_slot/pocket/right,
		/datum/inventory_slot/suit,
		/datum/inventory_slot/suit_storage,
		/datum/inventory_slot/mask,
		/datum/inventory_slot/head,
		/datum/inventory_slot/glasses,
		/datum/inventory_slot/ear,
		/datum/inventory_slot/ear/right,
		/datum/inventory_slot/belt
	)

/decl/natural_attack/claws/strong/baxxid
	name = "forelimb stab"
	attack_verb = list("stabbed", "maimed", "impaled")
	damage = 12
	sharp = 1
	edge = 1
	delay = 15
	eye_attack_text = "an enormous forelimb"
	eye_attack_text_victim = "an enormous forelimb"

/obj/item/organ/external/hand/baxxid
	gripper_type = /datum/inventory_slot/gripper/left_hand/baxxid

/obj/item/organ/external/hand/baxxid/get_manual_dexterity()
	return (DEXTERITY_HOLD_ITEM|DEXTERITY_SIMPLE_MACHINES|DEXTERITY_KEYBOARDS)

/obj/item/organ/external/hand/right/baxxid
	gripper_type = /datum/inventory_slot/gripper/right_hand/baxxid

/obj/item/organ/external/hand/right/baxxid/get_manual_dexterity()
	return (DEXTERITY_HOLD_ITEM|DEXTERITY_SIMPLE_MACHINES|DEXTERITY_KEYBOARDS)

/datum/inventory_slot/gripper/left_hand/baxxid
	can_use_held_item = FALSE

/datum/inventory_slot/gripper/right_hand/baxxid
	can_use_held_item = FALSE

/obj/item/organ/external/head/baxxid/do_install(mob/living/carbon/human/target, affected, in_place, update_icon, detached)
	. = ..()
	if(. && owner)
		owner.add_held_item_slot(new /datum/inventory_slot/gripper/mouth)

/obj/item/organ/external/head/baxxid/do_uninstall(in_place, detach, ignore_children, update_icon)
	owner?.remove_held_item_slot(BP_MOUTH)
	. = ..()
