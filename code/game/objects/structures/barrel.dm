/obj/structure/reagent_dispensers/barrel
	name                      = "barrel"
	desc                      = "A stout barrel for storing large amounts of liquids or substances."
	icon                      = 'icons/obj/structures/barrel.dmi'
	icon_state                = ICON_STATE_WORLD
	anchored                  = TRUE
	atom_flags                = ATOM_FLAG_CLIMBABLE
	matter                    = null
	material                  = /decl/material/solid/organic/wood
	color                     = /decl/material/solid/organic/wood::color
	material_alteration       = MAT_FLAG_ALTERATION_COLOR | MAT_FLAG_ALTERATION_NAME | MAT_FLAG_ALTERATION_DESC
	wrenchable                = FALSE
	storage                   = /datum/storage/barrel
	amount_dispensed          = 10
	possible_transfer_amounts = @"[10,25,50,100]"
	volume                    = 7500
	movable_flags             = MOVABLE_FLAG_WHEELED
	throwpass                 = TRUE
	tool_interaction_flags    = TOOL_INTERACTION_ANCHOR | TOOL_INTERACTION_DECONSTRUCT

/obj/structure/reagent_dispensers/barrel/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

// Overrides due to wonky reagent_dispeners opencontainer flag handling.
/obj/structure/reagent_dispensers/barrel/can_be_poured_from(mob/user, atom/target)
	return (reagents?.maximum_volume > 0)
/obj/structure/reagent_dispensers/barrel/can_be_poured_into(mob/user, atom/target)
	return (reagents?.maximum_volume > 0)
// Override to skip open container check.
/obj/structure/reagent_dispensers/barrel/can_drink_from(mob/user)
	return reagents?.total_volume && user.check_has_mouth()

/obj/structure/reagent_dispensers/barrel/get_alt_interactions(mob/user)
	. = ..()
	if(reagents?.total_volume >= FLUID_PUDDLE)
		LAZYADD(., /decl/interaction_handler/dip_item)
		LAZYADD(., /decl/interaction_handler/fill_from)
	if(user?.get_active_held_item())
		LAZYADD(., /decl/interaction_handler/empty_into)

/obj/structure/reagent_dispensers/barrel/LateInitialize(mapload, ...)
	..()
	if(mapload)
		for(var/obj/item/thing in loc)
			if(!thing.simulated || thing.anchored)
				continue
			if(storage.can_be_inserted(thing, null))
				storage.handle_item_insertion(null, thing)

/obj/structure/reagent_dispensers/barrel/on_reagent_change()
	if(!(. = ..()) || QDELETED(src))
		return
	var/primary_mat = reagents?.get_primary_reagent_name()
	if(primary_mat)
		update_material_name("[initial(name)] of [primary_mat]")
	else
		update_material_name()
	update_icon()

/obj/structure/reagent_dispensers/barrel/on_update_icon()
	. = ..()
	if(ATOM_IS_OPEN_CONTAINER(src))
		if(reagents)
			var/overlay_amount = NONUNIT_CEILING(reagents.total_liquid_volume / reagents.maximum_volume * 100, 10)
			var/image/filling_overlay = overlay_image(icon, "[icon_state]-[overlay_amount]", reagents.get_color(), RESET_COLOR | RESET_ALPHA)
			add_overlay(filling_overlay)
		add_overlay(overlay_image(icon, "[icon_state]-lidopen", material?.color, RESET_COLOR))
	else
		add_overlay(overlay_image(icon, "[icon_state]-lidclosed", material?.color, RESET_COLOR))

/obj/structure/reagent_dispensers/barrel/ebony
	material = /decl/material/solid/organic/wood/ebony
	color = /decl/material/solid/organic/wood/ebony::color

/obj/structure/reagent_dispensers/barrel/ebony/water/populate_reagents()
	. = ..()
	add_to_reagents(/decl/material/liquid/water, reagents.maximum_volume)

/obj/structure/reagent_dispensers/barrel/ebony/beer/populate_reagents()
	. = ..()
	add_to_reagents(/decl/material/liquid/ethanol/beer, reagents.maximum_volume)

/obj/structure/reagent_dispensers/barrel/ebony/wine/populate_reagents()
	. = ..()
	add_to_reagents(/decl/material/liquid/ethanol/wine, reagents.maximum_volume)

/obj/structure/reagent_dispensers/barrel/ebony/oil/populate_reagents()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/plant_oil, reagents.maximum_volume)
