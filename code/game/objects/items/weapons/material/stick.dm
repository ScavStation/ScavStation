/obj/item/stick
	name = "stick"
	desc = "You feel the urge to poke someone with this."
	icon = 'icons/obj/items/stick.dmi'
	icon_state = ICON_STATE_WORLD
	w_class = ITEM_SIZE_NORMAL
	material = /decl/material/solid/organic/wood
	attack_verb = list("poked", "jabbed")
	material_alteration = MAT_FLAG_ALTERATION_ALL
	lock_picking_level = 3
	max_health = 20

/obj/item/stick/attack_self(mob/user)
	user.visible_message("<span class='warning'>\The [user] snaps [src].</span>", "<span class='warning'>You snap [src].</span>")
	shatter(0)

/obj/item/stick/attackby(obj/item/W, mob/user)

	if(W.sharp && W.edge && !sharp)
		user.visible_message("<span class='warning'>[user] sharpens [src] with [W].</span>", "<span class='warning'>You sharpen [src] using [W].</span>")
		sharp = 1 //Sharpen stick
		SetName("sharpened " + name)
		update_attack_force()
		return TRUE

	if(!sharp && (istype(W, /obj/item/stack/material/bolt) || istype(W, /obj/item/stack/material/bundle)))

		var/choice = input(user, "Do you want to make a torch, or a splint?", "Stick Crafting") as null|anything in list("Torch", "Splint")
		if(!choice || QDELETED(user) || user.get_active_held_item() != W || QDELETED(W) || !QDELETED(src) || (loc != user && !Adjacent(user)) || sharp)
			return TRUE

		var/obj/item/stack/material/cloth = W

		var/atom/product_type
		var/cloth_cost
		if(choice == "Splint")
			product_type = /obj/item/stack/medical/splint/crafted
			cloth_cost = 5
		else if(choice == "Torch")
			product_type = /obj/item/flame/torch
			cloth_cost = 3
		else
			return TRUE

		if(cloth.get_amount() < cloth_cost)
			to_chat(user, SPAN_WARNING("You need at least [cloth_cost] unit\s of material to create \a [initial(product_type.name)]."))
			return TRUE

		// Ugly way to check for dried grass vs regular grass.
		if(!cloth.special_crafting_check())
			return ..()

		var/was_held = (loc == user)
		cloth.use(cloth_cost)
		if(!was_held || user.try_unequip(src))
			var/obj/item/thing = new product_type(get_turf(src), material?.type, W.material?.type)
			if(was_held)
				user.put_in_hands(thing)
			to_chat(user, SPAN_NOTICE("You fashion \the [src] into \a [thing]."))
			qdel(src)
		return TRUE

	return ..()

/obj/item/stick/use_on_mob(mob/living/target, mob/living/user, animate = TRUE)
	if(user != target && user.a_intent == I_HELP)
		//Playful poking is its own thing
		user.visible_message(
			SPAN_NOTICE("\The [user] pokes \the [target] with \the [src]."),
			SPAN_NOTICE("You poke \the [target] with \the [src].")
		)
		//Consider adding a check to see if target is dead
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.do_attack_animation(target)
		return TRUE
	return ..()
