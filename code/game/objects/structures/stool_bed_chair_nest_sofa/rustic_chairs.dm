/obj/structure/bed/chair/rustic
	desc = "A simple, rustic-looking chair. Looks like it'd hurt to sit on for too long..."
	icon = 'icons/obj/structures/rustic_chair.dmi'
	material = /decl/material/solid/organic/wood/walnut
	color = /decl/material/solid/organic/wood/walnut::color
	user_comfort = -0.5

/obj/structure/bed/chair/rustic/update_material_name(override_name)
	. = ..()
	SetName("rustic [name]") // rustic oaken chair, not oaken rustic chair

/obj/structure/bed/chair/rustic_fancy
	name = "chair"
	desc = "An ornate, detailed chair made from wood. It has armrests!"
	icon = 'icons/obj/structures/fancy_rustic_chair.dmi'
	material = /decl/material/solid/organic/wood
	color = COLOR_WHITE // preview state is precolored
	reinf_material = /decl/material/solid/organic/cloth
	padding_color = COLOR_CHERRY_RED
	user_comfort = 1.25

/obj/structure/bed/chair/rustic_fancy/ebony
	material = /decl/material/solid/organic/wood/ebony

/obj/structure/bed/chair/rustic_fancy/update_material_name(override_name)
	. = ..()
	SetName("fancy [name]") // see above, 'fancy ebony chair' not 'ebony fancy chair'