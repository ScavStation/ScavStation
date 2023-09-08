var/global/list/junk_piles = list()

/obj/item/trash/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/trash) && isturf(loc))
		if(locate(/obj/structure/junkpile) in loc)
			to_chat(user, SPAN_WARNING("There is already a junk pile here, no need to make another one."))
			return TRUE
		if(user.try_unequip(W))
			var/obj/structure/junkpile/hoard = new(get_turf(src))
			W.forceMove(hoard)
			forceMove(hoard)
			hoard.update_icon()
			to_chat(user, SPAN_NOTICE("You pile \the [W] and \the [src] together, starting a new pile of junk."))
		return TRUE
	. = ..()

/obj/structure/junkpile
	name = "junk pile"
	desc = "A pile of trash and random junk."
	icon = 'icons/obj/trash.dmi'
	icon_state = "fisheggs"
	var/tmp/min_initial_junk = 0
	var/tmp/max_initial_junk = 0

/obj/structure/junkpile/mapped
	min_initial_junk = 3
	max_initial_junk = 5

/obj/structure/junkpile/Destroy()
	global.junk_piles -= src
	for(var/atom/movable/thing in contents)
		if(isturf(loc))
			thing.forceMove(loc)
		else
			qdel(thing)
	. = ..()

/obj/structure/junkpile/Initialize(ml)
	. = ..(ml)
	global.junk_piles += src
	if(min_initial_junk > 0)
		for(var/i = 1 to rand(min_initial_junk, max_initial_junk))
			new /obj/random/junk(src)
		update_icon()

/obj/structure/junkpile/attackby(obj/item/O, mob/user)
	if((O.w_class <= ITEM_SIZE_SMALL || istype(O, /obj/item/trash)) && user.try_unequip(O, src))
		to_chat(user, SPAN_NOTICE("You shove \the [O] into \the [src]."))
		update_icon()
		return TRUE
	. = ..()

/obj/structure/junkpile/attack_hand(mob/user)
	visible_message(SPAN_NOTICE("\The [user] begins rummaging around in \the [src]."))
	playsound(loc, 'sound/effects/rustle1.ogg', 100, 1)
	if(do_after(user, 1 SECOND, src) && !QDELETED(src))
		var/obj/item/grabbing = length(contents) && pick(contents)
		if(!grabbing)
			to_chat(user, SPAN_WARNING("You can't find anything worth taking from \the [src]."))
		else
			grabbing.dropInto(get_turf(src))
			user.put_in_hands(grabbing)
			to_chat(user, SPAN_NOTICE("You pull \a [grabbing] out of \the [src]."))
			if(length(contents) <= 1)
				for(var/obj/item/thing in contents)
					thing.dropInto(loc)
				qdel(src)
			else
				update_icon()
		return TRUE
	return ..()

/obj/structure/junkpile/on_update_icon()
	icon_state = "no_state"
	cut_overlays()
	for(var/obj/item/thing in contents)
		var/image/I = new /image
		I.appearance = thing
		I.layer = FLOAT_LAYER
		I.plane = FLOAT_PLANE
		I.appearance_flags |= RESET_COLOR
		if(prob(75))
			var/matrix/M = I.transform || matrix()
			M.Turn(pick(90, 180, 270))
			I.transform = M
		I.pixel_x = rand(-8, 8)
		I.pixel_y = rand(-8, 8)
		add_overlay(I)
