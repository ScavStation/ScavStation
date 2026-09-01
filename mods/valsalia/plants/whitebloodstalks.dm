// A pale, mushroom-like fungus. Its sap is toxic to most people, but yinglets handle it
// like the "clam high" that leaves them stuttering
#define WHITEBLOODSTALK_ICON 'mods/valsalia/icons/plants/white_blood_stalk.dmi'

/decl/material/liquid/whiteblood_toxin
	name = "milky sap"
	uid = "chem_whiteblood_toxin"
	lore_text = "A thin, milky sap drawn from white blood stalks. Wholesome to yinglet biology, but toxic to almost anyone else."
	taste_description = "bitterness"
	color = "#e8e8e8"
	toxicity = 6
	overdose = REAGENTS_OVERDOSE
	value = 2

/decl/material/liquid/whiteblood_toxin/proc/is_yinglet(mob/living/M)
	if(!ishuman(M))
		return FALSE
	var/mob/living/human/H = M
	return istype(H.species, /decl/species/yinglet)

/decl/material/liquid/whiteblood_toxin/affect_blood(mob/living/M, removed, datum/reagents/holder)
	if(is_yinglet(M))
		// yinglets get high, not poison.
		var/cached_toxicity = toxicity
		toxicity = 0
		. = ..()
		toxicity = cached_toxicity
		SET_STATUS_MAX(M, STAT_DRUGGY, 15)
		SET_STATUS_MAX(M, STAT_STUTTER, 10)
		M.add_chemical_effect(CE_PULSE, -1)
		return
	. = ..()

/decl/material/liquid/whiteblood_toxin/is_unsafe_to_drink(mob/user)
	return !is_yinglet(user)

/datum/seed/mushroom/whitebloodstalk
	name = "whitebloodstalk"
	product_name = "white blood stalk"
	display_name = "white blood stalk patch"
	mutants = null
	product_type = /obj/item/food/grown/whitebloodstalk
	chems = list(/decl/material/liquid/whiteblood_toxin = list(2,10))
	grown_tag = "whitebloodstalk"

/datum/seed/mushroom/whitebloodstalk/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,8)
	set_trait(TRAIT_YIELD,2)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"whiteblood_stalk")
	// TRAIT_PLANT_ICON intentionally left unset - it only matters to the base shared-sheet lookup,
	// which get_growth_stage_overlay()/get_dead_appearance() below bypass entirely.

/datum/seed/mushroom/whitebloodstalk/update_growth_stages()
	growth_stages = 4

/datum/seed/mushroom/whitebloodstalk/get_growth_stage_overlay(growth_stage)
	return image(WHITEBLOODSTALK_ICON, "whiteblood_stalk-[growth_stage]")

/datum/seed/mushroom/whitebloodstalk/get_dead_appearance()
	if(!dead_overlay)
		dead_overlay = image(WHITEBLOODSTALK_ICON, "whiteblood_stalk-dead")
	return dead_overlay

/datum/seed/mushroom/whitebloodstalk/get_harvest_appearance()
	if(!harvest_overlay)
		harvest_overlay = image(WHITEBLOODSTALK_ICON, "whiteblood_stalk-product")
	return harvest_overlay

/obj/item/seeds/whitebloodstalkseed
	seed = "whitebloodstalk"
	icon = WHITEBLOODSTALK_ICON

/obj/item/seeds/whitebloodstalkseed/get_seed_packet_state()
	return "whiteblood_stalk_seed"

/obj/item/food/grown/whitebloodstalk
	seed = "whitebloodstalk"
	icon = WHITEBLOODSTALK_ICON

#undef WHITEBLOODSTALK_ICON
