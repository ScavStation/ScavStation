/obj/item/bloom
	name = "bloom"
	desc = "A rough, unworked bloom of metal."
	icon_state = "bloom"
	icon = 'icons/obj/structures/metalworking.dmi'
	material = MAT_STEEL
	applies_material_colour = TRUE
	applies_material_name = TRUE  

/obj/item/mold
	name = "mold"
	desc = "A heavy ceramic mold intended for casting molten metal."
	icon =  'icons/obj/structures/metalworking.dmi'
	icon_state = "mold_empty_unset"
	var/requires_metal = 5000
	var/casting_type = /obj/item/bloom

/obj/item/mold/Initialize(ml, material_key, _casting_type)
	if(_casting_type)
		casting_type = _casting_type

/obj/item/mold/ring
	casting_type = /obj/item/clothing/ring

/obj/item/mold/knife
	casting_type = /obj/item/material/knife/table

/obj/item/mold/fork
	casting_type = /obj/item/material/kitchen/utensil/fork

/obj/item/mold/spoon
	casting_type = /obj/item/material/kitchen/utensil/spoon

/obj/item/mold/proc/fill_with(var/mat)
	if(!casting_type || (locate(casting_type) in contents))
		return FALSE
	var/obj/item/cast = new casting_type(src, mat)
	cast.matter = list()
	cast.matter[mat] = requires_metal
	update_icon()
	return TRUE

/obj/item/mold/on_update_icon()
	overlays.Cut()
	var/obj/item/cast = locate(casting_type) in contents
	if(cast)
		var/image/I = image(icon, "cast_filled")
		if(cast.material)
			I.color = cast.material.icon_colour
		else if(cast.color)
			I.color = cast.color
		overlays += I
	var/obj/structure/metalworking/casting_basin/basin = loc
	if(istype(basin))
		basin.update_icon()

/obj/item/mold/attackby(obj/item/W, mob/user)
	var/obj/item/cast = locate(casting_type) in contents
	if(cast)
		user.visible_message(SPAN_NOTICE("\The [user] taps \the [src] with \the [W], splitting it open and releasing \a [cast]."))
		cast.forceMove(get_turf(src))
		update_icon()
	else
		to_chat(user, SPAN_WARNING("There is nothing inside \the [src] to remove."))

/obj/effect/decal/metal_splash
	name = "metal splatter"
	icon = 'icons/effects/blood.dmi'
	icon_state = "mgibb1"
	var/material/material

/obj/effect/decal/metal_splash/Initialize(ml, _mat = MAT_WASTE, _amt = 100)
	. = ..(ml)
	for(var/obj/effect/decal/metal_splash/splash in loc)
		if(splash == src)
			continue
		splash.matter = splash.matter || list()
		splash.matter[_mat] = splash.matter[_mat] + _amt
		var/highest_mat
		for(var/thing in splash.matter)
			if(!highest_mat || splash.matter[thing] > splash.matter[highest_mat])
				highest_mat = thing
		if(highest_mat != splash.material.type)
			splash.material = SSmaterials.get_material_datum(highest_mat)
			splash.color = splash.material.icon_colour
			splash.desc = "What a waste of perfectly good [splash.material.display_name]."
			splash.icon_state = pick("mfloor1","mfloor2","mfloor3","mfloor4","mfloor5", "mfloor6", "mfloor7")
			splash.name = "metal puddle"
		return INITIALIZE_HINT_QDEL
	icon_state = pick(list("mgibbl1","mgibbl2","mgibbl3","mgibbl4","mgibbl5"))
	material = SSmaterials.get_material_datum(_mat)
	color = material.icon_colour
	desc = "What a waste of perfectly good [material.display_name]."

//TODO TOOLS
//    forging hammer
//    ball-peen hammer
//    chisel