/obj/structure/closet/cabinet
	name = "cabinet"
	desc = "Old will forever be in fashion."
	closet_appearance = /decl/closet_appearance/cabinet

/obj/structure/closet/cabinet/wooden
	desc = "A stout cabinet."
	icon = /decl/closet_appearance/cabinet/nocolor::base_icon
	material_alteration = MAT_FLAG_ALTERATION_COLOR | MAT_FLAG_ALTERATION_NAME | MAT_FLAG_ALTERATION_DESC
	open_sound = 'sound/effects/doorcreaky.ogg'
	close_sound = 'sound/effects/doorcreaky.ogg'
	material = /decl/material/solid/organic/wood
	color = /decl/material/solid/organic/wood::color
	closet_appearance = /decl/closet_appearance/cabinet/nocolor

/obj/structure/closet/cabinet/wooden/ebony
	material = /decl/material/solid/organic/wood/ebony
	color = /decl/material/solid/organic/wood/ebony::color

/obj/structure/closet/acloset
	name = "strange closet"
	desc = "It looks alien!"
	closet_appearance = /decl/closet_appearance/alien

/obj/structure/closet/gimmick
	name = "administrative supply closet"
	desc = "It's a storage unit for things that have no right being here."
	closet_appearance = /decl/closet_appearance/tactical
	anchored = FALSE

/obj/structure/closet/gimmick/russian
	name = "russian surplus closet"
	desc = "It's a storage unit for Russian standard-issue surplus."
	closet_appearance = /decl/closet_appearance/tactical

/obj/structure/closet/gimmick/russian/WillContain()
	return list(
		/obj/item/clothing/head/ushanka = 5,
		/obj/item/clothing/costume/soviet = 5)

/obj/structure/closet/gimmick/tacticool
	name = "tacticool gear closet"
	desc = "It's a storage unit for Tacticool gear."
	closet_appearance = /decl/closet_appearance/tactical


/obj/structure/closet/gimmick/tacticool/WillContain()
	return list(
		/obj/item/clothing/glasses/eyepatch,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/gloves/thick/swat = 2,
		/obj/item/clothing/head/helmet/swat = 2,
		/obj/item/clothing/mask/gas = 2,
		/obj/item/clothing/shoes/jackboots/swat = 2,
		/obj/item/clothing/suit/space/void/swat = 2,
		/obj/item/clothing/shirt/syndicate/tacticool = 2)

/obj/structure/closet/thunderdome
	name = "\improper Thunderdome closet"
	desc = "Everything you need!"
	closet_appearance = /decl/closet_appearance/tactical/alt

	anchored = TRUE

/obj/structure/closet/thunderdome/tdred
	name = "red-team Thunderdome closet"

/obj/structure/closet/thunderdome/tdred/WillContain()
	return list(
		/obj/item/clothing/suit/armor/tdome/red = 3,
		/obj/item/energy_blade/sword = 3,
		/obj/item/gun/energy/laser = 3,
		/obj/item/baton = 3,
		/obj/item/box/flashbangs = 3,
		/obj/item/clothing/head/helmet/thunderdome = 3
	)

/obj/structure/closet/thunderdome/tdgreen
	name = "green-team Thunderdome closet"
	closet_appearance = /decl/closet_appearance/tactical

/obj/structure/closet/thunderdome/tdgreen/WillContain()
	return list(
		/obj/item/clothing/suit/armor/tdome/green = 3,
		/obj/item/energy_blade/sword = 3,
		/obj/item/gun/energy/laser = 3,
		/obj/item/baton = 3,
		/obj/item/box/flashbangs = 3,
		/obj/item/clothing/head/helmet/thunderdome = 3
	)
