// base parent code for all nano_tech related furniture

/obj/structure/bed/nano_chair
	name = "chair"
	desc = "You sit in this, either by will or force."
	icon_state = "chair_preview"
	color = "#666666"
	buckle_dir = 0
	buckle_lying = 0 //force people to sit up in chairs when buckled
	obj_flags = OBJ_FLAG_ROTATABLE
	base_icon = "chair"
	var/propelled = 0 // Check for fire-extinguisher-driven chairs
	var/has_special_overlay = FALSE

	/obj/structure/bed/nano_chair/nano_armchair
	name = "armchair"
	desc = "It's an armchair. It looks comfy."
	icon_state = "armchair_preview"
	base_icon = "armchair"

/obj/structure/bed/nano_chair/nano_armchair/black
	reinf_material = /decl/material/solid/organic/cloth/black