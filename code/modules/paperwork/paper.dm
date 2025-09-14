// large amount of fields creates a heavy load on the server, see updateinfolinks() and addtofield()
#define MAX_FIELDS 50

/*
 * Paper
 * also scraps of paper
 */
/obj/item/paper
	name                   = "sheet of paper"
	icon                   = 'icons/obj/items/paperwork/paper.dmi'
	icon_state             = ICON_STATE_WORLD
	layer                  = ABOVE_OBJ_LAYER
	slot_flags             = SLOT_HEAD
	body_parts_covered     = SLOT_HEAD
	randpixel              = 8
	throw_range            = 1
	throw_speed            = 1
	w_class                = ITEM_SIZE_TINY
	attack_verb            = list("bapped")
	material               = /decl/material/solid/organic/paper
	drop_sound             = 'sound/foley/paperpickup1.ogg'
	pickup_sound           = 'sound/foley/paperpickup2.ogg'
	item_flags             = ITEM_FLAG_CAN_TAPE
	//#TODO: Fonts probably should be stored in the pens or something?
	var/tmp/deffont        = PEN_FONT_DEFAULT
	var/tmp/signfont       = PEN_FONT_SIGNATURE
	var/tmp/crayonfont     = PEN_FONT_CRAYON
	var/tmp/fancyfont      = PEN_FONT_FANCY_PEN
	var/scan_file_type     = /datum/computer_file/data/text
	var/persist_on_init    = TRUE
	var/age                = 0
	var/fields             = 0                      // Amount of user created fields
	var/free_space         = MAX_PAPER_MESSAGE_LEN
	var/rigged             = FALSE
	var/tmp/is_honking     = FALSE
	var/is_crumpled        = FALSE                  //Whether the paper is currently crumpled
	var/info                                        // What's actually written on the paper.
	var/info_links                                  // A different version of the paper which includes html links at fields and EOF (aka the "write" link)
	var/stamp_text                                  // The (text for the) stamps on the paper.
	var/list/metadata
	var/list/applied_stamps                         //List of stamp overlays.
	var/last_modified_ckey

/obj/item/paper/Initialize(mapload, material_key, var/_text, var/_title, var/list/md = null)
	. = ..(mapload, material_key)
	set_content(_text ? _text : info, _title)
	if(md)
		LAZYDISTINCTADD(metadata, md) //Merge them
	if(!mapload && persist_on_init)
		SSpersistence.track_value(src, /decl/persistence_handler/paper)

/obj/item/paper/GetCloneArgs()
	return list(null, material?.type, info, name)

/obj/item/paper/PopulateClone(obj/item/paper/clone)
	clone = ..()
	clone.fields             = fields
	clone.last_modified_ckey = last_modified_ckey
	clone.rigged             = rigged
	clone.is_crumpled        = is_crumpled
	clone.stamp_text         = stamp_text
	clone.applied_stamps     = LAZYLEN(applied_stamps)? listDeepClone(applied_stamps) : null
	clone.metadata           = LAZYLEN(metadata)?       listDeepClone(metadata, TRUE) : null
	return clone

/obj/item/paper/Clone()
	var/obj/item/paper/clone = ..()
	if(clone)
		clone.updateinfolinks()
	return clone

/obj/item/paper/get_matter_amount_modifier()
	return 0.2

/obj/item/paper/proc/set_content(text,title)
	if(title)
		SetName(title)
	info = html_encode(text)
	info = parsepencode(text)
	update_icon()
	update_space(info)
	updateinfolinks()
	updateUsrDialog()

/obj/item/paper/on_update_icon()
	. = ..()

	icon_state = get_world_inventory_state()
	if(is_crumpled)
		icon_state = "[icon_state]-scrap"
	else
		update_contents_overlays()
		//The appearence is the key, the type is the value
		for(var/image/key in applied_stamps)
			add_overlay(key)

	// Update clipboard/paper bundle.
	if(istype(loc, /obj/item/clipboard) || istype(loc, /obj/item/paper_bundle))
		compile_overlays()
		loc.update_icon()

/**Applies the overlay displayed when the paper contains some text. */
/obj/item/paper/proc/update_contents_overlays()
	if(length(info))
		var/words_state = "[icon_state]-words"
		if(check_state_in_icon(words_state, icon))
			add_overlay(words_state)

