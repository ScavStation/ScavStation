/obj/item/chems/drinks/healthy_healthy_juice
	name = "\improper Healthy Healthy Juice"
	desc = "A garish bottle of off-brand juice that promises to cure whatever ails you. One sip is all it takes."
	icon = 'mods/valsalia/icons/items/healthy_healthy_juice.dmi'
	icon_state = ICON_STATE_WORLD
	center_of_mass = @'{"x":16,"y":10}' // TODO: re-check against the new sprite.
	/// Seconds spent administering the Healthy Healthy Juice to someone else.
	var/feed_delay = 3 SECONDS

/obj/item/chems/drinks/healthy_healthy_juice/attack_self(mob/user)
	return use_on_mob(user, user)

// Handles both drinking it yourself and pouring it into someone who can't.
/obj/item/chems/drinks/healthy_healthy_juice/use_on_mob(mob/living/target, mob/living/user, animate = TRUE)
	if(!istype(target))
		return ..()
	if(!user.can_force_feed(target, src)) // mouth not covered; handles the self case too
		return TRUE

	if(user != target)
		user.visible_message(
			SPAN_NOTICE("\The [user] tips \the [src] to \the [target]'s lips."),
			SPAN_NOTICE("You tip \the [src] to \the [target]'s lips.")
		)
		if(!do_mob(user, target, feed_delay) || QDELETED(src))
			return TRUE
		if(!user.can_force_feed(target, src))
			return TRUE
		admin_attack_log(user, target, "Administered \a [src] to the victim.", "Was given \a [src].", "used \a [src] on")
		user.visible_message(
			SPAN_NOTICE("\The [user] pours \the [src] into \the [target]'s mouth. Colour floods back into \the [target] as the last drop goes down."),
			SPAN_NOTICE("You pour \the [src] into \the [target]'s mouth.")
		)
		to_chat(target, SPAN_NOTICE("A warm feeling washes over you — you feel completely restored!"))
	else
		to_chat(user, SPAN_NOTICE("You drink \the [src] in one gulp. A warm feeling washes over you — you feel completely restored!"))

	target.revive()
	qdel(src)
	return TRUE
