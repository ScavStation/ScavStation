/mob/living/captive_brain
	name = "host brain"
	real_name = "host brain"
	universal_understand = TRUE
	butchery_data = null

/mob/living/captive_brain/say(var/message)

	if (src.client)
		if(client.prefs.muted & MUTE_IC)
			to_chat(src, SPAN_WARNING("You cannot speak in IC (muted)."))
			return

	if(isborer(src.loc))

		message = sanitize(message)
		if (!message)
			return
		log_say("[key_name(src)] : [message]")
		if (stat == DEAD)
			return say_dead(message)

		var/mob/living/simple_animal/borer/B = src.loc
		to_chat(src, "You whisper silently, \"[message]\"")
		to_chat(B.host, "The captive mind of [src] whispers, \"[message]\"")

		for (var/mob/M in global.player_list)
			if (isnewplayer(M))
				continue
			else if(M.stat == DEAD && M.get_preference_value(/datum/client_preference/ghost_ears) == PREF_ALL_SPEECH)
				to_chat(M, "The captive mind of [src] whispers, \"[message]\"")

/mob/living/captive_brain/process_resist()
	SHOULD_CALL_PARENT(FALSE)
	//Resisting control by an alien mind.
	if(isborer(src.loc))
		var/mob/living/simple_animal/borer/B = src.loc
		var/mob/living/captive_brain/H = src
		to_chat(H, "<span class='danger'>You begin doggedly resisting the parasite's control (this will take approximately sixty seconds).</span>")
		to_chat(B.host, "<span class='danger'>You feel the captive mind of [src] begin to resist your control.</span>")
		spawn(rand(200,250)+B.host.get_damage(BRAIN))
			if(!B || !B.controlling) return
			B.host.take_damage(rand(0.1,0.5), BRAIN)
			to_chat(H, "<span class='danger'>With an immense exertion of will, you regain control of your body!</span>")
			to_chat(B.host, "<span class='danger'>You feel control of the host brain ripped from your grasp, and retract your probosci before the wild neural impulses can damage you.</span>")
			B.detach_from_host()
			verbs -= /mob/living/proc/release_control
			verbs -= /mob/living/proc/punish_host
			verbs -= /mob/living/proc/spawn_larvae
		return TRUE
	return FALSE
