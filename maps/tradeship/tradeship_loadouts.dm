/decl/loadout_option/utility/guns
	name = "guns"
	cost = 4
	path = /obj/item/gun/projectile

/decl/loadout_option/utility/guns/Initialize()
	. = ..()
	var/guns = list()
	guns["holdout pistol"] = /obj/item/gun/projectile/pistol/holdout
	gear_tweaks += new/datum/gear_tweak/path(guns)

/decl/loadout_option/scav_medical_belt/Initialize()
	. = ..()
	LAZYDISTINCTADD(allowed_roles, list(
		/datum/job/yinglet/patriarch,
		/datum/job/yinglet/matriarch,
		/datum/job/tradeship_doctor,
		/datum/job/tradeship_doctor/head
	))
