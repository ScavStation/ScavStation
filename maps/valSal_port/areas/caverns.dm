/area/valSal_port/caves/entrance
	name = "\improper Surface Tunnels"
	color = COLOR_GRAY80

/area/valSal_port/caves/river
	name = "\improper Silent River"
	color = COLOR_GRAY20
	description = "The silent, black water catches whatever sparse light survives in the depths, glittering like a river of stars."
	area_blurb_category = /area/valSal_port/caves/river
	ambience = list(
		'sound/ambience/ominous1.ogg',
		'sound/ambience/ominous2.ogg',
		'sound/ambience/ominous3.ogg',
	)

/area/valSal_port/caves
	name = "\improper Deep Tunnels"
	color = COLOR_GRAY40
	is_outside = OUTSIDE_NO
	description = "The deep dark brings distant, whispering echoes to your ears."
	ambience = list(
		'sound/ambience/ambimine.ogg',
		'sound/ambience/song_game.ogg'
	)
	area_blurb_category = /area/valSal_port/caves
	sound_env = CAVE
	area_flags = AREA_FLAG_IS_BACKGROUND

/area/valSal_port/caves/deep
	name = "\improper Deep Caverns"
	ambience = list(
		'sound/ambience/ominous1.ogg',
		'sound/ambience/ominous2.ogg',
		'sound/ambience/ominous3.ogg',
	)