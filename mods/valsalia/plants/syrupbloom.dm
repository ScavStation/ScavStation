// A berry-like plant whose fruit is packed with grape jelly rather than juice
#define SYRUPBLOOM_ICON 'mods/valsalia/icons/plants/syrup_bloom.dmi'

/datum/seed/syrupbloom
	name = "syrupbloom"
	product_name = "syrup bloom fruit"
	display_name = "syrup bloom bush"
	product_type = /obj/item/food/grown/syrupbloom
	chems = list(/decl/material/liquid/nutriment/grapejelly = list(2,10))
	grown_tag = "syrupbloom"
	slice_product = /obj/item/food/processed_grown/crushed
	slice_amount = 3
	allergen_flags = ALLERGEN_FRUIT

/datum/seed/syrupbloom/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_JUICY,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,15)
	set_trait(TRAIT_PRODUCT_ICON,"syrupbloom") // note: no underscore - matches the "syrupbloom-product" state, unlike the "syrup_bloom-N" growth states
	// TRAIT_PLANT_ICON intentionally left unset - it only matters to the base shared-sheet lookup,
	// which get_growth_stage_overlay()/get_dead_appearance() below bypass entirely.
	set_trait(TRAIT_WATER_CONSUMPTION, 6)

/datum/seed/syrupbloom/update_growth_stages()
	growth_stages = 4

/datum/seed/syrupbloom/get_growth_stage_overlay(growth_stage)
	return image(SYRUPBLOOM_ICON, "syrup_bloom-[growth_stage]")

/datum/seed/syrupbloom/get_dead_appearance()
	if(!dead_overlay)
		dead_overlay = image(SYRUPBLOOM_ICON, "syrup_bloom-dead")
	return dead_overlay

// Uses the bare state, not "-product" - that suffix is reserved for the carried item's own icon,
// this is just the ripe-fruit overlay shown on the plant itself while it's growing.
/datum/seed/syrupbloom/get_harvest_appearance()
	if(!harvest_overlay)
		harvest_overlay = image(SYRUPBLOOM_ICON, "syrup_bloom")
	return harvest_overlay

/obj/item/seeds/syrupbloomseed
	seed = "syrupbloom"
	icon = SYRUPBLOOM_ICON

/obj/item/seeds/syrupbloomseed/get_seed_packet_state()
	return "syrup_bloom_seed"

/obj/item/food/grown/syrupbloom
	seed = "syrupbloom"
	icon = SYRUPBLOOM_ICON

#undef SYRUPBLOOM_ICON
