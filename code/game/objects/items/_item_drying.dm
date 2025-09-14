// Stubs/vars for use with the drying rack.
/obj/item
	// Reduced when exposed to high temperatures or put on a drying rack. When hitting zero, the item transitions to a dried state.
	var/drying_wetness
	// Temperature threshold for fire_act() to dry the object, in degrees Kelvin.
	var/drying_threshold_temperature = 500
	// If set to a type, drying this item will convert it to that type.
	var/dried_type
	// Set if colour should be passed to dried product.
	var/dried_product_takes_color = TRUE

/obj/item/proc/is_dryable()
	return drying_wetness > 0

/obj/item/proc/get_dried_product()
	return new dried_type(loc)

/obj/item/stack/get_dried_product()
	if(ispath(dried_type, /obj/item/stack))
		return new dried_type(loc, amount)
	return ..()

// Returns null for no change, or an instance for a successful drying.
/obj/item/proc/dry_out(var/obj/rack, var/drying_power = 1, var/fire_exposed = FALSE, var/silent = FALSE)

	if(!dried_type || !is_dryable())
		return

	if(drying_wetness > 0)
		drying_wetness -= drying_power
		if(drying_wetness > 0)
			return

	var/obj/item/thing = get_dried_product()
	if(!thing)
		return

	if(color && dried_product_takes_color)
		thing.color = color
	if(isturf(loc) && !silent)
		visible_message(SPAN_NOTICE("\The [src] [gender == PLURAL ? "are" : "is"] dry!"))
	if(thing != src)
		qdel(src)
	return thing

/obj/item/proc/get_max_drying_wetness()
	return initial(drying_wetness) || drying_wetness || 1

// Returns a string used in drying rack examine().
/obj/item/proc/get_dryness_text(var/obj/rack)
	var/moistness = drying_wetness / get_max_drying_wetness()
	if(moistness > 0.65)
		return "wet"
	if(moistness > 0.35)
		return "damp"
	if(moistness)
		return "almost dry"
	return "dry"

// Returns an icon_state used by drying rack update_icon().
/obj/item/proc/get_drying_overlay(var/obj/rack)
	var/drying_state = get_drying_state(rack)
	if(!drying_state || !color)
		return drying_state
	var/image/drying_overlay = image('icons/obj/drying_rack.dmi', drying_state)
	drying_overlay.color = color
	drying_overlay.alpha = alpha
	drying_overlay.appearance_flags |= KEEP_APART | RESET_COLOR | RESET_ALPHA
	return drying_overlay

/obj/item/proc/get_drying_state(var/obj/rack)
	return "generic"

/obj/item/proc/should_take_heat_damage(datum/gas_mixture/air, exposed_temperature)
	if(!can_take_damage())
		return FALSE
	if(!length(matter))
		return FALSE
	for(var/mat in matter)
		var/decl/material/material = GET_DECL(mat)
		// We should burn if we're above the temperature damage threshold.
		if(!isnull(material.temperature_damage_threshold) && exposed_temperature >= material.temperature_damage_threshold)
			return TRUE
	return FALSE

/obj/item/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	..()

	var/should_burn = should_take_heat_damage(air, exposed_temperature)

	if(exposed_temperature >= drying_threshold_temperature)
		dry_out(drying_power = rand(2, 4), fire_exposed = TRUE, silent = TRUE)
		should_burn &&= !is_dryable() // no fire damage if we're drying

	// Take fire damage if appropriate.
	if(should_burn)
		take_damage(rand(3,5), BURN)
