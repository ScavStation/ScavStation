/obj/item/bladed/polearm/spear/improvised/attackby(obj/item/W, mob/user) // make a javelin from a spear
	. = ..()
	if(istype(W, /obj/item/wirecutters))
		visible_message(SPAN_NOTICE("[user] cuts off a length of \the [src], making it shorter."), blind_message = SPAN_NOTICE("You hear the snipping of wirecutters."))
		playsound(user.loc,'sound/items/Wirecutter.ogg', 100, 1)
		user.put_in_hands(new /obj/item/bladed/polearm/spear/improvised/javelin(get_turf(user), material.type))
		qdel(src)

/obj/item/bladed/polearm/spear/improvised/javelin //short spears for short folks; can be wielded two handed even when mob_small
	name = "javelin"
	desc = "A short spear good for throwing and okay for stabbing. Favoured by yinglets because they can wield it more easily than a longer spear."
	minimum_size_to_twohand = MOB_SIZE_SMALL
	_base_attack_force = 15

/datum/codex_entry/spear
	associated_paths = list(/obj/item/bladed/polearm/spear)
	associated_strings = list("spear","javelin")
	mechanics_text = "Spears are automatically held with two hands if the other hand is free to do so. Holding with both hands increases damage dealt. Using wirecutters on a spear turns it into a javelin, which can be held by small mobs and does more throwing damage, but less damage overall. \
	<BR><BR>You can start crafting a spear by making cable cuffs and applying them to a rod. After, examining the spear assembly will give details on how to proceed."
