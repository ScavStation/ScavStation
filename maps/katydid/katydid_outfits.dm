/decl/hierarchy/outfit/job/katydid
	name = "Passenger"
	uniform = /obj/item/clothing/under
	id_type = null
	pda_type = null

/decl/hierarchy/outfit/job/katydid/tourist
	name = "Tourist"

/decl/hierarchy/outfit/job/katydid/priest
	name = "Preacher"
	shoes = /obj/item/clothing/shoes/color/black

/decl/hierarchy/outfit/job/katydid/crew
	name = "Crewman"
	uniform = /obj/item/clothing/under
	id_type = /obj/item/card/id
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/katydid/crew/doctor
	name = "Ship's Doctor"
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/color/white
	pda_type = /obj/item/modular_computer/pda/medical

/decl/hierarchy/outfit/job/katydid/crew/gunner
	name = "Gunner"
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/katydid/crew/firstmate
	name = "First Mate"
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/katydid/crew/captain
	name = "Captain"
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/katydid/crew/captain/equip_outfit(mob/living/carbon/human/H, assignment, equip_adjustments, datum/job/job, datum/mil_rank/rank)
	. = ..()
	H.verbs += /mob/living/carbon/human/proc/katydid_captain_rename_ship
