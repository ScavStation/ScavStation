// Medicine to preserve brains during extraction and transfer to a new body. While in a living host, provides brain healing (CE_BRAIN_REGEN).
// When injected directly into a removed brain via syringe, the reagent flags is_preserved() TRUE, blocking the standard organ decay loop until the reagent is consumed.
/decl/material/liquid/neuroannealer_plus
	name = "neuroannealer plus"
	lore_text = "A neuroplasticity-assisting compound that helps to keep the brain in a healthy state for medical extractions."
	taste_description = "bitterness"
	color = "#ffff66"
	metabolism = REM * 0.25
	overdose = REAGENTS_OVERDOSE
	scannable = 1
	flags = IGNORE_MOB_SIZE
	value = 1.5
	exoplanet_rarity_gas = MAT_RARITY_EXOTIC
	uid = "chem_neuroannealer_plus"

/decl/material/liquid/neuroannealer_plus/affect_blood(var/mob/living/M, var/removed, var/datum/reagents/holder)
	. = ..()
	M.add_chemical_effect(CE_PAINKILLER, 10)
	M.add_chemical_effect(CE_BRAIN_REGEN, 1)
	if(ishuman(M))
		var/mob/living/human/H = M
		ADJ_STATUS(H, STAT_CONFUSE, 1)
		ADJ_STATUS(H, STAT_DROWSY, 1)

/decl/chemical_reaction/drug/neuroannealer_plus
	name = "Neuroannealer Plus"
	result = /decl/material/liquid/neuroannealer_plus
	required_reagents = list(/decl/material/liquid/neuroannealer = 1, /decl/material/liquid/antiseptic = 1, /decl/material/liquid/oxy_meds = 1)
	result_amount = 1

// Extends preservation check so a brain injected with neuroannealer plus won't decay
// while being carried to the clone machine, and so it stops decaying once it's actually
// loaded in a clone machine which is useful if removing the head only as you can't directly inject the brain
/obj/item/organ/internal/brain/is_preserved()
	if(reagents?.has_reagent(/decl/material/liquid/neuroannealer_plus))
		return TRUE
	var/atom/container = loc
	while(istype(container, /obj/item/organ))
		container = container.loc
	if(istype(container, /obj/machinery/cloning/clone_machine))
		return TRUE
	return ..()

//==============================================================================

/obj/item/stock_parts/circuitboard/clone_machine
	name = "circuitboard (clone machine)"
	build_path = /obj/machinery/cloning/clone_machine
	board_type = "machine"
	req_components = list(
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/manipulator = 1
	)
	additional_spawn_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/apc/buildable = 1
	)

// Makes the circuitboard above printable at a circuit imprinter, same as any other buildable machine
/datum/fabricator_recipe/imprinter/circuit/clone_machine
	path = /obj/item/stock_parts/circuitboard/clone_machine

#define CM_IDLE 0
#define CM_BUILDING 1

/obj/machinery/cloning/clone_machine
	name = "clone machine"
	desc = "A vat of biological machinery that constructs a blank body from raw organic material."
	icon = 'mods/cloning/icons/cloning.dmi'
	icon_state = "pod_0"
	layer = OBJ_LAYER
	density = TRUE
	anchored = TRUE
	base_type = /obj/machinery/cloning/clone_machine

	idle_power_usage = 10
	active_power_usage = 150
	construct_state = /decl/machine_construction/default/panel_closed
	uncreated_component_parts = null
	var/stored_meat = 0
	var/required_meat = 250
	var/state = CM_IDLE
	// Two accepted genetic samples, mutually exclusive:
	// First option is a bare removed brain (combined with neuroannealer_plus preservation reagent above, since it's a syringeable object).
	// Clones full cosmetics via its organ_appearance snapshot, which /obj/item/organ/internal/ brain/do_uninstall() now refreshes
	// from the owner right before removal (core code change required outside of mod, utilized code from borers).
	// The other option is a severed head with the brain and eyes still inside. Its own  skin_colour/skin_tone/sprite accessory
	// vars are live and always current, so this clones full cosmetics too, and works even for brains removed before that
	// do_uninstall core code change was made, however the brain no longer being syringeable for neuroannealer_plus while it's carried around means it can decay quickly.
	var/obj/item/organ/internal/brain/stored_brain = null
	var/obj/item/organ/external/head/stored_head = null
	var/brain_donor_name = null

/obj/machinery/cloning/clone_machine/Initialize()
	. = ..()
	update_icon()

