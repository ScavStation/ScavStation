/****************
 true human verbs
****************/
/mob/living/human/verb/hold_breath()
	set name = "Hold Breath"
	set desc = "Hold your breath, or stop holding your breath."
	set category = "IC"
	set src = usr
	if(stat == CONSCIOUS)
		if(!holding_breath)
			visible_message(SPAN_WARNING("\The [src] starts holding their breath!"), SPAN_WARNING("You start holding your breath!"))
			holding_breath = 1
		else
			visible_message(SPAN_NOTICE("\The [src] starts breathing again."), SPAN_NOTICE("You stop holding your breath."))
			holding_breath = (holding_breath >= 2 ? 3 : 0)
		try_breathe()

/mob/living/human/proc/tie_hair()
	set name = "Tie Hair"
	set desc = "Style your hair."
	set category = "IC"

	if(incapacitated())
		to_chat(src, SPAN_WARNING("You can't mess with your hair right now!"))
		return

	var/hairstyle = GET_HAIR_STYLE(src)
	if(hairstyle)
		var/decl/sprite_accessory/hair/hair_style = GET_DECL(hairstyle)
		if(!(hair_style.accessory_flags & HAIR_TIEABLE))
			to_chat(src, SPAN_WARNING("Your hair isn't long enough to tie."))
			return

		var/selected_type
		var/list/valid_hairstyles = decls_repository.get_decls_of_subtype(/decl/sprite_accessory/hair)
		var/list/hairstyle_instances = list()
		for(var/hair_type in valid_hairstyles)
			var/decl/sprite_accessory/hair/test = valid_hairstyles[hair_type]
			if(test.accessory_flags & HAIR_TIEABLE)
				hairstyle_instances += test
		var/decl/selected_decl = input("Select a new hairstyle", "Your hairstyle", hair_style) as null|anything in hairstyle_instances
		if(selected_decl)
			selected_type = selected_decl.type
		if(incapacitated())
			to_chat(src, SPAN_WARNING("You can't mess with your hair right now!"))
			return
		if(selected_type && hairstyle != selected_type)
			SET_HAIR_STYLE(src, selected_type, FALSE)
			visible_message(SPAN_NOTICE("\The [src] pauses a moment to style their hair."))
		else
			to_chat(src, SPAN_NOTICE("You're already using that style."))

/****************
 misc alien verbs
****************/
/mob/living/human/proc/psychic_whisper(mob/M as mob in oview())
	set name = "Psychic Whisper"
	set desc = "Whisper silently to someone over a distance."
	set category = "Abilities"

	var/msg = sanitize(input("Message:", "Psychic Whisper") as text|null)
	if(msg)
		log_say("PsychicWhisper: [key_name(src)]->[M.key] : [msg]")
		to_chat(M, "<span class='alium'>You hear a strange, alien voice in your head... <i>[msg]</i></span>")
		to_chat(src, "<span class='alium'>You channel a message: \"[msg]\" to [M]</span>")
	return
