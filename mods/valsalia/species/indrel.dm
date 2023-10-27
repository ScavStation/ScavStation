var/global/list/pheromone_markers = list()

/decl/species/handle_post_spawn(var/mob/living/carbon/human/H)
	. = ..()
	if(H)
		H.update_pheromone_markers()

/decl/bodytype/indrel
	name = "indrel"
	bodytype_category = BODYTYPE_INDREL
	bodytype_flag =     BODY_FLAG_INDREL
	icon_base =         'mods/valsalia/icons/species/indrel/body.dmi'
	icon_template =     'mods/valsalia/icons/species/indrel/template.dmi'
	eye_icon = 'mods/valsalia/icons/species/indrel/eyes.dmi'

	appearance_flags = HAS_EYE_COLOR
	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes
	)
	has_limbs = list(
		BP_CHEST =        list("path" = /obj/item/organ/external/chest/insectoid),
		BP_GROIN =        list("path" = /obj/item/organ/external/groin/insectoid),
		BP_HEAD =         list("path" = /obj/item/organ/external/head/insectoid),
		BP_L_ARM =        list("path" = /obj/item/organ/external/arm/insectoid),
		BP_L_HAND =       list("path" = /obj/item/organ/external/hand/insectoid),
		BP_L_HAND_UPPER = list("path" = /obj/item/organ/external/hand/insectoid/upper/indrel),
		BP_R_ARM =        list("path" = /obj/item/organ/external/arm/right/insectoid),
		BP_R_HAND =       list("path" = /obj/item/organ/external/hand/right/insectoid),
		BP_R_HAND_UPPER = list("path" = /obj/item/organ/external/hand/right/insectoid/upper/indrel),
		BP_R_LEG =        list("path" = /obj/item/organ/external/leg/right/insectoid),
		BP_L_LEG =        list("path" = /obj/item/organ/external/leg/insectoid),
		BP_L_FOOT =       list("path" = /obj/item/organ/external/foot/insectoid),
		BP_R_FOOT =       list("path" = /obj/item/organ/external/foot/right/insectoid)
	)
	limb_mapping = list(
		BP_L_HAND = list(BP_L_HAND, BP_L_HAND_UPPER),
		BP_R_HAND = list(BP_R_HAND, BP_R_HAND_UPPER)
	)

/decl/bodytype/indrel/Initialize()
	. = ..()
	equip_adjust = list(
		BP_L_HAND_UPPER =  list(
			"[NORTH]" = list("x" =  0, "y" = 8),
			"[EAST]"  = list("x" =  0, "y" = 8),
			"[SOUTH]" = list("x" = -0, "y" = 8),
			"[WEST]"  = list("x" =  0, "y" = 8)
		),
		BP_R_HAND_UPPER =  list(
			"[NORTH]" = list("x" =  0, "y" = 8),
			"[EAST]"  = list("x" =  0, "y" = 8),
			"[SOUTH]" = list("x" =  0, "y" = 8),
			"[WEST]"  = list("x" =  0, "y" = 8)
		),
		slot_head_str = list(
			"[NORTH]" = list("x" =  0, "y" = 3),
			"[EAST]" =  list("x" =  3, "y" = 3),
			"[WEST]" =  list("x" = -3, "y" = 3),
			"[SOUTH]" = list("x" =  0, "y" = 3)
		),
		slot_wear_suit_str = list(
			"[NORTH]" = list("x" =  0, "y" = 3),
			"[EAST]" =  list("x" =  1, "y" = 3),
			"[WEST]" =  list("x" = -1, "y" = 3),
			"[SOUTH]" = list("x" =  0, "y" = 3)
		),
		slot_back_str = list(
			"[NORTH]" = list("x" =  0, "y" = 3),
			"[EAST]" =  list("x" =  3, "y" = 3),
			"[WEST]" =  list("x" = -3, "y" = 3),
			"[SOUTH]" = list("x" =  0, "y" = 3)
		),
		slot_belt_str = list(
			"[NORTH]" = list("x" =  0, "y" = 1),
			"[EAST]" =  list("x" =  1, "y" = 1),
			"[WEST]" =  list("x" = -1, "y" = 1),
			"[SOUTH]" = list("x" =  0, "y" = 1)
		),
		slot_glasses_str = list(
			"[NORTH]" = list("x" =  0, "y" = 4),
			"[EAST]" =  list("x" =  3, "y" = 4),
			"[WEST]" =  list("x" = -3, "y" = 4),
			"[SOUTH]" = list("x" =  0, "y" = 4)
		),
		slot_wear_mask_str = list(
			"[NORTH]" = list("x" =  0, "y" = 4),
			"[EAST]" =  list("x" =  3, "y" = 4),
			"[WEST]" =  list("x" = -3, "y" = 4),
			"[SOUTH]" = list("x" =  0, "y" = 4)
		)
	)
