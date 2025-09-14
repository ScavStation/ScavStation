/mob/living/deity/say(var/message, var/decl/language/speaking = null, var/verb="says")
	if(!..())
		return 0
	if(pylon)
		pylon.audible_message("<b>\The [pylon]</b> reverberates, \"[message]\"")
	else
		for(var/m in minions)
			var/datum/mind/mind = m
			to_chat(mind.current, "<span class='cult'><font size='3'>[message]</font></span>")