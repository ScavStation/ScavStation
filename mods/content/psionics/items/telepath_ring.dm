/obj/item/clothing/gloves/ring/seal/telepath_ring
	name = "A Brass Inscripted Ring"
	desc = "Together Forever, in This Universe and the Next"
	icon = 'icons/clothing/accessories/jewelry/rings/ring_seal_masonic.dmi'
	material = /decl/material/solid/metal/brass
	var/has_been_activated = FALSE

/obj/item/clothing/gloves/ring/seal/telepath_ring/equipped(mob/living/user, slot)
	. = ..()
	if(!has_been_activated)
		has_been_activated = TRUE

		// add telepathy and remove view
		user.add_genetic_condition(/decl/genetic_condition/superpower/remotetalk)
		user.add_genetic_condition(/decl/genetic_condition/superpower/remoteview)