/decl/chemical_effect
	var/has_effect = FALSE                 // If TRUE, apply_to() is called on mobs during Life().
	var/has_cumulative_effects = TRUE      // If TRUE, effects from multiple chems are additive rather than assuming the highest. 
	var/multiply_effect_by_removed = FALSE // If TRUE, power of effect will be multiplied by amount metabolized.

/decl/chemical_effect/proc/apply_to(var/mob/living/target, var/power)
	. = istype(target) && isnum(power)