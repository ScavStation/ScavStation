/obj/item/clothing/suit/toggle/labcoat
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/labcoat_yinglet.dmi'

/obj/item/clothing/suit/toggle/labcoat/yinglet
	name = "small labcoat"
	desc = "A labcoat tailored to be yinglet-sized."
	icon = 'mods/valsalia/icons/clothing/suit/labcoat_yinglet_red.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET
	_yinglet_icon = null

/obj/item/clothing/suit/yinglet
	abstract_type = /obj/item/clothing/suit/yinglet
	_yinglet_icon = null
	bodytype_equip_flags = BODY_FLAG_YINGLET

// Vest gets its own override rather than the generic jacket_yinglet.dmi above
/obj/item/clothing/suit/jacket/vest
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/yingvest.dmi'

/obj/item/clothing/suit/jacket/vest/blue
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/yingvest.dmi'

/obj/item/clothing/suit/jacket/vest/gray
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/yingvest.dmi'

/obj/item/clothing/suit/jacket/vest/black
	_yinglet_icon = 'mods/valsalia/icons/clothing/suit/yingvest.dmi'

/obj/item/clothing/suit/yinglet/cape
	name = "small cape"
	desc = "A short length of cloth worked into a cape. Some people would say it looks stupid."
	icon = 'mods/valsalia/icons/clothing/suit/cape_yinglet.dmi'
	paint_color = COLOR_DARK_RED

/obj/item/clothing/suit/yinglet/trashbag
	name = "trashbag"
	desc = "A trashbag with tiny arm holes."
	icon = 'mods/valsalia/icons/clothing/suit/trashbag.dmi'

/obj/item/clothing/suit/yinglet/trashbag/blue
	desc = "A blue trashbag with tiny arm holes."
	icon = 'mods/valsalia/icons/clothing/suit/trashbag_blue.dmi'

/obj/item/clothing/suit/yinglet/fancy_clothes
	name = "yinglet fancy clothes"
	desc = "White shorts and a shirt with a blue scarf made for a yinglet. A fancy outfit for a fancy lad."
	icon = 'mods/valsalia/icons/clothing/suit/fancy_clothes_yinglet.dmi'

/obj/item/clothing/suit/yinglet/paunch
	name = "yinglet paunch"
	desc = "A red mantle with spackled yellow trim, along with some plain pants for added measure."
	icon = 'mods/valsalia/icons/clothing/suit/paunch.dmi'

/obj/item/clothing/suit/yinglet/prettygown
	name = "yinglet pretty gown"
	desc = "An orange gown with a short skirt. It's quite fancy!"
	icon = 'mods/valsalia/icons/clothing/suit/prettygown.dmi'

/obj/item/clothing/suit/yinglet/yingpao
	name = "yinglet qipao"
	desc = "A green gown with yellow trim, and a fancy loincloth hanging between the legs."
	icon = 'mods/valsalia/icons/clothing/suit/yingpao.dmi'

/obj/item/clothing/suit/yinglet/dancewear
	name = "yinglet dancewear"
	desc = "A vibrant outfit designed for dancing. It's quite eye-catching!"
	icon = 'mods/valsalia/icons/clothing/suit/dancewear.dmi'

/obj/item/clothing/suit/yinglet/bountifuldress
	name = "yinglet bountiful dress"
	desc = "A dress designed in mind for yinglets of the larger variety."
	icon = 'mods/valsalia/icons/clothing/suit/bountifuldress.dmi'

/obj/item/clothing/suit/quingsuit
	name = "quinglet enviromental suit"
	desc = "A fully enclosed suit designed to provide a sterile enviroment for the user within"
	bodytype_equip_flags = BODY_FLAG_YINGLET
	body_parts_covered = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_FEET|SLOT_ARMS|SLOT_HANDS|SLOT_TAIL
	item_flags = ITEM_FLAG_THICKMATERIAL
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
//	yinglet_icon = null
	icon = 'mods/valsalia/icons/clothing/suit/quingsuit.dmi'