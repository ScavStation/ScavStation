/decl/outfit
	abstract_type = /decl/outfit
	var/name = "Naked"
	var/uniform = null
	var/suit = null
	var/back = null
	var/belt = null
	var/gloves = null
	var/shoes = null
	var/head = null
	var/mask = null
	var/l_ear = null
	var/r_ear = null
	var/glasses = null
	var/id = null
	var/l_pocket = null
	var/r_pocket = null
	var/suit_store = null
	var/holster = null
	var/list/hands
	var/list/backpack_contents = list() // In the list(path=count,otherpath=count) format

	var/id_type
	var/id_desc
	var/id_slot

	var/pda_type
	var/pda_slot

	var/id_pda_assignment

	var/list/backpack_overrides
	var/outfit_flags = OUTFIT_RESET_EQUIPMENT

/decl/outfit/Initialize()
	. = ..()
	backpack_overrides = backpack_overrides || list()

// This proc is structured slightly strangely because I will be adding pants to it.
/decl/outfit/validate()
	. = ..()

	for(var/check_type in list(uniform, suit, back, belt, gloves, shoes, head, mask, l_ear, r_ear, glasses, id, l_pocket, r_pocket, suit_store, pda_type, id_type))
		var/obj/item/thing = check_type
		if(isnull(thing))
			continue
		if(TYPE_IS_ABSTRACT(thing))
			. += "equipment includes abstract type '[thing]'"

	for(var/check_type in hands)
		var/obj/item/thing = check_type
		if(isnull(thing))
			continue
		if(TYPE_IS_ABSTRACT(thing))
			. += "hands includes abstract type '[thing]'"

	for(var/check_type in backpack_contents)
		var/obj/item/thing = check_type
		if(isnull(thing))
			continue
		if(TYPE_IS_ABSTRACT(thing))
			. += "backpack includes abstract type '[thing]'"

	if(uniform && (outfit_flags & OUTFIT_HAS_VITALS_SENSOR))
		if(!ispath(uniform, /obj/item/clothing))
			. += "outfit is flagged for sensors, but uniform cannot take accessories"
		var/succeeded = FALSE
		if(uniform)
			var/obj/item/sensor = new /obj/item/clothing/sensor/vitals
			var/obj/item/clothing/wear_uniform = new uniform // sadly we need to read a list
			if(wear_uniform.can_attach_accessory(sensor))
				succeeded = TRUE
			qdel(wear_uniform)
			qdel(sensor)
		if(!succeeded)
			. += "outfit is flagged for sensors, but uniform does not accept sensors"

/decl/outfit/proc/pre_equip(mob/living/wearer)
	if(outfit_flags & OUTFIT_RESET_EQUIPMENT)
		wearer.delete_inventory(TRUE)

/decl/outfit/proc/post_equip(mob/living/wearer)
	if(outfit_flags & OUTFIT_HAS_JETPACK)
		var/obj/item/tank/jetpack/J = locate(/obj/item/tank/jetpack) in wearer
		if(!J)
			return
		J.toggle()
		J.toggle_valve()

/decl/outfit/proc/equip_outfit(mob/living/wearer, assignment, equip_adjustments, datum/job/job, datum/mil_rank/rank)
	equip_base(wearer, equip_adjustments)
	equip_id(wearer, assignment, equip_adjustments, job, rank)
	for(var/path in backpack_contents)
		var/number = backpack_contents[path]
		for(var/i=0,i<number,i++)
			wearer.equip_to_slot_or_store_or_drop(new path(wearer), slot_in_backpack_str)

	if(!(OUTFIT_ADJUSTMENT_SKIP_POST_EQUIP & equip_adjustments))
		post_equip(wearer)

	if(outfit_flags & OUTFIT_HAS_VITALS_SENSOR)
		try_equip_vitals_sensor(wearer)

	return 1

/decl/outfit/proc/try_equip_vitals_sensor(mob/living/wearer)
	// Find an appropriate slot for the sensor.
	var/obj/item/clothing/sensor/vitals/sensor = new
	for(var/check_slot in global.vitals_sensor_equip_slots)
		if(!wearer.get_inventory_slot_datum(check_slot))
			continue
		var/obj/item/clothing/equipped = wearer.get_equipped_item(check_slot)
		if(istype(equipped) && !(locate(/obj/item/clothing/sensor/vitals) in equipped.accessories) && equipped.can_attach_accessory(sensor))
			equipped.attach_accessory(null, sensor)
			break
	// As a fallback dump the sensor into hands or storage.
	if(!istype(sensor.loc, /obj/item/clothing))
		wearer.put_in_hands_or_store_or_drop(sensor)

