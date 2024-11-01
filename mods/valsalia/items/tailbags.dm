/datum/storage/backpack/tailbags
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_BACKPACK_STORAGE

/obj/item/backpack/tailbags
	name = "tailbags"
	desc = "Tailbags sized to be worn by a yinglet."
	icon = 'mods/valsalia/icons/tailbags.dmi'
	icon_state = ICON_STATE_WORLD
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BACK
	storage = /datum/storage/backpack/tailbags

/decl/backpack_outfit/tailbags
	name = "Tailbags"
	path = /obj/item/backpack/tailbags

/obj/item/backpack/tailbagsa
	name = "tailbags"
	desc = "Tailbags sized to be worn by a yinglet."
	icon = 'mods/valsalia/icons/tailbagsa.dmi'
	icon_state = ICON_STATE_WORLD
	storage = /datum/storage/backpack/tailbags
	//bodytype_equip_flags = BODY_FLAG_YINGLET
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BACK

/decl/backpack_outfit/tailbagsa
	name = "Tailbags (Angled)"
	path = /obj/item/backpack/tailbagsa