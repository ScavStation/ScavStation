/mob/living/simple_animal/frog
	name = "green frog"
	desc = "A small, slimy amphibian. Likes to eat flies."
	icon = 'icons/mob/simple_animal/frog_green.dmi'
	speak_emote = list("ribbits","croaks")
	emote_speech = list("Ribbit!","Riiibit!")
	emote_hear = list("ribbits","croaks")
	emote_see = list("hops","inflates its vocal sac","catches a fly with its tongue")
	response_harm = "stamps on"
	density = FALSE
	holder_type = /obj/item/holder
	mob_size = MOB_SIZE_MINISCULE
	max_health = 5
	butchery_data = /decl/butchery_data/animal/small/frog
	speak_chance = 0.5

/mob/living/simple_animal/frog/brown
	name = "brown frog"
	icon = 'icons/mob/simple_animal/frog_brown.dmi'

/mob/living/simple_animal/frog/yellow
	name = "yellow frog"
	icon = 'icons/mob/simple_animal/frog_yellow.dmi'
