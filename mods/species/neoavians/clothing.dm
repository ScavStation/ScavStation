/obj/item/clothing
	var/avian_icon

/obj/item/clothing/under/color
	avian_icon = 'mods/species/neoavians/icons/clothing/under/jumpsuit.dmi'

/obj/item/clothing/Initialize()
	. = ..()
	if(avian_icon && !(BODYTYPE_AVIAN in sprite_sheets))
		LAZYSET(sprite_sheets, BODYTYPE_AVIAN, avian_icon)

//Shoes
/obj/item/clothing/shoes/magboots
	avian_icon = 'mods/species/neoavians/icons/clothing/feet/magboots.dmi'

/obj/item/clothing/shoes/galoshes
	avian_icon = 'mods/species/neoavians/icons/clothing/feet/galoshes.dmi'

//Gloves
/obj/item/clothing/gloves
	avian_icon = 'mods/species/neoavians/icons/clothing/gloves.dmi'

/obj/item/clothing/gloves/Initialize()
	. = ..()
	if(!isnull(bodytype_equip_flags) && !(bodytype_equip_flags & BODY_FLAG_EXCLUDE))
		bodytype_equip_flags |= BODY_FLAG_AVIAN

//Backpacks & tanks
/obj/item/storage/backpack/satchel/Initialize()
	. = ..()
	if(!(BODYTYPE_AVIAN in sprite_sheets))
		LAZYSET(sprite_sheets, BODYTYPE_AVIAN, 'mods/species/neoavians/icons/clothing/satchel.dmi')

//Radsuits (theyre essential?)
/obj/item/clothing/head/radiation
	avian_icon = 'mods/species/neoavians/icons/clothing/head/rad_helm.dmi'

/obj/item/clothing/suit/radiation
	avian_icon = 'mods/species/neoavians/icons/clothing/suit/rad_suit.dmi'

//cloaks
/obj/item/clothing/accessory/cloak
	avian_icon = 'mods/species/neoavians/icons/clothing/accessory/cloak.dmi'

/obj/item/clothing/accessory/cloak/hide
	avian_icon = 'mods/species/neoavians/icons/clothing/accessory/cloak_hide.dmi'

//clothing
/obj/item/clothing/under/avian_smock
	name = "smock"
	desc = "A loose-fitting smock favoured by neo-avians."
	icon = 'mods/species/neoavians/icons/clothing/under/smock.dmi'
	bodytype_equip_flags = BODY_FLAG_AVIAN
	avian_icon = null

/obj/item/clothing/under/avian_smock/worker
	name = "worker's smock"
	icon = 'mods/species/neoavians/icons/clothing/under/smock_grey.dmi'

/obj/item/clothing/under/avian_smock/rainbow
	name = "rainbow smock"
	desc = "A brightly coloured, loose-fitting smock - the height of neo-avian fashion."
	icon = 'mods/species/neoavians/icons/clothing/under/smock_rainbow.dmi'

/obj/item/clothing/under/avian_smock/security
	name = "armoured smock"
	desc = "A bright red smock with light armour insets, worn by neo-avian security personnel."
	icon = 'mods/species/neoavians/icons/clothing/under/smock_red.dmi'

/obj/item/clothing/under/avian_smock/engineering
	name = "hazard smock"
	desc = "A high-visibility yellow smock with orange highlights light armour insets, worn by neo-avian engineering personnel."
	icon = 'mods/species/neoavians/icons/clothing/under/smock_yellow.dmi'

/obj/item/clothing/under/avian_smock/utility
	name = "black uniform"
	icon = 'mods/species/neoavians/icons/clothing/under/black_utility.dmi'

/obj/item/clothing/under/avian_smock/utility/gray
	name = "gray uniform"
	icon = 'mods/species/neoavians/icons/clothing/under/gray_utility.dmi'

/obj/item/clothing/under/avian_smock/stylish_command
	name = "stylish uniform"
	icon = 'mods/species/neoavians/icons/clothing/under/stylish_form.dmi'

/obj/item/clothing/shoes
	avian_icon = 'mods/species/neoavians/icons/clothing/feet/shoes.dmi'

/obj/item/clothing/shoes/avian
	name = "small shoes"
	color = COLOR_GRAY
	bodytype_equip_flags = BODY_FLAG_AVIAN
	avian_icon = null
	icon = 'mods/species/neoavians/icons/clothing/feet/shoes.dmi'

/obj/item/clothing/shoes/avian/footwraps
	name = "cloth footwraps"
	desc = "A roll of treated canvas used for wrapping feet."
	icon = 'mods/species/neoavians/icons/clothing/feet/footwraps.dmi'
	force = 0
	item_flags = ITEM_FLAG_SILENT
	w_class = ITEM_SIZE_SMALL