/obj/machinery/cloning/clone_machine/on_update_icon()
	cut_overlays()
	if(state == CM_BUILDING)
		icon_state = "pod_1"
		add_overlay(image(icon, icon_state = "pod_g"))
	else
		icon_state = "pod_0"

/obj/machinery/cloning/clone_machine/attackby(var/obj/item/I, var/mob/user)
	if(state == CM_BUILDING)
		to_chat(user, SPAN_WARNING("\The [src] is already building a body."))
		return TRUE

	if(istype(I, /obj/item/organ/external/head))
		var/obj/item/organ/external/head/HD = I
		var/obj/item/organ/internal/brain/B = locate() in HD.internal_organs
		if(!B)
			to_chat(user, SPAN_WARNING("\The [HD] has no brain to clone from."))
			return TRUE
		if(stored_brain || stored_head)
			to_chat(user, SPAN_WARNING("\The [src] already has a genetic sample loaded."))
			return TRUE
		if(user.try_unequip(HD, src))
			stored_head = HD
			brain_donor_name = "Unknown"
			for(var/mob/living/brain/BM in B)
				brain_donor_name = BM.real_name
				break
			if(brain_donor_name == "Unknown")
				brain_donor_name = B.organ_appearance?.real_name || "Unknown"
			to_chat(user, SPAN_NOTICE("You load \the [HD] into \the [src]. It will be returned when cloning is complete."))
			updateUsrDialog()
		return TRUE

	if(istype(I, /obj/item/organ/internal/brain))
		var/obj/item/organ/internal/brain/B = I
		if(stored_brain || stored_head)
			to_chat(user, SPAN_WARNING("\The [src] already has a genetic sample loaded."))
			return TRUE
		if(!B.organ_appearance)
			to_chat(user, SPAN_WARNING("\The [B] has no identity data to clone from."))
			return TRUE
		if(user.try_unequip(B, src))
			stored_brain = B
			brain_donor_name = "Unknown"
			for(var/mob/living/brain/BM in B)
				brain_donor_name = BM.real_name
				break
			if(brain_donor_name == "Unknown")
				brain_donor_name = B.organ_appearance?.real_name || "Unknown"
			to_chat(user, SPAN_NOTICE("You load \the [B] into \the [src]. It will be returned when cloning is complete."))
			updateUsrDialog()
		return TRUE

	if(istype(I, /obj/item/food/butchery) || istype(I.material, /decl/material/solid/organic/meat))
		var/meat_amount = get_meat_matter_amount(I)
		if(meat_amount <= 0)
			to_chat(user, SPAN_WARNING("\The [I] doesn't have enough usable biomass for \the [src]."))
			return TRUE
		stored_meat += meat_amount
		to_chat(user, SPAN_NOTICE("You feed \the [I] into \the [src]. ([stored_meat]/[required_meat])"))
		qdel(I)
		updateUsrDialog()
		return TRUE

	. = ..()

// Weighs contribution by actual meat content similar to how bioprinter material-storage system weighs feedstock by quantity.
/obj/machinery/cloning/clone_machine/proc/get_meat_matter_amount(var/obj/item/I)
	if(istype(I, /obj/item/food/butchery))
		var/obj/item/food/butchery/meat = I
		return meat.nutriment_amt
	. = 0
	var/list/contained = I.get_contained_matter()
	for(var/mat_type in contained)
		var/decl/material/mat_decl = GET_DECL(mat_type)
		if(istype(mat_decl, /decl/material/solid/organic/meat))
			. += contained[mat_type]

/obj/machinery/cloning/clone_machine/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	user.set_machine(src)
	var/list/data = list()
	data["state"] = state
	data["stored_meat"] = stored_meat
	data["required_meat"] = required_meat
	data["has_brain"] = !isnull(stored_brain) || !isnull(stored_head)
	data["brain_name"] = brain_donor_name
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "clone_machine.tmpl", "Clone Machine", 400, 200)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/cloning/clone_machine/OnTopic(user, href_list)
	switch(href_list["action"])
		if("start")
			if(state == CM_IDLE && stored_meat >= required_meat && (stored_brain || stored_head))
				stored_meat -= required_meat
				state = CM_BUILDING
				update_icon()
				SSnano.update_uis(src)
				visible_message(SPAN_NOTICE("\The [src] shudders and begins growing a body for [brain_donor_name]."))
				addtimer(CALLBACK(src, PROC_REF(finish_build)), 60 SECONDS)
		if("eject")
			if((stored_brain || stored_head) && state == CM_IDLE)
				if(stored_brain)
					stored_brain.dropInto(loc)
					stored_brain = null
				if(stored_head)
					stored_head.dropInto(loc)
					stored_head = null
				brain_donor_name = null
	return TOPIC_REFRESH

