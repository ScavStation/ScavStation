/decl/outfit/job/mollusc_station/doctor/head
	name = "Mollusc Station - Job - Head Doctor"
	l_ear = /obj/item/radio/headset/heads/cmo
	uniform = /obj/item/clothing/pants/slacks/black/outfit/detective
	shoes = /obj/item/clothing/shoes/dress
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store_str
	r_pocket = /obj/item/chems/hypospray/vial
	hands = list(/obj/item/firstaid/adv)
	suit = /obj/item/clothing/suit/jacket/redcoat/officer
	id_type = /obj/item/card/id/mollusc_station/doctor

/decl/outfit/job/mollusc_station/doctor
	l_ear = /obj/item/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/color/white
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store_str
	name = "Mollusc Station - Job - Junior Doctor"
	uniform = /obj/item/clothing/jumpsuit/medical
	hands = list(/obj/item/firstaid/adv)
	r_pocket = /obj/item/flashlight/pen
	id_type = /obj/item/card/id/mollusc_station/doctor
	suit = /obj/item/clothing/suit/jacket/redcoat/officiated
	yinglet_suit_officiated = TRUE

/decl/outfit/job/mollusc_station/doctor/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/outfit/job/mollusc_station/doctor/head/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_MEDICAL

/obj/item/card/id/mollusc_station/doctor
	name = "identification card"
	desc = "A card issued to medical staff."
	detail_color = COLOR_PALE_BLUE_GRAY