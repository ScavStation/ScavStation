/mob/living/simple_animal/chorp
	name = "chorp"
	desc = "A large chorp. Caw caw."
	icon = 'mods/valsalia/icons/mobs/simple_animal/chorp.dmi'
	pass_flags = PASS_FLAG_TABLE
	mob_size = MOB_SIZE_SMALL
	speak_emote  = list("caws")
	ai = /datum/mob_controller/chorp
	natural_weapon = /obj/item/natural_weapon/chorp_claws
	universal_speak = TRUE

/datum/mob_controller/chorp
	emote_speech = list("Caw.", "Caw?", "Caw!", "CAW.")
	emote_hear   = list("caws")
	emote_see    = list("hops")

/mob/living/simple_animal/chorp/get_overlay_state_modifier()
	return (stat == DEAD) ? "-dead" : null

/decl/bodytype/animal/chorp
	name = "chorp"
	bodytype_category = "chorp body"
	uid = "bodytype_animal_chorp"

/mob/living/simple_animal/chorp/get_bodytype()
	return GET_DECL(/decl/bodytype/animal/chorp)

/obj/item/natural_weapon/chorp_claws
	name = "claws"
	gender = PLURAL
	attack_verb = list("clawed")
	sharp = TRUE
	_base_attack_force = 7

/mob/living/simple_animal/chorp/Initialize()
	. = ..()
	add_inventory_slot(new /datum/inventory_slot/id)
	add_held_item_slot(new /datum/inventory_slot/gripper/mouth/simple)
	update_icon()

/mob/living/simple_animal/chorp/get_dexterity(var/silent)
	return (DEXTERITY_EQUIP_ITEM|DEXTERITY_HOLD_ITEM)

/mob/living/simple_animal/chorp/DefaultTopicState()
	return global.physical_topic_state


/mob/living/simple_animal/chorp/attackby(obj/item/I, mob/user)
	if(user.a_intent == I_HELP)
		var/obj/item/backpack = get_equipped_item(slot_back_str)
		if(backpack)
			return backpack.attackby(I, user)
	return ..()

