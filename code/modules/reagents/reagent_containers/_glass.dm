
////////////////////////////////////////////////////////////////////////////////
/// (Mixing)Glass.
////////////////////////////////////////////////////////////////////////////////
/obj/item/chems/glass
	name = ""
	desc = ""
	icon_state = "null"
	item_state = "null"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = @"[5,10,15,25,30,60]"
	volume = 60
	w_class = ITEM_SIZE_SMALL
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	obj_flags = OBJ_FLAG_HOLLOW
	material = /decl/material/solid/glass
	abstract_type = /obj/item/chems/glass
	drop_sound = 'sound/foley/bottledrop1.ogg'
	pickup_sound = 'sound/foley/bottlepickup1.ogg'
	watertight = FALSE // /glass uses the open container flag for this

/obj/item/chems/glass/proc/get_atoms_can_be_placed_into()
	var/static/list/_can_be_placed_into = list(
		/obj/machinery/chem_master/,
		/obj/machinery/chemical_dispenser,
		/obj/machinery/reagentgrinder,
		/obj/structure/table,
		/obj/structure/closet,
		/obj/structure/hygiene/sink,
		/obj/item/grenade/chem_grenade,
		/mob/living/bot/medbot,
		/obj/item/secure_storage/safe,
		/obj/structure/iv_drip,
		/obj/machinery/disposal,
		/mob/living/simple_animal/cow,
		/mob/living/simple_animal/hostile/goat,
		/obj/machinery/sleeper,
		/obj/machinery/smartfridge/,
		/obj/machinery/biogenerator,
		/obj/machinery/constructable_frame,
		/obj/machinery/radiocarbon_spectrometer,
		/obj/machinery/material_processing/extractor
	)
	return _can_be_placed_into

/obj/item/chems/glass/examine(mob/user, distance)
	. = ..()
	if(distance > 2)
		return

	if(reagents?.total_volume)
		to_chat(user, SPAN_NOTICE("It contains [reagents.total_volume] units of reagents."))
	else
		to_chat(user, SPAN_NOTICE("It is empty."))
	if(!ATOM_IS_OPEN_CONTAINER(src))
		to_chat(user,SPAN_NOTICE("The airtight lid seals it completely."))

/obj/item/chems/glass/proc/can_lid()
	return TRUE

/obj/item/chems/glass/attack_self()
	. = ..()
	if(!. && can_lid())
		if(ATOM_IS_OPEN_CONTAINER(src))
			to_chat(usr, SPAN_NOTICE("You put the lid on \the [src]."))
			atom_flags ^= ATOM_FLAG_OPEN_CONTAINER
		else
			to_chat(usr, SPAN_NOTICE("You take the lid off \the [src]."))
			atom_flags |= ATOM_FLAG_OPEN_CONTAINER
		update_icon()

/obj/item/chems/glass/use_on_mob(mob/living/target, mob/living/user, animate = TRUE)
	if(get_attack_force(user) && !(item_flags & ITEM_FLAG_NO_BLUDGEON) && user.a_intent == I_HURT)
		return ..()
	return FALSE

/obj/item/chems/glass/afterattack(var/obj/target, var/mob/user, var/proximity)
	if(!ATOM_IS_OPEN_CONTAINER(src) || !proximity) //Is the container open & are they next to whatever they're clicking?
		return FALSE //If not, do nothing.
	if(target?.storage)
		return TRUE
	for(var/type in get_atoms_can_be_placed_into()) //Is it something it can be placed into?
		if(istype(target, type))
			return TRUE
	if(standard_dispenser_refill(user, target)) //Are they clicking a water tank/some dispenser?
		return TRUE
	if(standard_pour_into(user, target)) //Pouring into another beaker?
		return TRUE
	if(handle_eaten_by_mob(user, target) != EATEN_INVALID)
		return TRUE
	if(user.a_intent == I_HURT)
		if(standard_splash_mob(user,target))
			return TRUE
		if(reagents && reagents.total_volume)
			to_chat(user, SPAN_DANGER("You splash the contents of \the [src] onto \the [target]."))
			reagents.splash(target, reagents.total_volume)
			return TRUE
	else if(reagents && reagents.total_volume)
		to_chat(user, SPAN_NOTICE("You splash a small amount of the contents of \the [src] onto \the [target]."))
		reagents.splash(target, min(reagents.total_volume, 5))
		return TRUE
	. = ..()

// Drinking out of bowls.
/obj/item/chems/glass/attack_self(mob/user)
	if(is_edible(user) && handle_eaten_by_mob(user, user) != EATEN_INVALID)
		return TRUE
	return ..()

/obj/item/chems/glass/can_lid()
	return FALSE

/obj/item/chems/glass/get_food_default_transfer_amount(mob/eater)
	return eater?.get_eaten_transfer_amount(amount_per_transfer_from_this)

/obj/item/chems/glass/get_food_consumption_method(mob/eater)
	return EATING_METHOD_DRINK

/obj/item/chems/glass/get_edible_material_amount(mob/eater)
	return reagents?.total_volume

/obj/item/chems/glass/get_utensil_food_type()
	return /obj/item/food/lump

// Interaction code borrowed from /food.
// Should we consider moving this down to /chems for any open container? Medicine from a bottle using a spoon, etc.
/obj/item/chems/glass/attackby(obj/item/used_item, mob/living/user)

	if(ATOM_IS_OPEN_CONTAINER(src))
		if(istype(used_item, /obj/item/food))
			if(!reagents?.total_volume)
				to_chat(user, SPAN_WARNING("\The [src] is empty."))
				return TRUE
			var/transferring = min(get_food_default_transfer_amount(user), REAGENTS_FREE_SPACE(used_item.reagents))
			if(!transferring)
				to_chat(user, SPAN_WARNING("You cannot dip \the [used_item] in \the [src]."))
				return TRUE
			reagents.trans_to_holder(used_item.reagents, transferring)
			user.visible_message(SPAN_NOTICE("\The [user] dunks \the [used_item] in \the [src]."))
			return TRUE
		var/obj/item/utensil/utensil = used_item
		if(istype(utensil) && (utensil.utensil_flags & UTENSIL_FLAG_SCOOP))
			if(utensil.loaded_food)
				to_chat(user, SPAN_WARNING("You already have something on \the [utensil]."))
				return TRUE
			if(!reagents?.total_volume)
				to_chat(user, SPAN_WARNING("\The [src] is empty."))
				return TRUE
			seperate_food_chunk(utensil, user)
			if(utensil.loaded_food?.reagents?.total_volume)
				to_chat(user, SPAN_NOTICE("You scoop up some of \the [utensil.loaded_food.reagents.get_primary_reagent_name()] with \the [utensil]."))
			return TRUE
	return ..()

/obj/structure/glass/get_alt_interactions(mob/user)
	. = ..()
	if(reagents?.total_volume >= FLUID_PUDDLE)
		LAZYADD(., /decl/interaction_handler/dip_item)
		LAZYADD(., /decl/interaction_handler/fill_from)
	if(user?.get_active_held_item())
		LAZYADD(., /decl/interaction_handler/empty_into)
