/decl/hierarchy/outfit/job/ministation/engineer
	name = "Job - Station Engineer"
	belt = /obj/item/storage/belt/utility/full
	l_ear = /obj/item/radio/headset/headset_eng
	shoes = /obj/item/clothing/shoes/workboots
	pda_slot = slot_l_store_str
	outfit_flags = OUTFIT_HAS_BACKPACK | OUTFIT_EXTENDED_SURVIVAL | OUTFIT_HAS_VITALS_SENSOR
	head = /obj/item/clothing/head/hardhat
	uniform = /obj/item/clothing/under/engineer
	r_pocket = /obj/item/t_scanner
	id_type = /obj/item/card/id/ministation/engineering
	pda_type = /obj/item/modular_computer/pda/engineering
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/service

/decl/hierarchy/outfit/job/ministation/engineer/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_ENGINEERING

/obj/item/card/id/ministation/engineering
	name = "identification card"
	desc = "A card issued to engineering staff."
	detail_color = COLOR_SUN

/decl/hierarchy/outfit/job/ministation/chief_engineer
	name = "Job - Head Engineer"
	uniform = /obj/item/clothing/under/chief_engineer
	glasses = /obj/item/clothing/glasses/welding/superior
	suit = /obj/item/clothing/suit/storage/hazardvest
	gloves = /obj/item/clothing/gloves/thick
	shoes = /obj/item/clothing/shoes/workboots
	pda_type = /obj/item/modular_computer/pda/heads/ce
	hands = list(/obj/item/wrench)
	belt = /obj/item/storage/belt/utility/full
	id_type = /obj/item/card/id/ministation/engineering
	r_pocket = /obj/item/radio
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/service/officiated
