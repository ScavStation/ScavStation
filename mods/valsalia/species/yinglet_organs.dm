/obj/item/organ/internal/eyes/yinglet
	relative_size = 15
	eye_blend = ICON_MULTIPLY
	eye_icon = 'mods/valsalia/icons/species/yinglet/eyes.dmi'

// Copied from vox stomach, upstream Baycode.
/obj/item/organ/internal/stomach/yinglet
	name = "scav stomach"
	var/static/list/gains_nutriment_from_inedible_reagents = list(
		/decl/material/solid/wood =           3,
		/decl/material/liquid/anfo/plus =     2,
		/decl/material/liquid/anfo =          1,
		/decl/material/liquid/lube =          1,
		/decl/material/liquid/cleaner =       1,
		/decl/material/liquid/foaming_agent = 1,
		/decl/material/liquid/surfactant =    1,
		/decl/material/liquid/paint =         1
	)
	var/static/list/gains_nutriment_from_matter = list(
		/decl/material/solid/wood =           TRUE,
		/decl/material/solid/wood/mahogany =  TRUE,
		/decl/material/solid/wood/maple =     TRUE,
		/decl/material/solid/wood/ebony =     TRUE,
		/decl/material/solid/wood/walnut =    TRUE,
		/decl/material/solid/leather =        TRUE,
		/decl/material/solid/plastic =        TRUE,
		/decl/material/solid/cardboard =      TRUE,
		/decl/material/solid/cloth =          TRUE,
		/decl/material/solid/sodiumchloride = TRUE
	)

/obj/item/organ/internal/stomach/yinglet/Process()
	. = ..()
	if(!is_usable())
		return
	// Handle some post-metabolism reagent processing for generally inedible foods.
	var/total_nutriment = 0
	if(ingested.total_volume > 0)
		for(var/R in ingested.reagent_volumes)
			total_nutriment += gains_nutriment_from_inedible_reagents[R]
	for(var/obj/item/food in contents)
		for(var/mat in food.matter)
			if(!gains_nutriment_from_matter[mat])
				continue
			var/digested = min(food.matter[mat], rand(200,500))
			food.matter[mat] -= digested
			digested *= 0.75
			if(food.matter[mat] <= 0)
				food.matter -= mat
			if(!LAZYLEN(food.matter))
				qdel(food)
			total_nutriment += digested/100
	// Apply to reagents.
	total_nutriment = FLOOR(total_nutriment)
	if(total_nutriment > 0 && owner)
		owner.adjust_nutrition(total_nutriment)

/obj/item/organ/external/chest/yinglet
	max_damage = 45
	min_broken_damage = 25

/obj/item/organ/external/groin/yinglet
	max_damage = 45
	min_broken_damage = 25

/obj/item/organ/external/head/yinglet
	max_damage = 45
	min_broken_damage = 25

/obj/item/organ/external/arm/yinglet
	max_damage = 25
	min_broken_damage = 15

/obj/item/organ/external/arm/right/yinglet
	max_damage = 25
	min_broken_damage = 15

/obj/item/organ/external/leg/yinglet
	max_damage = 25
	min_broken_damage = 15

/obj/item/organ/external/leg/right/yinglet
	max_damage = 25
	min_broken_damage = 15

/obj/item/organ/external/hand/yinglet
	max_damage = 20
	min_broken_damage = 10

/obj/item/organ/external/hand/right/yinglet
	max_damage = 20
	min_broken_damage = 10

/obj/item/organ/external/foot/yinglet
	max_damage = 20
	min_broken_damage = 10

/obj/item/organ/external/foot/right/yinglet
	max_damage = 20
	min_broken_damage = 10