/decl/outfit/proc/equip_base(mob/living/wearer, var/equip_adjustments)
	set waitfor = FALSE
	pre_equip(wearer)

	//Start with uniform,suit,backpack for additional slots
	if(uniform)
		wearer.equip_to_slot_or_del(new uniform(wearer),slot_w_uniform_str)
		if(!wearer.get_equipped_item(slot_w_uniform_str))
			var/decl/species/wearer_species = wearer.get_species()
			if(wearer_species)
				wearer_species.equip_default_fallback_uniform(wearer)

		var/obj/item/equip_uniform = wearer.get_equipped_item(slot_w_uniform_str)
		if(holster && equip_uniform)
			var/obj/item/clothing/equip_holster = new holster
			equip_uniform.attackby(equip_holster, wearer)
			if(equip_holster.loc != equip_uniform && !QDELETED(equip_holster))
				qdel(equip_holster)

	if(suit)
		wearer.equip_to_slot_or_del(new suit(wearer),slot_wear_suit_str)
	if(back)
		wearer.equip_to_slot_or_del(new back(wearer),slot_back_str)
	if(belt)
		wearer.equip_to_slot_or_del(new belt(wearer),slot_belt_str)
	if(gloves)
		wearer.equip_to_slot_or_del(new gloves(wearer),slot_gloves_str)
	if(shoes)
		wearer.equip_to_slot_or_del(new shoes(wearer),slot_shoes_str)
	if(mask)
		wearer.equip_to_slot_or_del(new mask(wearer),slot_wear_mask_str)
	if(head)
		wearer.equip_to_slot_or_del(new head(wearer),slot_head_str)
	if(l_ear)
		var/l_ear_path = (OUTFIT_ADJUSTMENT_PLAIN_HEADSET & equip_adjustments) && ispath(l_ear, /obj/item/radio/headset) ? /obj/item/radio/headset : l_ear
		wearer.equip_to_slot_or_del(new l_ear_path(wearer),slot_l_ear_str)
	if(r_ear)
		var/r_ear_path = (OUTFIT_ADJUSTMENT_PLAIN_HEADSET & equip_adjustments) && ispath(r_ear, /obj/item/radio/headset) ? /obj/item/radio/headset : r_ear
		wearer.equip_to_slot_or_del(new r_ear_path(wearer),slot_r_ear_str)
	if(glasses)
		wearer.equip_to_slot_or_del(new glasses(wearer),slot_glasses_str)
	if(id)
		wearer.equip_to_slot_or_del(new id(wearer),slot_wear_id_str)
	if(l_pocket)
		wearer.equip_to_slot_or_del(new l_pocket(wearer),slot_l_store_str)
	if(r_pocket)
		wearer.equip_to_slot_or_del(new r_pocket(wearer),slot_r_store_str)
	if(suit_store)
		wearer.equip_to_slot_or_del(new suit_store(wearer),slot_s_store_str)
	for(var/hand in hands)
		wearer.put_in_hands(new hand(wearer))

	if((outfit_flags & OUTFIT_HAS_BACKPACK) && !(OUTFIT_ADJUSTMENT_SKIP_BACKPACK & equip_adjustments))
		var/decl/backpack_outfit/bo
		var/metadata

		if(wearer.backpack_setup)
			bo = wearer.backpack_setup.backpack
			metadata = wearer.backpack_setup.metadata
		else
			bo = get_default_outfit_backpack()

		var/override_type = backpack_overrides[bo.type]
		var/backpack = bo.spawn_backpack(wearer, metadata, override_type)

		if(backpack)
			if(back)
				if(!wearer.put_in_hands(backpack))
					wearer.equip_to_appropriate_slot(backpack)
			else
				wearer.equip_to_slot_or_del(backpack, slot_back_str)

	var/decl/species/wearer_species = wearer.get_species()
	if(wearer_species && !(OUTFIT_ADJUSTMENT_SKIP_SURVIVAL_GEAR & equip_adjustments))
		var/decl/survival_box_option/chosen_survival_box = wearer?.client?.prefs.survival_box_choice
		if(chosen_survival_box?.box_type)
			if(outfit_flags & OUTFIT_EXTENDED_SURVIVAL)
				wearer_species.equip_survival_gear(wearer, /obj/item/box/engineer)
			else
				wearer_species.equip_survival_gear(wearer, chosen_survival_box.box_type)

	if(wearer.client?.prefs?.give_passport)
		global.using_map.create_passport(wearer)

/decl/outfit/proc/equip_id(mob/living/wearer, assignment, equip_adjustments, datum/job/job, datum/mil_rank/rank)
	if(!id_slot || !id_type)
		return
	if(OUTFIT_ADJUSTMENT_SKIP_ID_PDA & equip_adjustments)
		return
	var/obj/item/card/id/W = new id_type(wearer)
	if(id_desc)
		W.desc = id_desc
	if(assignment)
		W.assignment = assignment
	if(job)
		W.position = job.title
		LAZYDISTINCTADD(W.access, job.get_access())
		if(!W.detail_color)
			W.detail_color = job.selection_color
			W.update_icon()
	wearer.update_icon()
	wearer.set_id_info(W)
	equip_pda(wearer, id_pda_assignment || assignment, equip_adjustments)
	if(wearer.equip_to_slot_or_store_or_drop(W, id_slot))
		return W

/decl/outfit/proc/equip_pda(var/mob/living/wearer, var/label_assignment, var/equip_adjustments)
	if(!pda_slot || !pda_type)
		return
	if(OUTFIT_ADJUSTMENT_SKIP_ID_PDA & equip_adjustments)
		return
	var/obj/item/modular_computer/pda/pda = new pda_type(wearer)
	pda.set_owner_rank_job(wearer.real_name, label_assignment)
	if(wearer.equip_to_slot_or_store_or_drop(pda, pda_slot))
		return pda

/decl/outfit/dd_SortValue()
	return name