/decl/species/indrel
	name = SPECIES_INDREL
	name_plural = SPECIES_INDREL

	sniff_message_3p = "waves their antennae."
	sniff_message_1p = "You wave your antennae, searching for scents."

	available_bodytypes = list(
		/decl/bodytype/indrel
	)

	spawn_flags = SPECIES_CAN_JOIN
	species_flags = SPECIES_FLAG_NO_MINOR_CUT

	unarmed_attacks = list(
		/decl/natural_attack/claws/strong,
		/decl/natural_attack/bite/strong
	)
	hazard_low_pressure = -1

	available_cultural_info = list(
		TAG_CULTURE =   list(
			/decl/cultural_info/culture/indrel,
			/decl/cultural_info/culture/other
		),
		TAG_HOMEWORLD = list(
			/decl/cultural_info/location/stateless
		),
		TAG_FACTION =   list(
			/decl/cultural_info/faction/indrel,
			/decl/cultural_info/faction/other
		),
		TAG_RELIGION =  list(
			/decl/cultural_info/religion/other
		)
	)

// TODO: stronger melee attack from these limbs.
/datum/inventory_slot/gripper/right_hand/indrel
	slot_name = "Upper Right Hand"
	slot_id = BP_R_HAND_UPPER
	requires_organ_tag = BP_R_HAND_UPPER
	can_use_held_item = FALSE
	overlay_slot = BP_R_HAND_UPPER
	ui_label = "UR"
	hand_sort_priority = 2

/datum/inventory_slot/gripper/left_hand/indrel
	slot_name = "Upper Left Hand"
	slot_id = BP_L_HAND_UPPER
	requires_organ_tag = BP_L_HAND_UPPER
	can_use_held_item = FALSE
	overlay_slot = BP_L_HAND_UPPER
	ui_label = "UL"
	hand_sort_priority = 2

/obj/item/organ/external/hand/right/insectoid/upper/indrel
	gripper_type = /datum/inventory_slot/gripper/right_hand/indrel

/obj/item/organ/external/hand/insectoid/upper/indrel
	gripper_type = /datum/inventory_slot/gripper/left_hand/indrel

/decl/species/indrel/handle_autohiss(message, decl/language/lang, mode)
	if(autohiss_exempt && (lang.name in autohiss_exempt))
		return message
	. = ""

	var/upperset = prob(50)
	var/caseperiod = rand(2,10)
	var/khxxted = FALSE
	for(var/i = 1 to length(message))
		var/add_char = message[i]
		if(!khxxted && prob(25) && (i == 1 || add_char == "," || add_char == "."))
			var/khxxt = ""
			khxxted = prob(25)
			if(i != 1)
				khxxt += " "
			khxxt += "k"
			if(prob(66))
				for(var/j = 1 to rand(2,3))
					khxxt += "h"
			for(var/j = 1 to rand(1,3))
				khxxt += "x"
			for(var/j = 1 to rand(1,3))
				khxxt += "t"
			if(i == 1)
				khxxt += " "
			add_char = "[khxxt][add_char]"
		if(upperset)
			add_char = uppertext(add_char)
		caseperiod--
		if(caseperiod <= 0)
			caseperiod = rand(2,10)
			upperset = prob(33)
		if((add_char in global.alphabet_no_vowels) && prob(15))
			for(var/j = 1 to rand(2,4))
				. += add_char
		. += add_char
	. = capitalize(trim(.))

