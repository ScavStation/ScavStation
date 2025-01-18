/obj/effect/decal/cleanable/crayon
	name              = "rune"
	desc              = "A rune drawn in crayon."
	icon              = 'icons/effects/crayondecal.dmi'
	icon_state        = "rune1"
	weather_sensitive = FALSE
	var/shade_color = COLOR_BLACK

/obj/effect/decal/cleanable/crayon/Initialize(mapload, _color = COLOR_WHITE, _shade_color = COLOR_BLACK, _drawtype = CRAYON_DRAW_RUNE)
	. = ..()
	name = _drawtype
	desc = "\A [_drawtype], drawn in crayon."
	color = _color
	shade_color = _shade_color
	switch(_drawtype)
		if(CRAYON_DRAW_RUNE)
			icon_state = "rune[rand(1,6)]"
		if(CRAYON_DRAW_GRAFFITI)
			icon_state = pick("amyjon","face","matt","revolution","engie","guy","end","dwarf","uboa")
		else
			icon_state = _drawtype
	update_icon()

/obj/effect/decal/cleanable/crayon/on_update_icon()
	. = ..()
	if(shade_color)
		var/overlay_state = "[icon_state]s"
		if(check_state_in_icon(overlay_state, icon))
			add_overlay(overlay_image(icon, overlay_state, shade_color, RESET_COLOR))
	compile_overlays()
