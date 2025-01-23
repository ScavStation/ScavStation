//Used to check if they can be fed food/drinks/pills
/mob/proc/check_mouth_coverage()
	return get_covering_head_item(SLOT_FACE)

/mob/proc/check_head_coverage()
	return !!get_covering_head_item(SLOT_HEAD)

/mob/proc/get_covering_head_item(slot_flags)
	for(var/slot in global.standard_headgear_slots)
		var/obj/item/clothes = get_equipped_item(slot)
		if(istype(clothes) && (clothes.body_parts_covered & slot_flags) && !(clothes.item_flags & ITEM_FLAG_FLEXIBLEMATERIAL))
			return clothes
	return null

/mob/proc/get_eaten_transfer_amount(var/default)
	. = default
	if(issmall(src))
		. = ceil(.*0.5)

/mob/proc/can_eat_food_currently(obj/eating, mob/user, consumption_method)
	return TRUE

#define EATING_NO_ISSUE      0
#define EATING_NBP_MOUTH     1
#define EATING_BLOCKED_MOUTH 2

/mob/proc/can_eat_status()
	if(!check_has_mouth())
		return list(EATING_NBP_MOUTH)
	var/obj/item/blocked = check_mouth_coverage()
	if(blocked)
		return list(EATING_BLOCKED_MOUTH, blocked)
	return list(EATING_NO_ISSUE)

/mob/proc/can_eat(food, feedback = TRUE)
	var/list/status = can_eat_status()
	if(status[1] == EATING_NO_ISSUE)
		return TRUE
	if(feedback)
		if(status[1] == EATING_NBP_MOUTH)
			to_chat(src, SPAN_WARNING("Where do you intend to put \the [food]? You don't have a mouth!"))
		else if(status[1] == EATING_BLOCKED_MOUTH)
			to_chat(src, SPAN_WARNING("\The [status[2]] is in the way!"))
	return FALSE

/mob/proc/can_force_feed(mob/target, food, feedback = TRUE)
	if(src == target)
		return can_eat(food)
	var/list/status = target.can_eat_status()
	if(status[1] == EATING_NO_ISSUE)
		return TRUE
	if(feedback)
		if(status[1] == EATING_NBP_MOUTH)
			to_chat(src, SPAN_WARNING("Where do you intend to put \the [food]? \The [target] doesn't have a mouth!"))
		else if(status[1] == EATING_BLOCKED_MOUTH)
			to_chat(src, SPAN_WARNING("\The [status[2]] is in the way!"))
	return FALSE

#undef EATING_NO_ISSUE
#undef EATING_NBP_MOUTH
#undef EATING_BLOCKED_MOUTH