/decl/species/indrel/Initialize()
	default_emotes |= list(
		/decl/emote/pheromone/fear,
		/decl/emote/pheromone/calm,
		/decl/emote/pheromone/storm,
		/decl/emote/pheromone/flood,
		/decl/emote/pheromone/newsisters,
		/decl/emote/pheromone/foodgood,
		/decl/emote/pheromone/foodbad,
		/decl/emote/pheromone/happy,
		/decl/emote/pheromone/sad,
		/decl/emote/pheromone/custom
	)
	. = ..()

/datum/extension/scent/custom/pheromone/check_smeller(var/mob/living/carbon/human/smeller)
	. = (..() && istype(smeller) && smeller.can_read_pheromones())

/mob/living/carbon/human/Login()
	. = ..()
	update_pheromone_markers()

/mob/living/carbon/human/proc/update_pheromone_markers()
	if(client)
		if(can_read_pheromones())
			client.images |= global.pheromone_markers
		else
			client.images -= global.pheromone_markers

/mob/living/carbon/human/proc/can_read_pheromones()
	. = (species.name == SPECIES_INDREL)
	if(!.)
		var/obj/item/implant/pheromone/imp = locate() in get_organ(BP_HEAD)
		. = (imp && imp.implanted && !imp.malfunction)

/obj/effect/decal/cleanable/pheromone
	name = "pheromone trace"
	invisibility = INVISIBILITY_MAXIMUM
	alpha = 0
	scent_type = /datum/extension/scent/custom/pheromone
	var/image/marker

/obj/effect/decal/cleanable/pheromone/proc/fade()
	alpha = max(alpha-15, 0)
	if(alpha <= 0)
		qdel(src)
	else
		addtimer(CALLBACK(src, /obj/effect/decal/cleanable/pheromone/proc/fade), 1 MINUTE)
		update_scent_marker()

/obj/effect/decal/cleanable/pheromone/Initialize(ml, _age)
	. = ..()
	addtimer(CALLBACK(src, /obj/effect/decal/cleanable/pheromone/proc/fade), 1 MINUTE)
	marker = image(loc = src, icon = 'icons/effects/blood.dmi', icon_state = pick(list("mfloor1", "mfloor2", "mfloor3", "mfloor4", "mfloor5", "mfloor6", "mfloor7")))
	marker.alpha = 90
	marker.plane = ABOVE_LIGHTING_PLANE
	marker.layer = ABOVE_LIGHTING_LAYER

/obj/effect/decal/cleanable/pheromone/Destroy()
	. = ..()
	global.pheromone_markers -= marker
	for(var/client/C)
		C.images -= marker

/obj/effect/decal/cleanable/pheromone/proc/update_scent_marker()
	if(!marker)
		return
	for(var/client/C)
		var/mob/living/carbon/human/H = C.mob
		if(istype(H) && H.can_read_pheromones())
			C.images -= marker
	var/datum/extension/scent/custom/pheromone/smell = get_extension(src, /datum/extension/scent)
	if(!istype(smell))
		return
	marker.alpha = alpha
	if(color)
		marker.color = color
		marker.filters = filter(type="drop_shadow", color = color + "F0", size = 2, offset = 1, x = 0, y = 0)
	global.pheromone_markers |= marker
	for(var/client/C)
		var/mob/living/carbon/human/H = C.mob
		if(istype(H) && H.can_read_pheromones())
			C.images |= marker

/obj/effect/decal/cleanable/pheromone/set_cleanable_scent()
	. = ..()
	update_scent_marker()
	var/datum/extension/scent/custom/pheromone/smell = get_extension(src, /datum/extension/scent)
	if(istype(smell))
		for(var/mob/living/carbon/human/H in all_hearers(smell.holder, smell.range))
			var/turf/T = get_turf(H.loc)
			if(!T || !T.return_air())
				continue
			if(!smell.check_smeller(H))
				continue
			if(smell.scent in H.smell_cooldown)
				to_chat(H, SPAN_NOTICE("The scent of [smell.scent] intensifies."))

