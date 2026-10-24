var/global/datum/announcement/priority_stealth = new(do_log = 0)

/datum/announcement/priority_stealth
	title = "Priority Stealth"
	announcement_type = "Priority Stealth"


/datum/announcement/proc/Announce_quiet(var/message, var/new_title = "", var/new_sound = null, var/do_newscast = newscast, var/msg_sanitized = 0, var/zlevels = SSmapping.contact_levels)
	if(!message)
		return

	var/message_title = new_title ? new_title : title
	var/message_sound = new_sound ? new_sound : sound

	if(!msg_sanitized)
		message = sanitize(message, extra = 0)
	message_title = sanitize_safe(message_title)

	var/msg = FormMessage(message, message_title)
	for(var/mob/M in global.player_list)
		if((get_z(M) in (zlevels | SSmapping.admin_levels)) && !isnewplayer(M) && !isdeaf(M))
			to_chat(M, msg)
			if(message_sound)
				sound_to(M, message_sound)

	if(do_newscast)
		NewsCast(message, message_title)

	if(log)
		log_say("[key_name(usr)] has made \a [announcement_type]: [message_title] - [message] - [announcer]")
		message_admins("[key_name_admin(usr)] has made \a [announcement_type].", 1)