
/obj/item/gun/energy/captain/fibgun
	name = "integrated laser gun"
	icon = 'icons/obj/guns/caplaser.dmi'
	icon_state = ICON_STATE_WORLD
	desc = "modified two shot energy gun"
	slot_flags = SLOT_LOWER_BODY //too unusually shaped to fit in a holster
	w_class = ITEM_SIZE_NORMAL
	projectile_type = /obj/item/projectile/beam/stun
	origin_tech = null
	max_shots = 2 //to compensate a bit for self-recharging
	one_hand_penalty = 0
	self_recharge = 1

	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, indicator_color=COLOR_CYAN),
		list(mode_name="shock", projectile_type=/obj/item/projectile/beam/stun/shock, indicator_color=COLOR_YELLOW),
		list(mode_name="kill", projectile_type=/obj/item/projectile/beam, indicator_color=COLOR_RED),
		)



/obj/item/robot_module/drone/fibbot
	hide_on_manifest  = 1
	name = "custom robot module"
	display_name = "Fib's custom module set"
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
		/obj/item/gripper,
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
		/datum/matter_synth/aluminium =    12000,
		/datum/matter_synth/metal =   55000,
		/datum/matter_synth/glass =   55000,
		/datum/matter_synth/wood =    12000,
		/datum/matter_synth/plastic = 22000,
		/datum/matter_synth/wire =    60
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
		SKILL_PILOTING     = SKILL_EXPERT,
		SKILL_COMPUTER     = SKILL_EXPERT
	)

/mob/living/silicon/robot/drone/construction/fibbot
	name = "Experimental fibonacci drone"
	icon = 'mods/valsalia/icons/mob/robots/fibbot.dmi'
	laws = /datum/ai_laws/construction_drone
	module_type = /obj/item/robot_module/drone/fibbot
	can_pull_size = ITEM_SIZE_STRUCTURE
	can_pull_mobs = MOB_PULL_LARGER
	integrated_light_power = 2.5
	integrated_light_range = 10
	max_health = 65
	speed = 2



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








/obj/item/robot_module/drone/construction
	name = "construction drone module"
	hide_on_manifest = 1
	channels = list(
		"Engineering" = 1
	)

	skills = list(
		SKILL_LITERACY     = SKILL_ADEPT,
		SKILL_ATMOS        = SKILL_EXPERT,
		SKILL_ENGINES      = SKILL_EXPERT,
		SKILL_CONSTRUCTION = SKILL_EXPERT,
		SKILL_ELECTRICAL   = SKILL_EXPERT,
		SKILL_PILOTING     = SKILL_EXPERT,
		SKILL_CONSTRUCTION = SKILL_EXPERT,
		SKILL_COMBAT       = SKILL_ADEPT,
		SKILL_WEAPONS      = SKILL_ADEPT,
		SKILL_COMPUTER     = SKILL_EXPERT
	)