/decl/emote/pheromone
	var/smell_message
	var/self_smell_descriptor
	var/scent_color

/decl/emote/pheromone/fear
	key = "scentfear"
	smell_message = "<span class='danger'>FEAR</span>"
	self_smell_descriptor = "distressing"
	scent_color = COLOR_RED

/decl/emote/pheromone/calm
	key = "scentcalm"
	smell_message = "<span class='notice'><b>calm</b></span>"
	self_smell_descriptor = "soothing"
	scent_color = COLOR_BLUE

/decl/emote/pheromone/storm
	key = "scentstorm"
	smell_message = "<span class='danger'><b>an oncoming storm</b></span>"
	self_smell_descriptor = "distressing"
	scent_color = COLOR_ORANGE

/decl/emote/pheromone/flood
	key = "scentflood"
	smell_message = "<span class='danger'><b>flooding tunnels</b></span>"
	self_smell_descriptor = "frantic"
	scent_color = COLOR_YELLOW

/decl/emote/pheromone/newsisters
	key = "scentsisters"
	smell_message = "<span class='danger'><b>new sisters</b></span>"
	self_smell_descriptor = "cheerful"
	scent_color = COLOR_GREEN_GRAY

/decl/emote/pheromone/foodgood
	key = "scentgoodfood"
	smell_message = "<span class='danger'><b>lots of good food</b></span>"
	self_smell_descriptor = "enticing"
	scent_color = COLOR_GREEN

/decl/emote/pheromone/foodbad
	key = "scentbadfood"
	smell_message = "<span class='danger'><b>spoiled food</b></span>"
	self_smell_descriptor = "disgusting"
	scent_color = COLOR_PURPLE

/decl/emote/pheromone/happy
	key = "scenthappy"
	smell_message = "<span class='danger'><b>happiness</b></span>"
	self_smell_descriptor = "positive"
	scent_color = COLOR_BABY_BLUE

/decl/emote/pheromone/sad
	key = "scentsad"
	smell_message = "<span class='danger'><b>sadness</b></span>"
	self_smell_descriptor = "ennervating"
	scent_color = COLOR_INDIGO

/decl/emote/pheromone/do_emote(var/atom/user, var/extra_params)
	if(!ismob(user))
		return
	var/mob/M = user
	if(M.incapacitated())
		return
	var/turf/T = get_turf(M)
	if(!T)
		return
	to_chat(user, SPAN_NOTICE("You emit the [self_smell_descriptor ? "[self_smell_descriptor] " : ""]scent of [smell_message]."))
	for(var/mob/living/carbon/human/H in viewers(world.view, user))
		if(H != user && H.stat == CONSCIOUS && H.can_read_pheromones())
			to_chat(H, SPAN_NOTICE("\The [user] emits the [self_smell_descriptor ? "[self_smell_descriptor] " : ""]scent of [smell_message]."))

	var/obj/effect/decal/cleanable/pheromone/pheromone = (locate() in T) || new(T)
	pheromone.color = scent_color || get_random_colour()
	pheromone.alpha = min(pheromone.alpha+30, 120)
	pheromone.cleanable_scent = smell_message
	pheromone.desc = "It smells of [smell_message]."
	pheromone.set_cleanable_scent()

/decl/emote/pheromone/custom
	key = "scentcustom"

/decl/emote/pheromone/custom/do_emote(var/atom/user, var/extra_params)
	var/new_smell = sanitize(extra_params || input("Please enter a short pheromone message.", "Pheromone") as text|null, max_length = MAX_LNAME_LEN)
	if(new_smell)
		smell_message = new_smell
		. = ..()

/obj/item/implant/pheromone
	name = "pheromone implant"
	desc = "A civilian grade implant for communicating with Indrel via pheromones."
	origin_tech = "{'materials':1,'biotech':1}"

/obj/item/implanter/pheromone
	name = "implanter (P)"
	imp = /obj/item/implant/pheromone