/obj/item/paper/proc/update_space(var/new_text)
	if(new_text)
		free_space -= length(strip_html_properly(new_text))

/obj/item/paper/examine(mob/user, distance)
	. = ..()
	if(name != initial(name))
		to_chat(user, "It's titled '[name]'.")

	if(distance <= 1)
		interact(user, readonly = TRUE)
	else
		to_chat(user, SPAN_NOTICE("You have to go closer if you want to read it."))

/obj/item/paper/interact(mob/user, forceshow, readonly, admin_interact = FALSE)
	var/show_info = readonly ? info : info_links
	if(!admin_interact)
		show_info = user.handle_reading_literacy(user, show_info, FALSE, (forceshow || get_dist(src, user) <= 1))
	if(show_info)
		user.set_machine(src)
		show_browser(user, "<HTML><HEAD><TITLE>[name]</TITLE></HEAD><BODY bgcolor='[color]'>[show_info][stamp_text]</BODY></HTML>", "window=[name]")
		onclose(user, "[name]")
	return TRUE

/obj/item/paper/attack_self(mob/user)
	if(user.a_intent == I_HURT)
		if(is_crumpled)
			user.show_message(SPAN_WARNING("\The [src] is already crumpled."))
			return
		//crumple dat paper
		crumple()
		user.visible_message("\The [user] crumples \the [src] into a ball!")
		return TRUE

	interact(user, readonly = FALSE) //Allow us writing on paper since we're holding it somwhere

	if(rigged && (global.current_holiday?.name == "April Fool's Day"))
		if(!is_honking)
			is_honking = TRUE
			playsound(loc, 'sound/items/bikehorn.ogg', 50, TRUE)
			spawn(20)
				is_honking = FALSE
	return TRUE

/obj/item/paper/attack_ai(mob/living/silicon/ai/user)
	interact(user, readonly = TRUE)
	return TRUE

/obj/item/paper/use_on_mob(mob/living/target, mob/living/user, animate = TRUE)
	var/target_zone = user.get_target_zone()
	if(target_zone == BP_EYES)
		user.visible_message(
			SPAN_NOTICE("You show the paper to [target]."),
			SPAN_NOTICE("[user] holds up a paper and shows it to [target].")
		)
		target.examinate(src)
		return TRUE

	target_zone = check_zone(target_zone)
	if(target.get_organ_sprite_accessory_by_category(SAC_COSMETICS, target_zone))
		if(target == user)
			to_chat(user, SPAN_NOTICE("You wipe off the makeup with [src]."))
			target.set_organ_sprite_accessory_by_category(null, SAC_COSMETICS, null, FALSE, FALSE, target_zone, FALSE)
			return TRUE
		user.visible_message(
			SPAN_NOTICE("\The [user] begins to wipe \the [target]'s makeup off with \the [src]."),
			SPAN_NOTICE("You begin to wipe off [target]'s makeup .")
		)
		if(do_after(user, 10, target) && do_after(target, 10, check_holding = 0))	//user needs to keep their active hand, H does not.
			user.visible_message(
				SPAN_NOTICE("\The [user] wipes \the [target]'s makeup off with \the [src]."),
				SPAN_NOTICE("You wipe off \the [target]'s makeup .")
			)
		target.set_organ_sprite_accessory_by_category(null, SAC_COSMETICS, null, FALSE, FALSE, target_zone, FALSE)
		return TRUE

	. = ..()

/obj/item/paper/proc/addtofield(var/id, var/text, var/links = 0)
	var/locid = 0
	var/laststart = 1
	var/textindex = 1
	while(locid < MAX_FIELDS)
		var/istart = 0
		if(links)
			istart = findtext_char(info_links, "<span class=\"paper_field\">", laststart)
		else
			istart = findtext_char(info, "<span class=\"paper_field\">", laststart)

		if(istart==0)
			return // No field found with matching id

		laststart = istart+1
		locid++
		if(locid == id)
			var/iend = 1
			if(links)
				iend = findtext_char(info_links, "</span>", istart)
			else
				iend = findtext_char(info, "</span>", istart)

			textindex = iend
			break

	if(links)
		var/before = copytext_char(info_links, 1, textindex)
		var/after = copytext_char(info_links, textindex)
		info_links = before + text + after
	else
		var/before = copytext_char(info, 1, textindex)
		var/after = copytext_char(info, textindex)
		info = before + text + after
		updateinfolinks()

