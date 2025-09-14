/decl/outfit/job/shaded_hills
	name              = "Shaded Hills Outfit"
	abstract_type     = /decl/outfit/job/shaded_hills
	id_type           = null
	pda_type          = null
	l_ear             = null
	uniform           = /obj/item/clothing/pants/trousers/jerkin
	shoes             = /obj/item/clothing/shoes/craftable/boots
	backpack_contents = list(
		/obj/item/rock/flint/striker,
		/obj/item/bladed/folding/iron,
		/obj/item/flame/torch
	)
	l_pocket      = /obj/item/rock/flint/striker
	r_pocket      = /obj/item/bladed/folding/iron
	outfit_flags  = OUTFIT_HAS_BACKPACK | OUTFIT_EXTENDED_SURVIVAL

// ScavStation loadout overrides
/decl/loadout_option/head/pekhat/fantasy
	category = /decl/loadout_category/fantasy/clothing
	whitelisted = list(SPECIES_YINGLET)
	uid = "gear_pekhat_fantasy"

/decl/loadout_option/head/fancyhat/fantasy
	category = /decl/loadout_category/fantasy/clothing
	whitelisted = list(SPECIES_YINGLET)
	uid = "gear_yinghat_fantasy"

/decl/loadout_option/head/yinglet_hood/fantasy
	category = /decl/loadout_category/fantasy/clothing
	whitelisted = list(SPECIES_YINGLET)
	uid = "gear_yinghood_fantasy"

/decl/loadout_option/head/baxxid_hood/fantasy
	category = /decl/loadout_category/fantasy/clothing
	whitelisted = list(SPECIES_BAXXID)
	uid = "gear_baxxidhood_fantasy"

/decl/loadout_option/head/baxxid_wig/fantasy
	category = /decl/loadout_category/fantasy/clothing
	whitelisted = list(SPECIES_BAXXID)
	uid = "gear_baxxidwig_fantasy"

/decl/loadout_option/head/baxxid_headflag/fantasy
	category = /decl/loadout_category/fantasy/clothing
	whitelisted = list(SPECIES_BAXXID)
	uid = "gear_baxxidflag_fantasy"

/decl/loadout_option/head/baxxid_headflag_officer/fantasy
	category = /decl/loadout_category/fantasy/clothing
	whitelisted = list(SPECIES_BAXXID)
	uid = "gear_baxxidflag_officer_fantasy"

/decl/loadout_option/uniform/zhorin_robe/fantasy
	category = /decl/loadout_category/fantasy/clothing
	whitelisted = list(SPECIES_YINGLET)
	uid = "gear_yingrobe_fantasy"

/decl/loadout_option/uniform/librarian/fantasy
	category = /decl/loadout_category/fantasy/clothing
	whitelisted = list(SPECIES_YINGLET)
	uid = "gear_yinglibrary_fantasy"

/decl/loadout_option/suit/yingcape/fantasy
	category = /decl/loadout_category/fantasy/clothing
	whitelisted = list(SPECIES_YINGLET)
	uid = "gear_yingcape_fantasy"

/decl/loadout_option/suit/fancyclothes/fantasy
	category = /decl/loadout_category/fantasy/clothing
	whitelisted = list(SPECIES_YINGLET)
	uid = "gear_yingfancy_fantasy"

/decl/loadout_option/accessory/yinglet_tailbells/fantasy
	category = /decl/loadout_category/fantasy/utility
	uid = "gear_yingbells_fantasy"
