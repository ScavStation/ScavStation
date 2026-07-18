

/obj/item/gripper/no_use/attack_self(mob/user)
	drop_gripped_item()
	return



/obj/item/gripper/fipper/resolve_attackby(atom/target, mob/living/user, params)
	if(!wrapped)
		if(istype(target, /mob/living))
			user.attempt_hug(target)
	. = ..()

/obj/item/gripper/fipper
	name = "modified robotic gripper"
	desc = "modified robotic grasping tool. Seems to be made from two different units."
	icon = 'mods/valsalia/icons/mob/robots/fipper.dmi'
	icon_state = "fipper"
	max_health = ITEM_HEALTH_NO_DAMAGE
	item_flags = ITEM_FLAG_NO_BLUDGEON

	//Has a list of items that it can hold.
	can_hold = list(
		/obj/item/card,
		/obj/item/cash,
		/obj/item/cell,
		/obj/item/chems,
		/obj/item/chems/ivbag,
		/obj/item/disk,
		/obj/item/drain,
		/obj/item/frame,
		/obj/item/fuel_assembly,
		/obj/item/light,
		/obj/item/organ,
		/obj/item/parcel,
		/obj/item/pill_bottle,
		/obj/item/pipe,
		/obj/item/radio,
		/obj/item/remains,
		/obj/item/robot_parts,
		/obj/item/stack/cable_coil,
		/obj/item/stack/material,
		/obj/item/stack/material/aerogel/mapped/deuterium,
		/obj/item/stack/material/aerogel/mapped/tritium,
		/obj/item/stack/tile,
		/obj/item/stock_parts,
		/obj/item/stock_parts/circuitboard/airlock_electronics,
		/obj/item/tank,
		/obj/item/tracker_electronics,

		)

	wrapped = null // Item currently being held.




/obj/item/gun/energy/captain/fibgun
	name = "integrated laser gun"
	icon = 'icons/obj/guns/caplaser.dmi'
	icon_state = ICON_STATE_WORLD
	desc = "modified two shot energy gun"
	slot_flags = SLOT_LOWER_BODY //too unusually shaped to fit in a holster
	w_class = ITEM_SIZE_NORMAL
	projectile_type = /obj/item/projectile/beam/stun/shock
	origin_tech = null
	max_shots = 2 //to compensate a bit for self-recharging
	one_hand_penalty = 0
	self_recharge = 1

	firemodes = list()

/datum/matter_synth/fiberglass
	name = "fiberglass Synthesizer"

/datum/matter_synth/aluminium
	name = "aluminium Synthesizer"

/obj/item/robot_module/drone/fibbot
	hide_on_manifest  = 1
	icon_state        = "nomod"
	name = "custom"
	display_name = null
	channels = list(
		"Engineering" = 1
	)
	camera_channels = list(
		CAMERA_CAMERA_CHANNEL_ENGINEERING
	)
	software = list(
		/datum/computer_file/program/power_monitor,
		/datum/computer_file/program/supermatter_monitor
	)
	has_nonslip_feet  = TRUE
	has_magnetic_feet = TRUE

	equipment = list(
		/obj/item/gun/energy/captain/fibgun,
		/obj/item/baton,
		/obj/item/flash,
		/obj/item/borg/sight/meson,
		/obj/item/chems/spray/extinguisher,
		/obj/item/weldingtool/largetank,
		/obj/item/screwdriver,
		/obj/item/wrench,
		/obj/item/crowbar/brace_jack,
		/obj/item/wirecutters,
		/obj/item/multitool,
		/obj/item/t_scanner,
		/obj/item/scanner/gas,
		/obj/item/geiger,
		/obj/item/stack/tape_roll/barricade_tape/engineering,
		/obj/item/stack/tape_roll/barricade_tape/atmos,
		/obj/item/gripper/fipper,
		/obj/item/gripper/no_use/loader,
		/obj/item/lightreplacer,
		/obj/item/paint_sprayer,
		/obj/item/inflatable_dispenser/robot,
		/obj/item/inducer/borg,
		/obj/item/plunger/unbreakable,
		/obj/item/matter_decompiler,
		/obj/item/stack/material/cyborg/steel,
		/obj/item/stack/material/cyborg/aluminium,
		/obj/item/stack/material/rods/cyborg,
		/obj/item/stack/tile/floor/cyborg,
		/obj/item/stack/tile/roof/cyborg,
		/obj/item/stack/material/cyborg/glass,
		/obj/item/stack/material/cyborg/glass/reinforced,
		/obj/item/stack/material/cyborg/fiberglass,
		/obj/item/stack/cable_coil/cyborg,
		/obj/item/stack/material/cyborg/plasteel,
		/obj/item/chems/spray/cleaner/drone,
		/obj/item/borg/sight/hud/jani,
		/obj/item/mop/advanced,
		/obj/item/tank/jetpack/carbondioxide,

	)

	synths = list(
		/datum/matter_synth/fiberglass =    12000,
		/datum/matter_synth/aluminium =     12000,
		/datum/matter_synth/metal =   25000,
		/datum/matter_synth/glass =   25000,
		/datum/matter_synth/wood =    10000,
		/datum/matter_synth/plastic = 10000,
		/datum/matter_synth/wire =    30
	)

	emag = /obj/item/baton/robot/electrified_arm
	skills = list(
		SKILL_LITERACY     = SKILL_ADEPT,
		SKILL_ATMOS        = SKILL_PROF,
		SKILL_ENGINES      = SKILL_PROF,
		SKILL_CONSTRUCTION = SKILL_PROF,
		SKILL_ELECTRICAL   = SKILL_PROF,
		SKILL_COMBAT       = SKILL_ADEPT,
		SKILL_WEAPONS      = SKILL_ADEPT,
		SKILL_COMPUTER     = SKILL_EXPERT,
		SKILL_PILOT        = SKILL_EXPERT
	)

