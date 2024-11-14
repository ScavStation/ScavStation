/turf/floor/wood
	name = "wooden floor"
	icon = 'icons/turf/flooring/wood.dmi'
	icon_state = "wood0"
	color = /decl/material/solid/organic/wood::color
	_flooring = /decl/flooring/wood

/turf/floor/wood/broken
	icon_state = "wood_broken0"
	_floor_broken = TRUE

/turf/floor/wood/broken/Initialize()
	. = ..()
	var/setting_broken = _floor_broken
	_floor_broken = null
	set_floor_broken(setting_broken)

/turf/floor/wood/broken/one
	icon_state = "wood_broken1"
	_floor_broken = "broken1"

/turf/floor/wood/broken/two
	icon_state = "wood_broken2"
	_floor_broken = "broken2"

/turf/floor/wood/broken/three
	icon_state = "wood_broken3"
	_floor_broken = "broken3"

/turf/floor/wood/broken/four
	icon_state = "wood_broken4"
	_floor_broken = "broken4"

/turf/floor/wood/mahogany
	color = /decl/material/solid/organic/wood/mahogany::color
	_flooring = /decl/flooring/wood/mahogany

/turf/floor/wood/maple
	color = /decl/material/solid/organic/wood/maple::color
	_flooring = /decl/flooring/wood/maple

/turf/floor/wood/ebony
	color = /decl/material/solid/organic/wood/ebony::color
	_flooring = /decl/flooring/wood/ebony

/turf/floor/wood/walnut
	color = /decl/material/solid/organic/wood/walnut::color
	_flooring = /decl/flooring/wood/walnut

/turf/floor/wood/bamboo
	color = /decl/material/solid/organic/wood/bamboo::color
	_flooring = /decl/flooring/wood/bamboo

/turf/floor/wood/yew
	color = /decl/material/solid/organic/wood/yew::color
	_flooring = /decl/flooring/wood/yew
