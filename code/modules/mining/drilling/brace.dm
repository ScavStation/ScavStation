/obj/structure/drill_brace
	name = "mining drill brace"
	desc = "A machinery brace for an industrial drill. It looks like it's about half a metre thick."
	icon = 'icons/obj/mining_drill.dmi'
	icon_state = "mining_brace"
	density = TRUE
	layer = ABOVE_HUMAN_LAYER
	obj_flags = OBJ_FLAG_ROTATABLE|OBJ_FLAG_ANCHORABLE
	var/obj/machinery/mining_drill/connected = null

/obj/structure/drill_brace/Destroy()
	if(connected)
		disconnect_from_drill()
	return ..()

/obj/structure/drill_brace/on_update_icon()
	icon_state = "mining_brace[connected ? "_active" : ""]"
	return ..()

/obj/structure/drill_brace/wrench_floor_bolts(mob/user, delay, obj/item/tool)
	if(connected && connected.use_power != POWER_USE_OFF)
		to_chat(user, SPAN_NOTICE("You can't work with the brace of a running drill!"))
		return
	if(isspaceturf(get_turf(src)))
		to_chat(user, SPAN_NOTICE("You can't anchor something to empty space. Idiot."))
		return

	var/old_anchored = anchored
	..() // Call parent to try to actually anchor/unanchor it.
	if(anchored != old_anchored)
		if(anchored && connect_to_drill())
			to_chat(user, SPAN_NOTICE("You attach \the [src] to \the [connected]."))
		else if(disconnect_from_drill())
			to_chat(user, SPAN_NOTICE("You detatch \the [src]."))

/obj/structure/drill_brace/proc/connect_to_drill()
	var/turf/front_turf = get_step(get_turf(src), dir)
	if(!istype(front_turf))
		return FALSE
	var/obj/machinery/mining_drill/drill = locate(/obj/machinery/mining_drill) in front_turf
	if(drill)
		connected = drill
		connected.supports += src
		connected.handle_supports()
		update_icon()
		return TRUE
	return FALSE

/obj/structure/drill_brace/proc/disconnect_from_drill()
	if(!connected)
		return FALSE
	connected.supports -= src
	connected.handle_supports()
	connected = null
	update_icon()
	return TRUE
