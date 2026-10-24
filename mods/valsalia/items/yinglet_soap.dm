// Yinglet soap, its soap but burns mobs who are not yinglet when used on them
// since parent class is soap, acts like soap still. Just adds check to see if yinglet or not

#define YINGLET_SOAP_TOX_PER_USE 5

/obj/item/soap/yinglet
	name = "yinglet soap"
	desc = "A gritty mixture of something yinglets use for soap. Toxicly cleansing"
	icon = 'mods/valsalia/icons/items/yinglet_soap.dmi'
	icon_state = ICON_STATE_WORLD
	material = /decl/material/liquid/cleaner/soap

// Keep the fixed name/desc/icon; don't randomise icon like other soap
/obj/item/soap/yinglet/generate_icon()
	return

/obj/item/soap/yinglet/proc/is_yinglet(mob/living/target)
	return istype(target) && target.get_species_name() == SPECIES_YINGLET

/obj/item/soap/yinglet/use_on_mob(mob/living/target, mob/living/user, animate = TRUE)
	// Non-hurt intent on a mob that isn't a yinglet = tox damage
	if(istype(target) && user?.a_intent != I_HURT && !is_yinglet(target))
		if(reagents?.total_volume < 1)
			to_chat(user, SPAN_WARNING("\The [src] is too dry to work up a lather."))
			return TRUE
		user.visible_message(
			SPAN_DANGER("\The [user] scrubs \the [target] with \the [src], raising an angry, burning rash!"),
			SPAN_WARNING("You scrub \the [target] with \the [src]. This lather isn't meant for them.")
		)
		to_chat(target, SPAN_DANGER("\The [src] burns where it touches you!"))
		target.apply_damage(YINGLET_SOAP_TOX_PER_USE, TOX)
		reagents.trans_to(target, reagents.total_volume / 8)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN) // prevent spam
		return TRUE
	return ..()

#undef YINGLET_SOAP_TOX_PER_USE
