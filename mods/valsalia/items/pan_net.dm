/obj/item/pan_net
	name = "panning net"
	desc = "A shallow net stretched over a wooden frame, used for sifting silt and gravel from a riverbed in search of anything valuable."
	icon = 'mods/valsalia/icons/pan_net.dmi'
	icon_state = "world"
	material = /decl/material/solid/organic/wood
	material_alteration = MAT_FLAG_ALTERATION_COLOR | MAT_FLAG_ALTERATION_NAME | MAT_FLAG_ALTERATION_DESC
	w_class = ITEM_SIZE_SMALL

	var/panning_time = 4 SECONDS
	var/panning_in_progress = FALSE

	// Chance, out of 100, that a pan comes up empty.
	var/panning_fail_prob = 55

	// Odds of which category of find comes up on a successful pan. Tune freely.
	var/list/panning_categories = list(
		"fish"    = 10,
		"mollusc" = 25,
		"ore"     = 20,
		"trinket" = 5
	)

	var/list/fish_results = list(
		/mob/living/simple_animal/aquatic/fish       = 1,
		/mob/living/simple_animal/aquatic/fish/grump = 1
	)
	var/list/mollusc_results = list(
		/obj/item/mollusc                      = 1,
		/obj/item/mollusc/barnacle/fished      = 1,
		/obj/item/mollusc/clam/fished/pearl    = 1,
		/obj/item/trash/mollusc_shell/clam     = 1,
		/obj/item/trash/mollusc_shell/barnacle = 1
	)
	// Ore results roll a material from this list rather than a type.
	var/list/ore_materials = list(
		/decl/material/solid/stone/granite = 1,
		/decl/material/solid/stone/basalt  = 1,
		/decl/material/solid/metal/iron    = 1,
		/decl/material/solid/metal/copper  = 1,
		/decl/material/solid/metal/gold    = 1
	)
	var/list/trinket_results = list(
		/obj/item/clothing/gloves/ring/engagement = 1,
		/obj/item/clothing/neck/necklace          = 1,
		/obj/item/bladed/shortsword               = 1,
		/obj/item/bladed/poignard                 = 1,
		/obj/item/bladed/polearm/spear/improvised = 1,
		/obj/item/paper/scroll/pan_net_find       = 1,
		/obj/item/pan_net_find/river_reeds        = 1
	)

/obj/item/pan_net/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag || !isturf(target))
		return ..()

	var/turf/river = target
	if(!river.submerged())
		to_chat(user, SPAN_WARNING("The water isn't deep enough to pan here."))
		return TRUE

	if(panning_in_progress)
		to_chat(user, SPAN_WARNING("You're already panning with \the [src]!"))
		return TRUE

	if(!length(user.get_empty_hand_slots()))
		to_chat(user, SPAN_WARNING("You need a free hand to pan with \the [src]!"))
		return TRUE

	panning_in_progress = TRUE
	user.visible_message(
		SPAN_NOTICE("\The [user] dips \the [src] into \the [river.get_fluid_name()] and begins sifting."),
		SPAN_NOTICE("You dip \the [src] into \the [river.get_fluid_name()] and begin sifting.")
	)
	playsound(river, 'sound/effects/watersplash.ogg', 25, 1)

	var/success = do_after(user, panning_time, river, check_holding = TRUE)
	panning_in_progress = FALSE

	if(!success || QDELETED(user) || QDELETED(river) || user.get_active_held_item() != src)
		return TRUE

	produce_pan_result(river, user)
	return TRUE

/obj/item/pan_net/proc/produce_pan_result(turf/river, mob/user)
	playsound(river, 'sound/effects/slosh.ogg', 25, 1)

	if(prob(panning_fail_prob))
		to_chat(user, SPAN_NOTICE("You sift through the silt, but find nothing of use."))
		return

	switch(pickweight(panning_categories))
		if("fish")
			var/result_type = pickweight(fish_results)
			if(!result_type)
				return
			// Live catches can't be held, so toss them out of the water instead - behind the user if there's room, otherwise off to the side.
			var/turf/behind_turf = get_step(user, turn(user.dir, 180))
			var/turf/landing_turf = (behind_turf && !behind_turf.density) ? behind_turf : null
			if(!landing_turf)
				var/turf/side_turf = get_step(user, turn(user.dir, 90))
				if(side_turf && !side_turf.density)
					landing_turf = side_turf
				else
					side_turf = get_step(user, turn(user.dir, -90))
					if(side_turf && !side_turf.density)
						landing_turf = side_turf
			if(!landing_turf)
				landing_turf = river

			var/atom/movable/result = new result_type(landing_turf)
			if(landing_turf == behind_turf)
				to_chat(user, SPAN_NOTICE("You catch \a [result] in \the [src] and toss it onto the ground behind you!"))
			else if(landing_turf == river)
				to_chat(user, SPAN_NOTICE("You catch \a [result] in \the [src]!"))
			else
				to_chat(user, SPAN_NOTICE("You catch \a [result] in \the [src] and toss it onto the ground beside you!"))
			if(ismob(result))
				var/mob/caught = result
				SET_STATUS_MAX(caught, STAT_STUN, 3)

		if("mollusc")
			var/result_type = pickweight(mollusc_results)
			if(!result_type)
				return
			var/obj/item/result = new result_type(river)
			to_chat(user, SPAN_NOTICE("You scoop \a [result] out of the silt!"))
			give_catch(result, user)

		if("ore")
			var/ore_material = pickweight(ore_materials)
			if(!ore_material)
				return
			var/obj/item/stack/material/ore/result = new(river, rand(1, 3), ore_material)
			to_chat(user, SPAN_NOTICE("You sift \a [result] free from the riverbed!"))
			give_catch(result, user)

		if("trinket")
			var/result_type = pickweight(trinket_results)
			if(!result_type)
				return
			var/obj/item/result = new result_type(river)
			to_chat(user, SPAN_NOTICE("Something catches your eye in the net - \a [result]!"))
			give_catch(result, user)

/obj/item/pan_net/proc/give_catch(obj/item/result, mob/user)
	if(!user.put_in_hands(result))
		to_chat(user, SPAN_WARNING("Your hands fill up before you can grab \a [result], and it falls back into the water!"))

// Misc. loot findable via pan_net's trinket table.
/obj/item/pan_net_find
	abstract_type = /obj/item/pan_net_find

/obj/item/pan_net_find/river_reeds
	name = "tangle of river reeds"
	desc = "A dripping clump of reeds and waterweed, pulled up along with everything else."
	icon = 'icons/obj/items/passport.dmi' // placeholder art
	icon_state = "passport"
	material = /decl/material/solid/organic/wood
	w_class = ITEM_SIZE_SMALL

/obj/item/paper/scroll/pan_net_find
	name = "waterlogged scrap"
	desc = "A scrap of parchment, soft with age and river water. Faint scribbles are still legible."

/obj/item/paper/scroll/pan_net_find/Initialize(mapload, material_key, _text, _title, list/md)
	var/static/list/possible_scribbles = list(
		"...the elders speak lies, the river remembers...",
		"three stones north, beneath the leaning tree...",
		"do not trust the tradehouse surveyor...",
		"if found, return to no one...",
		"the daughter knows the way through the reeds...",
		"beware the thing beneath the water..."
	)
	_text = pick(possible_scribbles)
	return ..(mapload, material_key, _text, _title, md)
