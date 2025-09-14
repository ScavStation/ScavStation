/*********
* /robot *
*********/
/datum/movement_handler/robot
	expected_host_type = /mob/living/silicon/robot
	var/mob/living/silicon/robot/robot

/datum/movement_handler/robot/New(var/host)
	..()
	src.robot = host

/datum/movement_handler/robot/Destroy()
	robot = null
	. = ..()

// Use power while moving.
/datum/movement_handler/robot/use_power/DoMove(direction, mob/mover, is_external)
	var/datum/robot_component/actuator/A = robot.get_component("actuator")
	if(!is_external && !robot.cell_use_power(A.active_usage * robot.power_efficiency))
		return MOVEMENT_HANDLED
	return MOVEMENT_PROCEED

/datum/movement_handler/robot/use_power/MayMove(mob/mover, is_external)
	if(is_external || (!robot.incapacitated() && !robot.lockcharge && robot.is_component_functioning("actuator")))
		return MOVEMENT_PROCEED
	return MOVEMENT_STOP
