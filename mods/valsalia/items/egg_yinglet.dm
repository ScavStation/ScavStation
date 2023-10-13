//yinglet nests and yinglet eggs

//nest
/obj/structure/yinglet_nest
	name = "eggbed"
	icon = 'mods/valsalia/icons/egg_yinglet.dmi'
	icon_state = "base"
	w_class = ITEM_SIZE_HUGE
	var/atom/movable/egg = /obj/item/yinglet_egg

/obj/structure/yinglet_nest/empty
	egg = null

/obj/structure/yinglet_nest/Initialize()
	. = ..()
	if(egg)
		if(ispath(egg))
			egg = new egg(src)
		else
			egg = null
	update_icon()
	update_desc()

/obj/structure/yinglet_nest/proc/update_desc()
	desc = "A pile of plain but very soft fabric arranged to carefully hold an egg, as well as prevent the newly hatched younglet from smashing their face when they flop out."
	if(egg)
		desc += " There's \a [egg] sitting in it."

/obj/structure/yinglet_nest/attack_hand(mob/user)
	. = ..()
	if(egg)
		if(user.a_intent == I_HELP)
			user.setClickCooldown(1.5 SECONDS)
			visible_message(SPAN_NOTICE("\The [user] pets \the [egg]. Grow up big and strong now, okay?"))
		else
			remove_egg(user)
		return TRUE

/obj/structure/yinglet_nest/attackby(obj/item/object, mob/user)
	if(egg)
		to_chat(user, SPAN_WARNING("\The [name] already has \a [egg] in it!"))
		return TRUE
	if(object.w_class > ITEM_SIZE_NORMAL || istype(object, /obj/item/holder))
		to_chat(user, SPAN_WARNING("\The [object] is too big for the [name]!"))
		return TRUE
	if(object.w_class <= ITEM_SIZE_NORMAL)
		add_egg(object, user)
		return TRUE
	. = ..()

/obj/structure/yinglet_nest/proc/remove_egg(mob/user)
	if(!egg)
		return
	egg.dropInto(loc)
	user.put_in_hands(egg)
	visible_message(SPAN_WARNING("\The [user] takes \the [egg] from \the [src]."))
	egg = null
	update_icon()
	update_desc()

/obj/structure/yinglet_nest/proc/add_egg(var/obj/item/new_egg, mob/user)
	if(egg)
		return
	user.drop_from_inventory(new_egg)
	new_egg.forceMove(src)
	visible_message(SPAN_NOTICE("\The [user] puts \the [new_egg] in \the [src]."))
	egg = new_egg
	update_icon()
	update_desc()

/obj/structure/yinglet_nest/on_update_icon()
	. = ..()
	var/list/new_overlays
	if(egg)
		var/image/I = new
		I.appearance = egg
		I.appearance_flags |= RESET_COLOR
		I.pixel_x = 0
		I.pixel_y = 0
		I.pixel_z = 0
		I.pixel_w = 0
		I.plane = plane
		I.layer = layer
		LAZYADD(new_overlays, I)
	var/image/I = image(icon = icon, icon_state = "base_overlay")
	I.appearance_flags |= RESET_COLOR
	I.layer = layer + 0.01
	LAZYADD(new_overlays, I)
	overlays = new_overlays

//egg
/obj/item/yinglet_egg
	name = "yinglet egg"
	desc = "A soft-shelled yinglet egg, currently at an early incubation stage. The miracle of life is beautiful, but some might consider it a goddamn nightmare factory."
	icon = 'mods/valsalia/icons/egg_yinglet.dmi'
	icon_state = "egg"
	health = 20 // fragile
	max_health = 20

/obj/item/yinglet_egg/attack_self(mob/user)
	if(user.a_intent == I_HELP)
		src.visible_message(SPAN_NOTICE("\The [user] pets \the [name]."))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		return TRUE
	return ..()