/obj/item/paper/proc/updateinfolinks()
	info_links = info
	var/i = 0
	for(i=1,i<=fields,i++)
		addtofield(i, "<font face=\"[deffont]\"><A href='byond://?src=\ref[src];write=[i]'>write</A></font>", 1)
	info_links = info_links + "<font face=\"[deffont]\"><A href='byond://?src=\ref[src];write=end'>write</A></font>"

/obj/item/paper/proc/clearpaper()
	info = null
	stamp_text = null
	free_space = MAX_PAPER_MESSAGE_LEN
	LAZYCLEARLIST(applied_stamps)
	is_crumpled = FALSE
	updateinfolinks()
	update_icon()

/obj/item/paper/proc/get_signature(var/obj/item/pen/P, mob/user)
	if(P && IS_PEN(P))
		var/decl/tool_archetype/pen/parch = GET_DECL(TOOL_PEN)
		return parch.get_signature(user, P)
	return (user && user.real_name) ? user.real_name : "Anonymous"

/obj/item/paper/proc/parsepencode(t, obj/item/pen/P, mob/user, iscrayon, isfancy)
	if(length(t) == 0)
		return ""

	if(findtext(t, "\[sign\]"))
		t = replacetext(t, "\[sign\]", "<font face=\"[signfont]\"><i>[get_signature(P, user)]</i></font>")

	if(iscrayon) // If it is a crayon, and he still tries to use these, make them empty!
		t = replacetext(t, "\[*\]", "")
		t = replacetext(t, "\[hr\]", "")
		t = replacetext(t, "\[small\]", "")
		t = replacetext(t, "\[/small\]", "")
		t = replacetext(t, "\[list\]", "")
		t = replacetext(t, "\[/list\]", "")
		t = replacetext(t, "\[table\]", "")
		t = replacetext(t, "\[/table\]", "")
		t = replacetext(t, "\[row\]", "")
		t = replacetext(t, "\[cell\]", "")
		t = replacetext(t, "\[logo\]", "")

	var/pen_color = P? P.get_tool_property(TOOL_PEN, TOOL_PROP_COLOR) : "black"
	if(iscrayon)
		t = "<font face=\"[crayonfont]\" color=[pen_color]><b>[t]</b></font>"
	else if(isfancy)
		t = "<font face=\"[fancyfont]\" color=[pen_color]><i>[t]</i></font>"
	else
		t = "<font face=\"[deffont]\" color=[pen_color]>[t]</font>"

	t = pencode2html(t)

	//Count the fields
	var/laststart = 1
	while(fields < MAX_FIELDS)
		var/i = findtext(t, "<span class=\"paper_field\">", laststart)	//</span>
		if(i==0)
			break
		laststart = i+1
		fields++

	return t

/obj/item/paper/proc/burnpaper(obj/item/P, mob/user)
	var/class = "warning"

	if(P.isflamesource() && !user.restrained())
		if(istype(P, /obj/item/flame/fuelled/lighter/zippo))
			class = "rose"

		var/decl/pronouns/pronouns = user.get_pronouns()
		user.visible_message("<span class='[class]'>[user] holds \the [P] up to \the [src], it looks like [pronouns.he] [pronouns.is] trying to burn it!</span>", \
		"<span class='[class]'>You hold \the [P] up to \the [src], burning it slowly.</span>")

		spawn(20)
			if(get_dist(src, user) < 2 && user.get_active_held_item() == P && P.isflamesource())
				user.visible_message("<span class='[class]'>[user] burns right through \the [src], turning it to ash. It flutters through the air before settling on the floor in a heap.</span>", \
				"<span class='[class]'>You burn right through \the [src], turning it to ash. It flutters through the air before settling on the floor in a heap.</span>")

				new /obj/effect/decal/cleanable/ash(get_turf(src))
				qdel(src)

			else
				to_chat(user, SPAN_WARNING("You must hold \the [P] steady to burn \the [src]."))

