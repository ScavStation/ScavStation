/decl/hierarchy/outfit/job/shelltooth/doc
	name = SHELLTOOTH_OUTFIT_JOB_NAME("Head Doctor")
	uniform = /obj/item/clothing/under/det/black
	shoes = /obj/item/clothing/shoes/laceup
	pda_type = /obj/item/modular_computer/pda/medical
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/service/officiated
	id_type = /obj/item/card/id/shelltooth/medical

/obj/item/card/id/shelltooth/medical
	name = "identification card"
	desc = "A card issued to medical staff."
	job_access_type = /datum/job/shelltooth_doctor
	detail_color = COLOR_PALE_BLUE_GRAY

/decl/hierarchy/outfit/job/shelltooth/doc/junior
	name = SHELLTOOTH_OUTFIT_JOB_NAME("Junior Doctor")
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/service
