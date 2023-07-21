/decl/bodytype/baxxid
	bodytype_category = BODYTYPE_BAXXID
	bodytype_flag =     BODY_FLAG_BAXXID
	damage_overlays =   'mods/valsalia/icons/species/baxxid/damage_overlay.dmi'
	icon_template =     'mods/valsalia/icons/species/baxxid/template.dmi'
	icon_base =         'mods/valsalia/icons/species/baxxid/body.dmi'
	limb_blend = ICON_MULTIPLY

/decl/species/baxxid
	name = SPECIES_BAXXID
	name_plural = SPECIES_BAXXID
	available_bodytypes = list(
		/decl/bodytype/baxxid
	)
	manual_dexterity = DEXTERITY_KEYBOARDS
	mob_size = MOB_SIZE_LARGE

	unarmed_attacks = list(
		/decl/natural_attack/claws/strong/baxxid,
		/decl/natural_attack/bite/strong
	)

	hud_type = /datum/hud_data/baxxid
	species_flags = SPECIES_FLAG_NO_MINOR_CUT | SPECIES_FLAG_NO_SLIP
	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes/baxxid
	)

	available_cultural_info = list(
		TAG_CULTURE =   list(
			/decl/cultural_info/culture/baxxid,
			/decl/cultural_info/culture/other
		),
		TAG_HOMEWORLD = list(
			/decl/cultural_info/location/stateless
		),
		TAG_FACTION =   list(
			/decl/cultural_info/faction/baxxid,
			/decl/cultural_info/faction/other
		),
		TAG_RELIGION =  list(
			/decl/cultural_info/religion/other
		)
	)

/decl/species/baxxid/handle_autohiss(message, decl/language/lang, mode)
	if(autohiss_exempt && (lang.name in autohiss_exempt))
		return message
	. = message
	if(!istype(lang, /decl/language/baxxid))
		var/hnnn = "H"
		for(var/i = 1 to rand(3,5))
			hnnn += "n"
		var/first_char = copytext(message, 1, 1)
		if(first_char != lowertext(first_char))
			hnnn = uppertext(capitalize(hnnn))
		. = "[hnnn][uppertext(.)]"

/obj/item/organ/internal/eyes/baxxid
	eye_icon = 'mods/valsalia/icons/species/baxxid/eyes.dmi'

/decl/sprite_accessory/marking/baxxid
	name = "Crest"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_BAXXID)
	icon = 'mods/valsalia/icons/species/baxxid/markings.dmi'
	icon_state = "crest"
	blend = ICON_MULTIPLY

/decl/sprite_accessory/marking/baxxid/plates
	name = "Armour Plates"
	body_parts = list(BP_CHEST, BP_GROIN)
	icon_state = "plates"

/decl/sprite_accessory/marking/baxxid/bones
	name = "Bony Segments"
	body_parts = list(BP_CHEST, BP_GROIN, BP_HEAD, BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG, BP_R_FOOT, BP_L_FOOT)
	icon_state = "bones"

/datum/hud_data/baxxid
	has_hands = FALSE
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