/obj/item/paper/CouldNotUseTopic(mob/user)
	to_chat(user, SPAN_WARNING("You can't reach!"))

/obj/item/paper/OnTopic(mob/user, href_list, datum/topic_state/state)

	if(href_list["write"])
		var/id = href_list["write"]
		if(free_space <= 0)
			to_chat(user, SPAN_INFO("There isn't enough space left on \the [src] to write anything."))
			return TOPIC_NOACTION

		//Try to find a usable pen on the user, if not abort
		var/obj/item/I = user.get_accessible_pen()
		if(!IS_PEN(I))
			to_chat(user, SPAN_WARNING("You need something to write with!"))
			return TOPIC_NOACTION

		//If we got a pen that's not in our hands, make sure to move it over
		if(user.get_active_held_item() != I && user.get_empty_hand_slot() && user.put_in_hands(I))
			to_chat(user, SPAN_NOTICE("You grab your trusty [I.name]!"))
		else if(user.get_active_held_item() != I)
			to_chat(user, SPAN_WARNING("You'd use your trusty [I.name], but your hands are full!"))
			return TOPIC_NOACTION

		var/pen_flags = I.get_tool_property(TOOL_PEN, TOOL_PROP_PEN_FLAG)
		var/decl/tool_archetype/pen/parch = GET_DECL(TOOL_PEN)
		if(!(pen_flags & PEN_FLAG_ACTIVE))
			parch.toggle_active(usr, I)
		var/iscrayon = pen_flags & PEN_FLAG_CRAYON
		var/isfancy  = pen_flags & PEN_FLAG_FANCY

		var/t =  sanitize(input("Enter what you want to write:", "Write", null, null) as message, free_space, extra = 0, trim = 0)
		if(!t)
			return TOPIC_NOACTION

		var/last_fields_value = fields
		t = parsepencode(t, I, user, iscrayon, isfancy) // Encode everything from pencode to html

		if(fields > MAX_FIELDS)
			to_chat(user, SPAN_WARNING("Too many fields. Sorry, you can't do this."))
			fields = last_fields_value
			return TOPIC_NOACTION

		var/processed_text = user.handle_writing_literacy(user, t)
		if(length(t))
			playsound(src, pick('sound/effects/pen1.ogg','sound/effects/pen2.ogg'), 30)
		var/actual_characters = length_char(strip_html_properly(t))
		if(actual_characters > 0)
			// 25 characters per charge, crayons get 30 charges
			// we're really permissive here, we don't cut you short
			// but we also use a charge even if you write <25 characters
			if(parch.decrement_uses(user, I, max(round(actual_characters / 25, 1), 1)) <= 0)
				parch.warn_out_of_ink(user, I)

		if(id!="end")
			addtofield(text2num(id), processed_text) // He wants to edit a field, let him.
		else
			info += processed_text // Oh, he wants to edit to the end of the file, let him.
			updateinfolinks()

		last_modified_ckey = user.ckey
		update_space(t)
		. = TOPIC_REFRESH

	if(. & TOPIC_REFRESH)
		updateUsrDialog()
		update_icon()
		return

	return ..()

/obj/item/paper/attackby(obj/item/P, mob/user)
	if(istype(P, /obj/item/stack/tape_roll/duct_tape))
		var/obj/item/stack/tape_roll/duct_tape/tape = P
		return tape.stick(src, user)

	else if(istype(P, /obj/item/paper) || istype(P, /obj/item/photo))
		var/obj/item/paper_bundle/B = try_bundle_with(P, user)
		if(!B)
			return TRUE
		user.put_in_hands(B)
		to_chat(user, SPAN_NOTICE("You clip \the [P] and \the [name] together."))
		return TRUE

	else if(IS_PEN(P))
		if(is_crumpled)
			to_chat(user, SPAN_WARNING("\The [src] is too crumpled to write on."))
			return TRUE

		var/obj/item/pen/robopen/RP = P
		if ( istype(RP) && RP.mode == 2 )
			RP.RenamePaper(user,src)
		else
			interact(user, readonly = FALSE)
		return TRUE

	else if(P.get_tool_quality(TOOL_STAMP))
		apply_custom_stamp(P.icon, "with \the [P]")
		playsound(src, 'sound/effects/stamp.ogg', 50, TRUE)
		to_chat(user, SPAN_NOTICE("You stamp the paper with your [P.name]."))
		return TRUE

	else if(P.isflamesource())
		burnpaper(P, user)
		return TRUE

	else if(istype(P, /obj/item/paper_bundle))
		var/obj/item/paper_bundle/B = P
		B.merge(src, user)
		return TRUE
	return ..()

