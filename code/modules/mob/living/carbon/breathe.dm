#define MOB_BREATH_DELAY 2
/mob/living/carbon/should_breathe()
	return ((life_tick - last_breath_tick >= MOB_BREATH_DELAY) || failed_last_breath || is_asystole())

/mob/living/carbon/try_breathe()
	last_breath_tick = life_tick
	return ..()
