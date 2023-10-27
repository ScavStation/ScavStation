/datum/job/yinglet
	hud_icon = "hudying"
	supervisors = "the Matriarch and the Patriarches"
	outfit_type = /decl/hierarchy/outfit/job/yinglet/assistant
	department_types = list(/decl/department/enclave)
	max_skill = list(
		SKILL_PILOT    = SKILL_ADEPT,
		SKILL_SCIENCE  = SKILL_ADEPT,
		SKILL_COMBAT   = SKILL_ADEPT,
		SKILL_WEAPONS  = SKILL_ADEPT,
		SKILL_LITERACY = SKILL_BASIC
	)

/datum/job/yinglet/is_species_allowed(var/decl/species/S)
	if(S && !istype(S))
		S = all_species[S]
	. = istype(S) && S.name == SPECIES_YINGLET

/datum/job/yinglet/check_special_blockers(var/datum/preferences/prefs)
	if(required_gender && prefs.gender != required_gender)
		. = "[required_gender] only"

/decl/hierarchy/outfit/job
	var/yinglet_suit_fallback

/decl/hierarchy/outfit/job/proc/try_give_yinglet_fallbacks(var/mob/living/carbon/human/H, var/title)
	if(!H || H.species.name != SPECIES_YINGLET)
		return
	var/previous_suit = H.get_equipped_item(slot_wear_suit_str)
	if(previous_suit)
		H.try_unequip(previous_suit)
	if(shoes && !H.get_equipped_item(slot_shoes_str))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal/yinglet(H), slot_shoes_str)
	if(uniform && !H.get_equipped_item(slot_w_uniform_str))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/yinglet(H), slot_w_uniform_str)
	if(previous_suit)
		H.equip_to_slot_if_possible(previous_suit, slot_wear_suit_str)
	else if(suit && yinglet_suit_fallback)
		var/datum/job/J = SSjobs.get_by_title(title)
		if(J && J.head_position)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/toggle/redcoat/yinglet/officer, slot_wear_suit_str)
		else
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/toggle/redcoat/yinglet, slot_wear_suit_str)

/decl/hierarchy/outfit/job/equip_outfit(mob/living/carbon/human/H, assignment, equip_adjustments, datum/job/job, datum/mil_rank/rank)
	. = ..()
	try_give_yinglet_fallbacks(H, rank)
