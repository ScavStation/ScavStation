// base parent file for all nanoTech devices

// building block of all nanotech related items
/decl/material/solid/nano_tech_serum
	name = "nanoserum"
	singular_name = "nanite swarm"
	desc = "A container of nanites that can be turned into ulimated possibility."
	icon = 'icons/obj/nanopaste.dmi'
	icon_state = "tube"
	origin_tech = @'{"materials":5,"engineering":5}'
	max_amount = 10
	amount = 10
	material = /decl/material/solid/metal/steel
	matter = list(/decl/material/solid/glass = MATTER_AMOUNT_REINFORCEMENT)

