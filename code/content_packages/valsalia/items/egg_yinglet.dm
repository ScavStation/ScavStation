//yinglet nests and yinglet eggs

//nest
/obj/structure/yinglet_nest
	name = "eggbed"
	icon = 'code/content_packages/valsalia/icons/egg_yinglet.dmi'
	icon_state = "base"
	w_class = ITEM_SIZE_HUGE
	var/has_egg = TRUE

/obj/structure/yinglet_nest/empty
	has_egg = FALSE

/obj/structure/yinglet_nest/Initialize()
	. = ..()
	if(has_egg)
		new /obj/item/yinglet_egg(src)
	update_icon()
	update_desc()

/obj/structure/yinglet_nest/proc/update_desc()
	desc = "A pile of plain but very soft fabric arranged to carefully hold an egg, as well as prevent the newly hatched younglet from smashing their face when they flop out."
	if(has_egg && contents.len)
		var/obj/item/I = locate() in contents
		desc += " There's \a [I] sitting in it."

/obj/structure/yinglet_nest/attack_hand(mob/user)
	. = ..()
	if(has_egg && user.a_intent == I_HELP && contents.len)
		var/obj/item/I = pick(contents)
		src.visible_message(SPAN_NOTICE("\The [user] pets \the [I]. Grow up big and strong now, okay?"))
		user.setClickCooldown(1.5 SECONDS)
		return
	if(has_egg && user.a_intent != I_HELP)
		remove_egg(user)
		return

/obj/structure/yinglet_nest/attackby(obj/item/object, mob/user)
	. = ..()
	if(object.w_class > ITEM_SIZE_NORMAL || istype(object, /obj/item/holder))
		to_chat(user, SPAN_WARNING("\The [object] is too big for the [name]!"))
		return
	else if(has_egg && contents.len)
		var/obj/item/I = locate() in contents
		if(I)
			to_chat(user, SPAN_WARNING("\The [name] already has \a [I] in it!"))
		return
	else if(!has_egg && object.w_class <= ITEM_SIZE_NORMAL)
		add_egg(object, user)
		return

/obj/structure/yinglet_nest/proc/remove_egg(mob/user)
	has_egg = FALSE
	var/obj/item/E = locate() in contents
	user.put_in_hands(E)
	src.visible_message(SPAN_WARNING("\The [user] takes \the [E] from the eggbed."))
	update_icon()
	update_desc()

/obj/structure/yinglet_nest/proc/add_egg(var/obj/item/egg, mob/user)
	has_egg = TRUE
	user.drop_from_inventory(egg)
	egg.forceMove(src)
	src.visible_message(SPAN_NOTICE("\The [user] puts \the [egg] in the eggbed."))
	update_icon()
	update_desc()

/obj/structure/yinglet_nest/on_update_icon()
	. = ..()
	overlays.Cut()
	if(contents.len)
		var/obj/item/I = locate() in contents
		overlays += image("icon" = I.icon, "icon_state" = I.icon_state, "layer" = STRUCTURE_LAYER)
	overlays += image("icon" = icon, "icon_state" = "base_overlay", "layer" = STRUCTURE_LAYER+0.1)

//egg
/obj/item/yinglet_egg
	name = "yinglet egg"
	desc = "A soft-shelled yinglet egg, currently at an early incubation stage. The miracle of life is beautiful, but some might consider it a goddamn nightmare factory."
	icon = 'code/content_packages/valsalia/icons/egg_yinglet.dmi'
	icon_state = "egg"

/obj/item/yinglet_egg/attack_self(mob/user)
	. = ..()
	if(user.a_intent == I_HELP)
		src.visible_message(SPAN_NOTICE("\The [user] pets \the [name]."))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