/obj/machinery/cloning/clone_machine/interface_interact(mob/user)
	ui_interact(user)
	return TRUE

/obj/machinery/cloning/clone_machine/proc/finish_build()
	state = CM_IDLE
	update_icon()
	SSnano.update_uis(src)

	// Note: we can't pass a supplied appearance into the /mob/living/human constructor directly, setup_human() overwrites its
	// species_name arg with supplied_appearance.root_species whenever an appearance is supplied,
	// which makes set_species() fail to resolve it and crash, leaving a broken/organless mob. So build bare and patch up ourselves.
	var/mob/living/human/H = new /mob/living/human(get_turf(src))

	// Species/bodytype: prefer live data off the head if we have one, else fall back to the brain's snapshot
	var/decl/species/donor_species = stored_head?.species || stored_brain?.organ_appearance?.root_species
	var/decl/bodytype/donor_bodytype = stored_head?.bodytype || stored_brain?.organ_appearance?.root_bodytype
	if(donor_species)
		// set_species()/change_species() both no-op if the mob's current species already
		// matches, which would otherwise skip bodytype/gender correction for same-species clones
		if(H.get_species_name() == donor_species.name)
			if(donor_bodytype)
				H.set_bodytype(donor_bodytype)
		else
			H.change_species(donor_species.name, donor_bodytype)
	else
		H.set_species(SPECIES_HUMAN)

	if(stored_head)
		H.set_skin_colour(stored_head.skin_colour, skip_update = TRUE)

		var/obj/item/organ/external/head/new_head = GET_EXTERNAL_ORGAN(H, BP_HEAD)
		if(new_head)
			new_head.skin_colour = stored_head.skin_colour
			new_head.skin_tone = stored_head.skin_tone
			var/list/sprite_accessories = stored_head.get_sprite_accessories()
			for(var/category in sprite_accessories)
				var/list/marklist = sprite_accessories[category]
				for(var/accessory in marklist)
					new_head.set_sprite_accessory(accessory, null, marklist[accessory], skip_update = TRUE)

			// Swap in the donor's actual brain (preserving damage/implants) and eyes
			var/obj/item/organ/internal/brain/existing_brain = GET_INTERNAL_ORGAN(H, BP_BRAIN)
			if(existing_brain)
				existing_brain.transfer_brainmob_with_organ = FALSE
				H.remove_organ(existing_brain, FALSE)
				qdel(existing_brain)
			var/obj/item/organ/internal/eyes/existing_eyes = GET_INTERNAL_ORGAN(H, BP_EYES)
			if(existing_eyes)
				H.remove_organ(existing_eyes, FALSE)
				qdel(existing_eyes)

			var/obj/item/organ/internal/brain/donor_brain = locate() in stored_head.internal_organs
			if(donor_brain)
				LAZYREMOVE(stored_head.internal_organs, donor_brain)
				H.add_organ(donor_brain, new_head)
			var/obj/item/organ/internal/eyes/donor_eyes = locate() in stored_head.internal_organs
			if(donor_eyes)
				LAZYREMOVE(stored_head.internal_organs, donor_eyes)
				H.add_organ(donor_eyes, new_head)
	else if(stored_brain)
		// Layer on skin/eye colour, skin tone, etc (hair,facial hair, markings, tattoos) from the refreshed snapshot
		stored_brain.organ_appearance?.apply_appearance_to(H)

		var/obj/item/organ/internal/brain/existing_brain = GET_INTERNAL_ORGAN(H, BP_BRAIN)
		if(existing_brain)
			existing_brain.transfer_brainmob_with_organ = FALSE
			H.remove_organ(existing_brain, FALSE)
			qdel(existing_brain)
		var/obj/item/organ/external/head = GET_EXTERNAL_ORGAN(H, BP_HEAD)
		H.add_organ(stored_brain, head)
		stored_brain = null

	if(brain_donor_name && brain_donor_name != "Unknown")
		H.real_name = brain_donor_name
		H.SetName(brain_donor_name)

	QDEL_NULL(stored_head)
	brain_donor_name = null

	H.force_update_limbs()
	H.update_hair()
	H.update_icon()
	visible_message(SPAN_NOTICE("\The [src] opens with a wet hiss — a body for [H.real_name] has been extruded."))
