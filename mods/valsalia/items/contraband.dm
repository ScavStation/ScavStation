DEFINE_POSTER(scav/s1, "scav1", "poster - Yinglet Killer Whisky", "This is a poster reminding you of the dangers of alchohol consumption.")
DEFINE_POSTER(scav/s2, "scav2", "poster - Merry Crimbo", "Merry Crimbo from Engineering!")
DEFINE_POSTER(scav/s3, "scav3", "poster - Danger Chair", "40% of accidents are caused by chair riding, don't become a statistic.")
DEFINE_POSTER(scav/s4, "scav4", "Victorious Scavs", "A fine piece of yinglet art, showing mighty warriors reaching the peak of a mountain.")

/decl/poster_design/scav
	abstract_type = /decl/poster_design/scav
	icon = 'mods/valsalia/icons/posters.dmi'

/obj/item/poster/scav_2
	poster_design = /decl/poster_design/scav/s2

/decl/poster_design/scav_4
	abstract_type = /decl/poster_design/scav/s4
	icon = 'mods/valsalia/icons/posters.dmi'
	icon_state = "scav4"
