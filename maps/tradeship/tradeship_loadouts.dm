/datum/gear/utility/guns
	display_name = "guns"
	flags = GEAR_HAS_COLOR_SELECTION
	cost = 4
	sort_category = "Utility"
	path = /obj/item/gun/projectile

/datum/gear/utility/guns/New()
	..()
	var/guns = list()
	guns["holdout pistol"] = /obj/item/gun/projectile/pistol/holdout
	gear_tweaks += new/datum/gear_tweak/path(guns)

/datum/gear/head/yinglet_hood
	display_name = "yinglet hood, colour select"
	path = /obj/item/clothing/head/yinglet
	flags = GEAR_HAS_COLOR_SELECTION
	description = "A simple cloth hood with ear-holes. Not suitable for human use."

/datum/gear/scav_medical_belt
	display_name = "medical belt"
	path = /obj/item/storage/belt/medical
	cost = 3
	slot = slot_belt
	allowed_roles = list(
		/datum/job/yinglet/patriarch,
		/datum/job/yinglet/matriarch,
		/datum/job/tradeship_doctor, 
		/datum/job/tradeship_doctor/head
	)
