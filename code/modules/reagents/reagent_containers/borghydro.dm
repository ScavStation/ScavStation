/obj/item/chems/borghypo
	name = "cyborg hypospray"
	desc = "An advanced chemical synthesizer and injection system, designed for heavy-duty medical equipment."
	icon = 'icons/obj/hypospray_borg.dmi'
	amount_per_transfer_from_this = 5
	volume = 30
	possible_transfer_amounts = null
	max_health = ITEM_HEALTH_NO_DAMAGE

	var/mode = 1
	var/charge_cost = 50
	var/charge_tick = 0
	var/recharge_time = 5 //Time it takes for shots to recharge (in seconds)

	var/list/reagent_ids = list(/decl/material/liquid/regenerator, /decl/material/liquid/stabilizer, /decl/material/liquid/antibiotics)
	var/list/reagent_volumes = list()
	var/list/reagent_names = list()

/obj/item/chems/borghypo/surgeon
	reagent_ids = list(
		/decl/material/liquid/brute_meds,
		/decl/material/liquid/oxy_meds,
		/decl/material/liquid/painkillers/strong
	)

/obj/item/chems/borghypo/crisis
	reagent_ids = list(
		/decl/material/liquid/regenerator,
		/decl/material/liquid/stabilizer,
		/decl/material/liquid/painkillers/strong
	)

/obj/item/chems/borghypo/Initialize()
	. = ..()

	for(var/T in reagent_ids)
		reagent_volumes[T] = volume
		var/decl/material/R = T
		reagent_names += initial(R.name)

/obj/item/chems/borghypo/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/chems/borghypo/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/chems/borghypo/Process() //Every [recharge_time] seconds, recharge some reagents for the cyborg+
	if(++charge_tick < recharge_time)
		return 0
	charge_tick = 0

	if(isrobot(loc))
		var/mob/living/silicon/robot/R = loc
		if(R && R.cell)
			for(var/T in reagent_ids)
				if(reagent_volumes[T] < volume)
					R.cell.use(charge_cost)
					reagent_volumes[T] = min(reagent_volumes[T] + 5, volume)
	return 1

/obj/item/chems/borghypo/use_on_mob(mob/living/target, mob/living/user, animate = TRUE)

	if(!reagent_volumes[reagent_ids[mode]])
		to_chat(user, SPAN_WARNING("The injector is empty."))
		return TRUE

	var/allow = target.can_inject(user, user.get_target_zone())
	if (allow)
		if (allow == INJECTION_PORT)
			user.visible_message(SPAN_WARNING("\The [user] begins hunting for an injection port on \the [target]'s suit!"))
			if(!user.do_skilled(INJECTION_PORT_DELAY, SKILL_MEDICAL, target))
				return TRUE

		to_chat(user,   SPAN_NOTICE("You inject \the [target] with the injector."))
		to_chat(target, SPAN_NOTICE("You feel a tiny prick!"))

		if(target.reagents)
			var/t = min(amount_per_transfer_from_this, reagent_volumes[reagent_ids[mode]])
			target.add_to_reagents(reagent_ids[mode], t)
			reagent_volumes[reagent_ids[mode]] -= t
			admin_inject_log(user, target, src, reagent_ids[mode], t)
			to_chat(user, SPAN_NOTICE("[t] units injected. [reagent_volumes[reagent_ids[mode]]] units remaining."))
		return TRUE

	return ..()

/obj/item/chems/borghypo/attack_self(mob/user) //Change the mode
	var/t = ""
	for(var/i = 1 to reagent_ids.len)
		if(t)
			t += ", "
		if(mode == i)
			t += "<b>[reagent_names[i]]</b>"
		else
			t += "<a href='byond://?src=\ref[src];reagent_index=[i]'>[reagent_names[i]]</a>"
	t = "Available reagents: [t]."
	to_chat(user, t)

	return

/obj/item/chems/borghypo/OnTopic(var/href, var/list/href_list)
	if(href_list["reagent_index"])
		var/index = text2num(href_list["reagent_index"])
		if(index > 0 && index <= reagent_ids.len)
			playsound(loc, 'sound/effects/pop.ogg', 50, 0)
			mode = index
			var/decl/material/R = reagent_ids[mode]
			to_chat(usr, "<span class='notice'>Synthesizer is now producing '[initial(R.name)]'.</span>")
		return TOPIC_REFRESH

/obj/item/chems/borghypo/examine(mob/user, distance)
	. = ..()
	if(distance > 2)
		return

	var/decl/material/R = reagent_ids[mode]
	to_chat(user, "<span class='notice'>It is currently producing [initial(R.name)] and has [reagent_volumes[reagent_ids[mode]]] out of [volume] units left.</span>")

/obj/item/chems/borghypo/service
	name = "cyborg drink synthesizer"
	desc = "A portable drink dispencer."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "shaker"
	charge_cost = 5
	recharge_time = 3
	volume = 60
	possible_transfer_amounts = @"[5,10,20,30]"
	reagent_ids = list(
		/decl/material/liquid/alcohol/beer,
		/decl/material/liquid/alcohol/coffee,
		/decl/material/liquid/alcohol/whiskey,
		/decl/material/liquid/alcohol/wine,
		/decl/material/liquid/alcohol/vodka,
		/decl/material/liquid/alcohol/gin,
		/decl/material/liquid/alcohol/rum,
		/decl/material/liquid/alcohol/tequila,
		/decl/material/liquid/alcohol/vermouth,
		/decl/material/liquid/alcohol/cognac,
		/decl/material/liquid/alcohol/ale,
		/decl/material/liquid/alcohol/mead,
		/decl/material/liquid/water,
		/decl/material/liquid/nutriment/sugar,
		/decl/material/solid/ice,
		/decl/material/liquid/drink/tea/black,
		/decl/material/liquid/drink/cola,
		/decl/material/liquid/drink/citrussoda,
		/decl/material/liquid/drink/cherrycola,
		/decl/material/liquid/drink/lemonade,
		/decl/material/liquid/drink/tonic,
		/decl/material/liquid/drink/sodawater,
		/decl/material/liquid/drink/lemon_lime,
		/decl/material/liquid/drink/juice/orange,
		/decl/material/liquid/drink/juice/lime,
		/decl/material/liquid/drink/juice/watermelon,
		/decl/material/liquid/drink/coffee,
		/decl/material/liquid/drink/hot_coco,
		/decl/material/liquid/drink/tea/green,
		/decl/material/liquid/drink/citrussoda,
		/decl/material/liquid/alcohol/beer,
		/decl/material/liquid/alcohol/coffee
		)

/obj/item/chems/borghypo/service/use_on_mob(mob/living/target, mob/living/user, animate = TRUE)
	return FALSE

/obj/item/chems/borghypo/service/afterattack(var/obj/target, var/mob/user, var/proximity)
	if(!proximity)
		return

	if(!ATOM_IS_OPEN_CONTAINER(target) || !target.reagents)
		return

	if(!reagent_volumes[reagent_ids[mode]])
		to_chat(user, "<span class='notice'>[src] is out of this reagent, give it some time to refill.</span>")
		return

	if(!REAGENTS_FREE_SPACE(target.reagents))
		to_chat(user, "<span class='notice'>[target] is full.</span>")
		return

	var/t = min(amount_per_transfer_from_this, reagent_volumes[reagent_ids[mode]])
	target.add_to_reagents(reagent_ids[mode], t)
	reagent_volumes[reagent_ids[mode]] -= t
	to_chat(user, "<span class='notice'>You transfer [t] units of the solution to [target].</span>")
	return
