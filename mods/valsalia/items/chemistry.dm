/decl/trait/gluten_allergy
	name = "Gluten Allergy"
	description = "You derive less nutrition from bread, and will vomit it up."

/decl/trait/mollusc_lover
	name = "Mollusc Lover"
	description = "You greatly enjoy molluscs, deriving a lot of nutrition from them, and can even experience a 'clam high'."

/decl/material/liquid/nutriment/slime_meat
	overdose = 5
	melting_point = 223
	boiling_point = 473
	color = "#517a54"

/decl/material/solid/organic/meat/Initialize()
	liquid_name = name  // avoid 'molten meat'
	return ..()

/decl/material/liquid/nutriment/slime_meat/affect_overdose(var/mob/living/M, var/datum/reagents/holder)
	var/decl/species/our_species = M.get_species()
	if((/decl/trait/mollusc_lover in our_species.traits) || M.has_trait(/decl/trait/mollusc_lover))
		M.reagents.add_reagent(/decl/material/liquid/psychoactives, 0.1)

/decl/material/liquid/nutriment/slime_meat/affect_ingest(var/mob/living/M, var/removed, var/datum/reagents/holder)
	var/decl/species/our_species = M.get_species()
	if((/decl/trait/mollusc_lover in our_species.traits) || M.has_trait(/decl/trait/mollusc_lover))
		nutriment_factor = 12
		M.add_chemical_effect(CE_PAINKILLER, 15)
	else
		nutriment_factor = initial(nutriment_factor)
	. = ..()

// This is an appalingly bad way to handle per-species values but it is being inherited from
// a pre-decl reagent system - will need to rewrite nutriment to pass these values into data
// to do it properly, long-term TODO.
/decl/material/liquid/nutriment/bread/on_mob_life(var/mob/living/M, var/location, var/datum/reagents/holder)
	var/decl/species/our_species = M.get_species()
	if(ishuman(M) && ((/decl/trait/gluten_allergy in our_species.traits) || M.has_trait(/decl/trait/gluten_allergy)))
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

/decl/material/liquid/nutriment/bread/affect_ingest(var/mob/living/M, var/removed, var/datum/reagents/holder)
	var/decl/species/our_species = M.get_species()
	if(ishuman(M) && ((/decl/trait/gluten_allergy in our_species.traits) || M.has_trait(/decl/trait/gluten_allergy)) && prob(ying_puke_prob))
		var/mob/living/human/H = M
		if(!H.lastpuke)
			to_chat(M, SPAN_WARNING("Your gut churns as it struggles to digest \the [lowertext(name)]..."))
			H.vomit(timevomit = 3)
			return
	. = ..()

/decl/material/liquid/nutriment/bread
	var/ying_puke_prob = 35

/decl/material/liquid/nutriment/bread/cake
	ying_puke_prob = 15

/decl/material/liquid/nutriment/soggy_food
	name = "soggy food"
	taste_description = "blandness"
	uid = "chem_nutriment_soggy"

/decl/chemical_reaction/recipe/soggy_food
	name = "Soggy Bread"
	result = /decl/material/liquid/nutriment/soggy_food
	required_reagents = list(/decl/material/liquid/nutriment/bread = 1)
	result_amount = 1
	mix_message = "The food softens into a soggy mess."
	// To avoid interfering with the stuffing reaction.
	inhibitors = list(
		/decl/material/solid/sodiumchloride,
		/decl/material/solid/blackpepper,
	)
	hidden_from_codex = TRUE
	var/static/list/can_make_soggy = list(
		/decl/material/liquid/drink,
		/decl/material/liquid/alcohol,
		/decl/material/liquid/water
	)

/decl/chemical_reaction/recipe/soggy_food/can_happen(datum/reagents/holder)
	. = ..()
	if(.)
		for(var/thing in can_make_soggy)
			for(var/rtype in holder.reagent_volumes)
				if(ispath(rtype, thing))
					return TRUE
		return FALSE

/decl/chemical_reaction/recipe/soggy_food/on_reaction(datum/reagents/holder, created_volume, reaction_flags)
	. = ..()
	var/obj/item/food/food = holder ? holder.my_atom : null
	if(!QDELETED(food) && istype(food) && !findtext(lowertext(food.name), "soggy"))
		food.name = "soggy [food.name]"

/decl/chemical_reaction/recipe/soggy_food/cake
	name = "Soggy Cake"
	required_reagents = list(/decl/material/liquid/nutriment/bread/cake = 1)

/decl/material/liquid/drink/mutagencola
	lore_text = "The energy of a yinglet in beverage form. Effects on yinglets undocumented."
	taste_description = "the lifespan of a scav"
	glass_desc = "The unstable energy of a yinglet in beverage form. Effects on yinglets undocumented."

