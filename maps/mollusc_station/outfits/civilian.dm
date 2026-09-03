/decl/outfit/job/mollusc_station/cargo
	l_ear = /obj/item/radio/headset/headset_cargo
	name = "Mollusc Station - Job - Cargo technician"
	uniform = /obj/item/clothing/jumpsuit/cargotech
	id_type = /obj/item/card/id/mollusc_station/cargo
	pda_type = /obj/item/modular_computer/pda/cargo
	backpack_contents = list(/obj/item/crowbar = 1, /obj/item/ore = 1)
	outfit_flags = OUTFIT_HAS_BACKPACK | OUTFIT_EXTENDED_SURVIVAL | OUTFIT_HAS_VITALS_SENSOR
	suit = /obj/item/clothing/suit/jacket/redcoat/service/officiated
	yinglet_suit_service = TRUE

/decl/outfit/job/mollusc_station/cargo/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/outfit/job/mollusc_station/bartender
	l_ear = /obj/item/radio/headset/headset_service
	name = "Mollusc Station - Job - Bartender"
	uniform = /obj/item/clothing/pants/formal/black/outfit
	id_type = /obj/item/card/id/mollusc_station/bartender
	pda_type = /obj/item/modular_computer/pda
	suit = /obj/item/clothing/suit/jacket/redcoat/service/officiated
	head = /obj/item/clothing/head/chefhat
	yinglet_suit_service = TRUE

/decl/outfit/job/mollusc_station/janitor
	l_ear = /obj/item/radio/headset/headset_service
	name = "Mollusc Station - Job - Janitor"
	uniform = /obj/item/clothing/jumpsuit/janitor
	id_type = /obj/item/card/id/mollusc_station/janitor
	pda_type = /obj/item/modular_computer/pda
	suit = /obj/item/clothing/suit/jacket/redcoat/service/officiated
	yinglet_suit_service = TRUE

/decl/outfit/job/mollusc_station/librarian
	l_ear = /obj/item/radio/headset/headset_service
	name = "Mollusc Station - Job - Librarian"
	uniform = /obj/item/clothing/suit/robe/yinglet/librarian
	id_type = /obj/item/card/id/mollusc_station/librarian
	pda_type = /obj/item/modular_computer/pda
	suit = /obj/item/clothing/suit/jacket/redcoat/service/officiated
	yinglet_suit_service = TRUE

//cards
/obj/item/card/id/mollusc_station/cargo
	name = "identification card"
	desc = "A card issued to cargo staff."
	detail_color = COLOR_BROWN

/obj/item/card/id/mollusc_station/bartender
	desc = "A card issued to kitchen staff."

/obj/item/card/id/mollusc_station/janitor
	desc = "A card issued to custodial staff."

/obj/item/card/id/mollusc_station/librarian
	desc = "A card issued to the station librarian."
