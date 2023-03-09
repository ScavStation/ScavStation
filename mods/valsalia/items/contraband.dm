/obj/item/contraband/Initialize()
	. = ..()
	LAZYREMOVE(icon, 'icons/obj/contraband.dmi')
	LAZYADD(icon, 'mods/valsalia/icons/yinglet_contraband.dmi')

/obj/structure/sign/poster/Initialize()
	. = ..()
	LAZYREMOVE(icon, 'icons/obj/contraband.dmi')
	LAZYADD(icon, 'mods/valsalia/icons/yinglet_contraband.dmi')

/decl/poster/bay_60
	icon_state="poster2"
	name = "Yinglet Killer Whisky"
	desc = "This is a poster reminding you of the dangers of alchohol consumption."

/decl/poster/bay_61
	icon_state="poster6"
	name = "HONK"
	desc = "This is a poster reminding you of the dangers of clowns."