/mob/living/silicon/robot/drone/construction/fibbot
	name = "Experimental fibonacci drone"
	icon = 'mods/valsalia/icons/mob/robots/fibbot.dmi'
	laws = /datum/ai_laws/construction_drone
	module_type = /obj/item/robot_module/drone/fibbot
	can_pull_size = ITEM_SIZE_STRUCTURE
	can_pull_mobs = MOB_PULL_LARGER
	integrated_light_power = 2.5
	integrated_light_range = 12
	max_health = 65
	speed = -2



	os_type = /datum/extension/interactive/os/silicon
	starting_stock_parts = list(
		/obj/item/stock_parts/computer/processor_unit/photonic/small,
		/obj/item/stock_parts/computer/hard_drive/silicon,
		/obj/item/stock_parts/computer/network_card,
		/obj/item/stock_parts/computer/card_slot,
		/obj/item/stock_parts/computer/nano_printer,
		/obj/item/stock_parts/computer/ai_slot,
		/obj/item/stock_parts/computer/tesla_link
	)
	cell = /obj/item/cell/super
	var/obj/machinery/camera/current = null

	var/ram = 2000	// Used as currency to purchase different abilities
	var/list/software = list()
	var/obj/item/paicard/card	// The card we inhabit

	var/is_in_card = TRUE
	var/chassis
	var/obj/item/pai_cable/cable		// The cable we produce and use when door or camera jacking

	var/master				// Name of the one who commands us
	var/master_dna			// DNA string for owner verification
							// Keeping this separate from the laws var, it should be much more difficult to modify
	var/pai_law0 = "Serve your master."
	var/pai_laws				// String for additional operating instructions our master might give us


/obj/machinery/drone_fabricator/fibbot
	name = "modified drone fabricator"
	desc = "heavily modified drone fabricator unit in robot storage frame."
	fabricator_tag = "Derelict"
	icon = 'mods/valsalia/icons/mob/robots/fibbot_fab.dmi'
	icon_state = "drone_fab_idle"
	drone_type = /mob/living/silicon/robot/drone/construction/fibbot




/obj/item/robot_module/drone/fibbot/finalize_synths()

	var/datum/matter_synth/metal/metal =           locate() in synths
	var/datum/matter_synth/glass/glass =           locate() in synths
	var/datum/matter_synth/plasteel    =           locate() in synths
	var/datum/matter_synth/wire/wire   =           locate() in synths

	var/obj/item/matter_decompiler/MD = locate() in equipment
	MD.metal = metal
	MD.glass = glass

	for(var/thing in list(
		 /obj/item/stack/material/cyborg/steel,
		 /obj/item/stack/material/cyborg/aluminium,
		 /obj/item/stack/material/rods/cyborg,
		 /obj/item/stack/tile/floor/cyborg,
		 /obj/item/stack/tile/roof/cyborg,
		 /obj/item/stack/material/cyborg/glass/reinforced
		))
		var/obj/item/stack/stack = locate(thing) in equipment
		LAZYDISTINCTADD(stack.synths, metal)

	for(var/thing in list(
		 /obj/item/stack/material/cyborg/glass/reinforced,
		 /obj/item/stack/material/cyborg/glass,
		 /obj/item/stack/material/cyborg/fiberglass,
		 /obj/item/stack/material/cyborg/plasteel
		))
		var/obj/item/stack/stack = locate(thing) in equipment
		LAZYDISTINCTADD(stack.synths, glass)

	var/obj/item/stack/cable_coil/cyborg/C = locate() in equipment
	C.synths = list(wire)

	var/obj/item/stack/material/cyborg/plasteel/PL = locate() in equipment
	PL.synths = list(plasteel)