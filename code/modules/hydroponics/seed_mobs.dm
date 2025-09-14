// The following procs are used to grab players for mobs produced by a seed.
/datum/seed/proc/handle_living_product(var/mob/living/host)
	if(!host || !istype(host)) return

	var/decl/ghosttrap/P = GET_DECL(/decl/ghosttrap/sentient_plant)
	P.request_player(host, "Someone is harvesting \a [display_name].", 15 SECONDS)

	spawn(15 SECONDS)
		if(!host.ckey && !host.client)
			host.death()  // This seems redundant, but a lot of mobs don't
			host.set_stat(DEAD) // handle death() properly. Better safe than etc.
			host.visible_message("<span class='danger'>\The [host] is malformed and unable to survive. It expires pitifully, leaving behind some seeds.</span>")

			var/total_yield = rand(1,3)
			for(var/j = 0;j<=total_yield;j++)
				new /obj/item/seeds(get_turf(host), null, name)
