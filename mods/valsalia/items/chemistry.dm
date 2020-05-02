/decl/reagent/nutriment/slime_meat/affect_overdose(var/mob/living/carbon/M, var/alien)
	if(alien == IS_YINGLET)
		M.reagents.add_reagent(/decl/reagent/psychoactives, 0.1)

/decl/reagent/nutriment/slime_meat/affect_ingest(var/mob/living/carbon/human/M, var/alien, var/removed)
	if(alien == IS_YINGLET)
		nutriment_factor = 12
		M.add_chemical_effect(CE_PAINKILLER, 15)
	else
		nutriment_factor = initial(nutriment_factor)
	. = ..()

/decl/reagent/nutriment/bread/on_mob_life(var/mob/living/carbon/human/M, var/alien, var/location)
	if(istype(M) && alien == IS_YINGLET) 
		// Yings do not process bread or breadlike substances well.
		ingest_met =       0.1 // Make sure there's something to 
		touch_met =        0.1 // throw up when we inevitably puke.
		nutriment_factor = 0.1 // Don't get much nutrition out of it either.
		. = ..()
		// Reset in case somehow the reagent is processed outside again.
		ingest_met =       initial(ingest_met)
		touch_met =        initial(touch_met)
		nutriment_factor = initial(nutriment_factor)
	else
		// Process as normal.
		. = ..()

/decl/reagent/nutriment/bread/affect_ingest(var/mob/living/carbon/human/M, var/alien, var/removed)
	if(istype(M) && alien == IS_YINGLET && prob(ying_puke_prob) && !M.lastpuke)
		to_chat(M, SPAN_WARNING("Your gut churns as it struggles to digest \the [lowertext(name)]..."))
		M.vomit(timevomit = 3)
		return
	. = ..()

/decl/reagent/nutriment/bread
	var/ying_puke_prob = 35

/decl/reagent/nutriment/bread/cake
	ying_puke_prob = 15

/decl/reagent/nutriment/soggy_food
	name = "soggy food"
	taste_description = "blandness"

/datum/chemical_reaction/recipe/soggy_food
	name = "Soggy Bread"
	result = /decl/reagent/nutriment/soggy_food
	required_reagents = list(/decl/reagent/nutriment/bread = 1)
	result_amount = 1
	mix_message = "The food softens into a soggy mess."
	hidden_from_codex = TRUE
	var/global/list/can_make_soggy = list(
		/decl/reagent/drink,
		/decl/reagent/ethanol,
		/decl/reagent/water
	)

/datum/chemical_reaction/recipe/soggy_food/can_happen(datum/reagents/holder)
	. = ..()
	if(.)
		for(var/thing in can_make_soggy)
			for(var/rtype in holder.reagent_volumes)
				if(ispath(rtype, thing))
					return TRUE
		return FALSE

/datum/chemical_reaction/recipe/soggy_food/on_reaction(datum/reagents/holder, created_volume, reaction_flags)
	. = ..()
	var/obj/item/chems/food/snacks/food = holder ? holder.my_atom : null
	if(!QDELETED(food) && istype(food) && !findtext(lowertext(food.name), "soggy"))
		food.name = "soggy [food.name]"

/datum/chemical_reaction/recipe/soggy_food/cake
	name = "Soggy Cake"
	required_reagents = list(/decl/reagent/nutriment/bread/cake = 1)

/decl/reagent/drink/mutagencola
	description = "The energy of a yinglet in beverage form. Effects on yinglets undocumented."
	taste_description = "the lifespan of a scav"
	glass_desc = "The unstable energy of a yinglet in beverage form. Effects on yinglets undocumented."