/obj/item/paper/proc/try_bundle_with(var/obj/item/paper/other, var/mob/user)
	if(!can_bundle_with(other))
		if(user)
			to_chat(user, SPAN_WARNING("You can't bundle those!"))
		return

	var/obj/item/paper_bundle/B = new(loc)
	if(user)
		if(!user.canUnEquip(src))
			to_chat(user, SPAN_WARNING("You can't unequip \the [src]!"))
			return
		if(!user.canUnEquip(other))
			to_chat(user, SPAN_WARNING("You can't unequip \the [other]!"))
			return
		user.try_unequip(src, B)
		user.try_unequip(other, B)

	if (name != initial(name))
		B.SetName(name)
	else if (other.name != initial(other.name))
		B.SetName(other.name)

	B.insert_sheet_at(user, src)
	B.insert_sheet_at(user, other)
	return B

/obj/item/paper/proc/can_bundle()
	return TRUE

/obj/item/paper/proc/can_bundle_with(var/obj/item/other)
	if(istype(other, /obj/item/paper))
		var/obj/item/paper/P = other
		return can_bundle() && P.can_bundle()
	else if(istype(other, /obj/item/photo))
		return can_bundle()
	else if(istype(other, /obj/item/paper_bundle))
		var/obj/item/paper_bundle/B = other
		return can_bundle() && !B.is_full()
	return FALSE

/obj/item/paper/DefaultTopicState()
	return global.paper_topic_state

/**Whether the paper can be considered blank, for purposes of refilling machines and etc. */
/obj/item/paper/proc/is_blank()
	return !length(info) && !length(stamp_text) && !is_crumpled && !LAZYLEN(applied_stamps)

/**Stamp the paper with the  specified values.
 * stamper_name: what is stamped. Or what comes after the sentence "This paper has been stamped "
*/
/obj/item/paper/proc/apply_custom_stamp(stamp_icon, stamper_name, offset_x, offset_y)

	if(!stamp_icon || !check_state_in_icon("stamp", stamp_icon))
		return

	var/image/stamp = overlay_image(stamp_icon, "stamp", COLOR_WHITE, RESET_COLOR)

	if(isnull(offset_x))
		stamp.pixel_x = rand(-2, 2)
	else if(offset_x != 0)
		stamp.pixel_x = offset_x

	if(isnull(offset_y))
		stamp.pixel_y = rand(-2, 2)
	else if(offset_y != 0)
		stamp.pixel_y = offset_y

	stamp.blend_mode = BLEND_INSET_OVERLAY
	appearance_flags |= KEEP_TOGETHER
	LAZYADD(applied_stamps, stamp)
	stamp_text += "[length(stamp_text)? "<BR>" : "<HR>"]<i>This paper has been stamped [length(stamper_name) ? stamper_name : "by the generic stamp"].</i>"
	update_icon()

/**Merge the paper with other papers or bundles inside "location" */
/obj/item/paper/proc/merge_with_existing(var/atom/location, var/mob/user)
	if(!location || !can_bundle())
		return
	for(var/obj/item/I in location)
		if(istype(I, /obj/item/paper))
			return try_bundle_with(I, user)

		if(istype(I, /obj/item/paper_bundle))
			var/obj/item/paper_bundle/B = I
			if(B.is_full())
				continue
			if(B.merge(src, user))
				return B

/obj/item/paper/proc/crumple()
	info = stars(info,85)
	is_crumpled = TRUE
	update_icon()

