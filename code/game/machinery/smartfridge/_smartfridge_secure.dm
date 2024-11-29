/************************
*   Secure SmartFridges
*************************/
/obj/machinery/smartfridge/secure
	is_secure = 1

/obj/machinery/smartfridge/secure/CanUseTopic(mob/user, datum/topic_state/state, href_list)
	if(!allowed(user) && !emagged && locked != -1 && href_list && href_list["vend"] && scan_id)
		to_chat(user, SPAN_WARNING("Access denied."))
		var/vend_state = "[icon_state]-deny"
		if (check_state_in_icon(vend_state, icon)) //Show the vending animation if needed
			flick(vend_state, src)
		return STATUS_CLOSE
	return ..()

/obj/machinery/smartfridge/secure/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		locked = -1
		req_access.Cut()
		to_chat(user, SPAN_NOTICE("You short out the product lock on \the [src]."))
		return 1
