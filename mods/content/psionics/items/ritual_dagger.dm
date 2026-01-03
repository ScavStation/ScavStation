/obj/item/knife/ritual_psionic
	name = "ritual knife"
	desc = "An inscription upon its blade reads: 'Need It Never Be Used'"
	icon = 'icons/obj/items/weapon/knives/ritual.dmi'
	material_alteration = MAT_FLAG_ALTERATION_NONE
	var has_been_activated = FALSE

/obj/item/knife/ritual_psionic/get_autopsy_descriptors()
	. = ..()
	. += "curved"

/obj/item/knife/ritual_psionic/equipped(mob/living/user, slot)
	. = ..()
	if(!has_been_activated)
		has_been_activated = TRUE

		// add telepathy
		user.add_genetic_condition(/decl/genetic_condition/superpower/remotetalk)

		// set psi faculty and rank
		user.set_psi_rank(PSI_COERCION, PSI_RANK_OPERANT)
		var/datum/ability_handler/psionics/psi = user.get_ability_handler(/datum/ability_handler/psionics)
		psi.update()