/obj/item/paper/verb/rename()
	set name = "Rename paper"
	set category = "Object"
	set src in usr
	if(usr.incapacitated())
		to_chat(usr, SPAN_WARNING("You can't do that in your current state!"))
		return

	if(usr.has_genetic_condition(GENE_COND_CLUMSY) && prob(50))
		to_chat(usr, SPAN_WARNING("You cut yourself on the paper."))
		return
	var/n_name = sanitize_safe(input(usr, "What would you like to name the paper?", "Paper Naming", name) as text, MAX_NAME_LEN)

	// We check loc one level up, so we can rename in clipboards and such. See also: /obj/item/photo/rename()
	if(!n_name || !CanInteract(usr, global.deep_inventory_topic_state))
		return
	n_name = usr.handle_writing_literacy(usr, n_name)
	if(n_name)
		SetName(length(n_name) > 0? n_name : initial(name))
	add_fingerprint(usr)

/obj/item/paper/dropped(mob/user)
	. = ..()
	if(CanUseTopic(user, DefaultTopicState()))
		updateUsrDialog()
	else
		close_browser(user, name)

//
//Topic state for paper since we can use it within clipboards and folders
//
var/global/datum/topic_state/default/paper_state/paper_topic_state = new
/datum/topic_state/default/paper_state/can_use_topic(var/src_object, var/mob/user)
	. = ..()
	if(. == STATUS_INTERACTIVE)
		return

	//Check inside held objects
	for(var/atom/movable/AM in user.get_held_items())
		if(src_object in AM)
			return user.shared_nano_interaction() //Have to check this again, since we ignore all the distance stuff that was already done

///////////////////////////////////////////////////
// Paper Templates
///////////////////////////////////////////////////
/obj/item/paper/manifest
	name     = "supply manifest"
	metadata = list(
		"order_total" = 0,
		"is_copy"     = TRUE,
	)

/obj/item/paper/court
	name = "Judgement"
	info = "For crimes as specified, the offender is sentenced to:<BR>\n<BR>\n"

/obj/item/paper/aromatherapy_disclaimer
	name = "aromatherapy disclaimer"
	info = "<I>The manufacturer and the retailer make no claims of the contained products' effacy.</I> <BR><BR><B>Use at your own risk.</B>"

///////////////////////////////////////////////////
// Colored Paper
///////////////////////////////////////////////////
/obj/item/paper/blue
	name = "blue sheet of paper"
	color = "#ccffff"

/obj/item/paper/green
	name = "green sheet of paper"
	color = "#ccffaa"

/obj/item/paper/yellow
	name = "yellow sheet of paper"
	color = "#ffffcc"

/obj/item/paper/pink
	name = "pink sheet of paper"
	color = "#ffccff"

///////////////////////////////////////////////////
// Crumpled Paper
///////////////////////////////////////////////////
/obj/item/paper/crumpled
	name        = "paper scrap"
	is_crumpled = TRUE

// Stub type for moving teleportation scrolls into a modpack.
/obj/item/paper/scroll
	name    = "scroll"
	desc    = "A length of writing material curled into a scroll."
	icon    = 'icons/obj/items/paperwork/scroll.dmi'
	color   = "#feeebc"
	w_class = ITEM_SIZE_SMALL
	var/furled = FALSE

/obj/item/paper/scroll/can_bundle()
	return FALSE

/obj/item/paper/scroll/update_contents_overlays()
	return furled ? null : ..()

/obj/item/paper/scroll/on_update_icon()
	. = ..()
	if(furled)
		icon_state = "[icon_state]-furled"

/obj/item/paper/scroll/get_alt_interactions(mob/user)
	. = ..()
	if(furled)
		LAZYADD(., /decl/interaction_handler/scroll/unfurl)
	else
		LAZYADD(., /decl/interaction_handler/scroll/furl)

/decl/interaction_handler/scroll
	abstract_type = /decl/interaction_handler/scroll
	expected_target_type = /obj/item/paper/scroll

/decl/interaction_handler/scroll/invoked(atom/target, mob/user, obj/item/prop)
	var/obj/item/paper/scroll/scroll = target
	// TODO: paper sound
	scroll.furled = !scroll.furled
	user.visible_message(SPAN_NOTICE("\The [user] [scroll.furled ? "furls" : "unfurls"] \the [target]."))
	scroll.update_icon()

/decl/interaction_handler/scroll/furl
	name = "Furl Scroll"

/decl/interaction_handler/scroll/unfurl
	name = "Unfurl Scroll"
