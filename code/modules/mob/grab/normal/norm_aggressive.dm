/decl/grab/normal/aggressive
	name               = "aggressive grab"
	upgrab             = /decl/grab/normal/neck
	downgrab           = /decl/grab/normal/passive
	shift              = 12
	stop_move          = 1
	reverse_facing     = 0
	shield_assailant   = 0
	point_blank_mult   = 1.5
	damage_stage       = 1
	same_tile          = 0
	can_throw          = 1
	force_danger       = 1
	breakability       = 3
	grab_icon_state    = "reinforce1"
	break_chance_table = list(5, 20, 40, 80, 100)
	help_action        = "wound pressure" // A bit clunky, but this is only used for admin logs presently!

/decl/grab/normal/aggressive/on_hit_help(obj/item/grab/grab, atom/target, proximity)
	var/mob/living/human/grab_victim = grab.get_affecting_mob()
	if(!istype(grab_victim) || !proximity || (target && target != grab_victim))
		return FALSE
	return grab_victim.apply_pressure(grab.assailant, grab.target_zone)

/decl/grab/normal/aggressive/process_effect(var/obj/item/grab/grab)
	var/mob/living/affecting_mob = grab.get_affecting_mob()
	if(istype(affecting_mob))
		if(grab.target_zone in list(BP_L_HAND, BP_R_HAND))
			affecting_mob.drop_held_items()
		// Keeps those who are on the ground down
		if(affecting_mob.current_posture.prone)
			SET_STATUS_MAX(affecting_mob, STAT_WEAK, 4)

/decl/grab/normal/aggressive/can_upgrade(var/obj/item/grab/grab)
	. = ..()
	if(.)
		if(!ishuman(grab.affecting))
			to_chat(grab.assailant, SPAN_WARNING("You can only upgrade an aggressive grab when grappling a human!"))
			return FALSE
		if(!(grab.target_zone in list(BP_CHEST, BP_HEAD)))
			to_chat(grab.assailant, SPAN_WARNING("You need to be grabbing their torso or head for this!"))
			return FALSE
		var/mob/living/human/affecting_mob = grab.get_affecting_mob()
		if(istype(affecting_mob))
			var/obj/item/clothing/C = affecting_mob.get_equipped_item(slot_head_str)
			if(istype(C)) //hardsuit helmets etc
				if((C.max_pressure_protection) && C.armor[ARMOR_MELEE] > 20)
					to_chat(grab.assailant, SPAN_WARNING("\The [C] is in the way!"))
					return FALSE
