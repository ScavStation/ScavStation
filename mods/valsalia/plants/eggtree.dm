// Grows like an eggplant, but the fruit itself is used as an egg substitute in cooking.
#define EGGTREE_ICON 'mods/valsalia/icons/plants/eggtree.dmi'

/datum/seed/eggtree
	name = "eggtree"
	product_name = "eggtree fruit"
	display_name = "eggtree plant"
	product_material = /decl/material/solid/organic/bone/eggshell
	product_type = /obj/item/food/grown/eggtree
	chems = list(/decl/material/solid/organic/meat/egg = list(2,10))
	grown_tag = "eggtree"

/datum/seed/eggtree/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,2)
	set_trait(TRAIT_POTENCY,20)
	set_trait(TRAIT_PRODUCT_ICON,"eggtree")
	set_trait(TRAIT_PRODUCT_COLOUR,"#ffffff") // no-op tint - the art is already fully coloured
	// TRAIT_PLANT_ICON intentionally left unset - it only matters to the base shared-sheet lookup,
	// which get_growth_stage_overlay()/get_dead_appearance() below bypass entirely.
	set_trait(TRAIT_IDEAL_HEAT, 298)
	set_trait(TRAIT_IDEAL_LIGHT, 7)

/datum/seed/eggtree/update_growth_stages()
	growth_stages = 4

/datum/seed/eggtree/get_growth_stage_overlay(growth_stage)
	return image(EGGTREE_ICON, "eggtree-[growth_stage]")

/datum/seed/eggtree/get_dead_appearance()
	if(!dead_overlay)
		dead_overlay = image(EGGTREE_ICON, "eggtree-dead")
	return dead_overlay

/datum/seed/eggtree/get_harvest_appearance()
	if(!harvest_overlay)
		harvest_overlay = image(EGGTREE_ICON, "eggtree-product")
	return harvest_overlay

/obj/item/seeds/eggtreeseed
	seed = "eggtree"
	icon = EGGTREE_ICON

/obj/item/seeds/eggtreeseed/get_seed_packet_state()
	return "eggtree_seed"

/obj/item/food/grown/eggtree
	seed = "eggtree"
	icon = EGGTREE_ICON
	obj_flags = OBJ_FLAG_HOLLOW

#undef EGGTREE_ICON

// Lets the fruit be cracked into an open container like a real egg, same as /obj/item/food/egg
/obj/item/food/grown/eggtree/afterattack(atom/target, mob/user, proximity)
	if(proximity && !istype(target, /obj/machinery/microwave) && ATOM_IS_OPEN_CONTAINER(target))
		to_chat(user, "You crack \the [src] into \the [target].")
		reagents.trans_to(target, reagents.total_volume)
		qdel(src)
		return
	. = ..()
