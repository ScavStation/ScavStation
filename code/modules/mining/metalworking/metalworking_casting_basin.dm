/obj/structure/metalworking/casting_basin
	name = "casting basin"
	desc = "A heavy, flat basin for holding molds during metal casting."
	icon_state = "casting_basin"
	anchored = TRUE
	density =  TRUE
	var/obj/item/mold/holding_mold

/obj/structure/metalworking/casting_basin/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/mold))
		if(holding_mold)
			to_chat(user, SPAN_WARNING("\The [src] is already holding a mold."))
		else
			user.drop_from_inventory(O)
			O.forceMove(src)
			holding_mold = O
			user.visible_message(SPAN_NOTICE("\The [user] sets \the [O] atop \the [src]."))
			update_icon()
		return
	if(holding_mold)
		return holding_mold.attackby(O, user)
	. = ..()
	
/obj/structure/metalworking/casting_basin/attack_hand(mob/user)
	if(!holding_mold)
		to_chat(user, SPAN_WARNING("There is no mold atop \the [src] to remove."))
	else
		holding_mold.forceMove(get_turf(user))
		user.put_in_hands(holding_mold)
		user.visible_message(SPAN_NOTICE("\The [user] retrieves \the [holding_mold] from \the [src]."))
		holding_mold = null
		update_icon()
	
/obj/structure/metalworking/casting_basin/on_update_icon()
	var/new_overlay
	if(holding_mold)
		var/image/I = new
		I.appearance = holding_mold
		I.plane = FLOAT_PLANE
		I.layer = FLOAT_LAYER
		I.pixel_x = 0
		I.pixel_y = 0
		I.pixel_w = 0
		I.pixel_z = 4
		new_overlay = list(I)
	overlays = new_overlay
