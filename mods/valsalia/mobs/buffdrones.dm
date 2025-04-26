//drone and gripper added items to allowed list
/obj/item/gripper
	name = "robotic gripper"
	desc = "A simple grasping tool specialized in construction and engineering work."
	icon = 'icons/obj/items/borg_module/borg_gripper.dmi'
	icon_state = "gripper"
	max_health = ITEM_HEALTH_NO_DAMAGE
	item_flags = ITEM_FLAG_NO_BLUDGEON

	//Has a list of items that it can hold.
	can_hold = list(
		/obj/item/cell,
		/obj/item/stock_parts/circuitboard/airlock_electronics,
		/obj/item/tracker_electronics,
		/obj/item/stock_parts,
		/obj/item/frame,
		/obj/item/frame/camera/kit,
		/obj/item/tank,
		/obj/item/fuel_assembly,
		/obj/item/robot_parts,
		/obj/item/stack/material/aerogel/mapped/deuterium,
		/obj/item/stack/material/aerogel/mapped/tritium,
		/obj/item/stack/tile,
		/obj/item/light,
		/obj/item/chems,
		/obj/item/cash,
		/obj/item/pill_bottle,
		/obj/item/parcel,
		/obj/item/stack/cable_coil,
		/obj/item/drain,
		/obj/item/pipe,
		/obj/item/remains,
		/obj/item/radio,
		/obj/item/card,
		/obj/item/disk
		)

	wrapped = null // Item currently being held.


/obj/item/gripper/organ //Used to handle organs.
	name = "organ gripper"
	icon_state = "gripper"
	desc = "A simple grasping tool for holding and manipulating organic and mechanical organs, both internal and external."

	can_hold = list(
		/obj/item/organ,
		/obj/item/robot_parts,
		/obj/item/chems/ivbag,
		/obj/item/cell,
		/obj/item/stock_parts/circuitboard/airlock_electronics,
		/obj/item/tracker_electronics,
		/obj/item/stock_parts,
		/obj/item/frame,
		/obj/item/frame/camera/kit,
		/obj/item/tank,
		/obj/item/fuel_assembly,
		/obj/item/stack/material,
		/obj/item/stack/tile,
		/obj/item/light,
		/obj/item/chems,
		/obj/item/cash,
		/obj/item/pill_bottle,
		/obj/item/parcel,
		/obj/item/stack/cable_coil,
		/obj/item/drain,
		/obj/item/pipe,
		/obj/item/remains,
		/obj/item/radio,
		/obj/item/card,
		/obj/item/disk
	)
	// gave the drone and cyborg material synthetiser ability to craft from it
/obj/item/stack/material/cyborg/plastic
	name = "cyborg plastic synthesiser"
	icon_state = "sheet"
	material = /decl/material/solid/organic/plastic
	crafting_stack_type = /obj/item/stack/material/sheet

/obj/item/stack/material/cyborg/steel
	name = "cyborg steel synthesiser"
	icon_state = "sheet"
	material = /decl/material/solid/metal/steel
	crafting_stack_type = /obj/item/stack/material/sheet

/obj/item/stack/material/cyborg/plasteel
	name = "cyborg plasteel synthesiser"
	icon_state = "sheet-reinf"
	material = /decl/material/solid/metal/plasteel
	crafting_stack_type = /obj/item/stack/material/sheet

/obj/item/stack/material/cyborg/glass
	name = "cyborg glass synthesiser"
	icon_state = "sheet"
	material = /decl/material/solid/glass
	crafting_stack_type = /obj/item/stack/material/sheet

/obj/item/stack/material/cyborg/fiberglass
	name = "cyborg fiberglass synthesiser"
	icon_state = "sheet"
	material = /decl/material/solid/fiberglass
	crafting_stack_type = /obj/item/stack/material/sheet

/obj/item/stack/material/cyborg/glass/reinforced
	name = "cyborg reinforced glass synthesiser"
	icon_state = "sheet-reinf"
	material = /decl/material/solid/glass
	reinf_material = /decl/material/solid/metal/steel
	crafting_stack_type = /obj/item/stack/material/sheet
	charge_costs = list(500, 1000)

/obj/item/stack/material/cyborg/aluminium
	name = "cyborg aluminium synthesiser"
	icon_state = "sheet"
	material = /decl/material/solid/metal/aluminium
	crafting_stack_type = /obj/item/stack/material/sheet


/obj/item/robot_module/drone

	synths = list(
		/datum/matter_synth/metal =   25000,
		/datum/matter_synth/glass =   25000,
		/datum/matter_synth/wood =    2000,
		/datum/matter_synth/plastic = 12000, //increased amount of plastic from pazhetic 1
		/datum/matter_synth/wire =    30
	)

//made remote controlled drone inherit laws from controlling AI
/mob/living/silicon/robot/drone/assume_control(var/mob/living/silicon/ai/user)
	user.controlling_drone = src
	controlling_ai = user
	verbs += /mob/living/silicon/robot/drone/proc/release_ai_control_verb
	local_transmit = FALSE
	languages = controlling_ai.languages.Copy()

	//give controlled drone access to AI radio
	drone_silicon_radio = silicon_radio
	silicon_radio = new /obj/item/radio/headset/heads/ai_integrated(src)

	add_language(/decl/language/binary/drone, 1)
	add_language(/decl/language/binary, 1)
	add_language(/decl/language/machine, 1)
	default_language = controlling_ai.default_language //here
	laws = controlling_ai.laws
	set_stat(CONSCIOUS)
	if(user.mind)
		user.mind.transfer_to(src)
	else
		key = user.key
	updatename()
	to_chat(src, "<span class='notice'><b>You have shunted your primary control loop into \a [initial(name)].</b> Use the <b>Release Control</b> verb to return to your core.</span>")
//buffed drone light strenght
/mob/living/silicon/robot/drone

	integrated_light_power =  2.4
	integrated_light_range = 10
