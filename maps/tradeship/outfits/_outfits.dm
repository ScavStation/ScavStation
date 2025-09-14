// OUTFITS
/decl/outfit/job/tradeship
	abstract_type = /decl/outfit/job/tradeship
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store_str
	suit = /obj/item/clothing/suit/jacket/redcoat
	l_ear = null
	r_ear = null
	yinglet_suit_fallback = TRUE

/decl/outfit/job/tradeship/hand
	name = "Tradeship - Job - Deck Hand"

/decl/outfit/job/tradeship/hand/pre_equip(mob/living/wearer)
	..()
	uniform = pick(list(
		/obj/item/clothing/pants/mustard/overalls,
		/obj/item/clothing/jumpsuit/hazard,
		/obj/item/clothing/jumpsuit/cargotech,
		/obj/item/clothing/jumpsuit/black,
		/obj/item/clothing/jumpsuit/grey
	))

/decl/outfit/job/tradeship/hand/cook
	name = "Tradeship - Job - Cook"
	head = /obj/item/clothing/head/chefhat
	suit = /obj/item/clothing/suit/jacket/redcoat/service
