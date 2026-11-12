//Ventcrawl is now a modpack. For compatibility, give ventcrawl verbs to modpack mobs that require it in this file.
/mob/living/simple_animal/passive/ivenmoth/Initialize()
	. = ..()
	verbs += /mob/living/proc/ventcrawl