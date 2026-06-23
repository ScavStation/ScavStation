/obj/item/chems/drinks/cans/panacea
	name = "\improper Panacea"
	desc = "A shimmering liquid that smells faintly of miracles. One sip is all it takes."
	icon_state = "cola"
	center_of_mass = @'{"x":16,"y":10}'

/obj/item/chems/drinks/cans/panacea/attack_self(mob/user)
	if(!ATOM_IS_OPEN_CONTAINER(src))
		return open(user)
	var/mob/living/L = user
	if(!istype(L))
		return
	to_chat(L, SPAN_NOTICE("You drink \the [src] in one gulp. A warm feeling washes over you — you feel completely restored!"))
	L.revive()
	qdel(src)
