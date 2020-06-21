/decl/hierarchy/outfit/job/yinglet/worker
	name = TRADESHIP_OUTFIT_JOB_NAME("Enclave Worker")

/decl/hierarchy/outfit/job/yinglet/scout
	name = TRADESHIP_OUTFIT_JOB_NAME("Enclave Scout")
	uniform = /obj/item/clothing/under/yinglet/scout
	head = /obj/item/clothing/head/yinglet/scout

/decl/hierarchy/outfit/job/yinglet/patriarch
	name = TRADESHIP_OUTFIT_JOB_NAME("Enclave Patriarch")
	suit = /obj/item/clothing/suit/yinglet
	id_type = /obj/item/card/id/silver/patriarch
	pda_type = /obj/item/modular_computer/pda/heads

/obj/item/card/id/silver/patriarch
	job_access_type = /datum/job/yinglet/patriarch

/decl/hierarchy/outfit/job/yinglet/matriarch
	name = TRADESHIP_OUTFIT_JOB_NAME("Enclave Matriarch")
	uniform = /obj/item/clothing/under/yinglet/matriarch
	head = /obj/item/clothing/head/yinglet/matriarch
	id_type = /obj/item/card/id/silver/matriarch
	pda_type = /obj/item/modular_computer/pda/heads

/obj/item/card/id/silver/matriarch
	job_access_type = /datum/job/yinglet/matriarch