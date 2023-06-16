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

/decl/poster/bay_62
	icon_state="poster8"
	name = "Merry Crimbo"
	desc = "Merry Crimbo from Engineering!"

/decl/poster/bay_63
	icon_state="poster7"
	name = "Danger Chair"
	desc = "40% of accidents are caused by chair riding, dont become a statistic."