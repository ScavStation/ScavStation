/obj/structure/metalworking/forge_fire
	name = "forge fire"
	density = 0
	anchored = TRUE
	icon_state = "forge_fire_pit"
	layer = ABOVE_TILE_LAYER
	var/lit = FALSE
	var/fuel = 0

/obj/structure/metalworking/forge_fire/on_update_icon()
	overlays.Cut()
	if(lit)
		var/image/I = image(icon, "forge_fire")
		I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		I.layer = EFFECTS_LAYER
		overlays += I

/obj/structure/metalworking/forge_fire/proc/light()
	if(lit)
		return
	START_PROCESSING(SSobj, src)
	lit = TRUE
	update_icon()
	set_light(0.8, 1, 3, 2, "#cc5555")

/obj/structure/metalworking/forge_fire/proc/go_out()
	if(!lit)
		return
	STOP_PROCESSING(SSobj, src)
	lit = FALSE
	update_icon()
	set_light(0)

/obj/structure/metalworking/forge_fire/attackby(obj/item/O, mob/user)

	if(isflamesource(O))
		if(lit)
			to_chat(user, SPAN_WARNING("\The [src] is already happily burning."))
		else if(fuel <= 0)
			user.visible_message(SPAN_WARNING("\The [user] attempts to light \the [src] with \the [O], but there is no fuel inside to burn."))
		else
			user.visible_message(SPAN_NOTICE("\The [user] lights \the [src] with \the [O]."))
			light()
		return

	if(istype(O))
		var/total_fuel = 0
		for(var/mat in O.matter)
			var/material/M = SSmaterials.get_material_datum(mat)
			if(M && M.fuel_quality)
				total_fuel += O.matter[mat] * M.fuel_quality
		if(total_fuel > 0)
			if(100-fuel < (FUEL_PER_TICK * 100))
				to_chat(user, SPAN_WARNING("\The [src] is already well-fed and doesn't need \the [O] just yet."))
				return
			user.drop_from_inventory(O)
			user.visible_message(SPAN_NOTICE("\The [user] refuels \the [src] with \the [O]."))
			qdel(O)
			fuel = min(fuel + total_fuel, 100)
			return
		to_chat(user, SPAN_WARNING("\The [src] cannot use \the [O] as fuel."))
		return

	. = ..()

/obj/structure/metalworking/forge_fire/Process()

	if(!lit)
		lit = TRUE
		go_out()
		return

	fuel -= FUEL_PER_TICK
	if(fuel <= FUEL_PER_TICK)
		fuel = 0
		go_out()
		return

	for(var/mob/living/M in loc)
		M.adjustFireLoss(rand(10,20))
		M.fire_stacks = max(M.fire_stacks, 15)
		M.IgniteMob()

	for(var/obj/structure/metalworking/crucible/crucible in loc)
		crucible.melt_ore()
