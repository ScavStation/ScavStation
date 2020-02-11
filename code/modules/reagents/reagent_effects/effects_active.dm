/decl/chemical_effect/active
	has_effect = TRUE
	multiply_effect_by_removed = TRUE

/decl/chemical_effect/active/nutrition/apply_to(var/mob/living/target, var/power)
	. = ..()
	if(.)
		target.adjust_nutrition(power)

/decl/chemical_effect/active/hydration/apply_to(var/mob/living/target, var/power)
	. = ..()
	if(.)
		target.adjust_hydration(power)

/decl/chemical_effect/active/jittery/apply_to(mob/living/target, power)
	. = ..()
	if(.)
		target.make_jittery(power)

/decl/chemical_effect/active/immunity/apply_to(mob/living/carbon/target, power)
	. = ..()
	if(. && istype(target))
		target.adjust_immunity(power)
		if(power < 0 && prob(2))
			target.immunity_norm = max(target.immunity_norm - 1, 0)

/decl/chemical_effect/active/weaken/apply_to(mob/living/target, power)
	. = ..()
	if(. && target.stat == CONSCIOUS)
		target.AdjustWeakened(power)

/decl/chemical_effect/active/hallucinations/apply_to(mob/living/target, power)
	. = ..()
	if(. && islist(power))
		var/list/power_args = power
		target.adjust_hallucination(power_args[1], power_args[2])

/decl/chemical_effect/active/drugged/apply_to(mob/living/target, power)
	. = ..()
	if(.)
		target.druggy = max(power, target.druggy)