// TODO:
// - sounds
// - pour animation and delay
// - mold glow while it cools
// - check at a glance what is left inside the crucible
// - check metalworking skill to get an accurate read on how much metal a mold needs and how much is in the crucible

/obj/structure/metalworking/crucible
	name = "crucible"
	desc = "A heavy metal chamber for melting ore down into liquid metal."
	density = 1
	icon_state = "crucible"
	var/list/matter_contents = list()
	var/tipping = FALSE
	var/mob/living/occupant

/obj/structure/metalworking/crucible/Destroy()
	if(occupant)
		if(!QDELETED(occupant))
			occupant.forceMove(get_turf(src))
		occupant = null
	. = ..()

/obj/structure/metalworking/crucible/proc/try_move_inside(var/mob/living/target, var/mob/user)
	if(!istype(target) || !istype(user) || !target.Adjacent(user) || !user.Adjacent(src))
		return FALSE
	if(target.buckled)
		to_chat(user, SPAN_WARNING("Unbuckle \the [target] before attempting to move them!"))
		return FALSE
	if(occupant)
		to_chat(user, SPAN_WARNING("\The [src] is already occupied!"))
		return FALSE
	if(target == user)
		user.visible_message( \
			SPAN_WARNING("\The [user] begins climbing into \the [src] into \the [src]."), \
			SPAN_WARNING("You begin climbing into \the [src].") \
			)
	else
		user.visible_message( \
			SPAN_WARNING("\The [user] begins pushing \the [target] into \the [src]."), \
			SPAN_WARNING("You start pushing \the [target] into \the [src].") \
			)
	if(!do_after(user, 30, src))
		return FALSE
	if(!istype(target) || !istype(user) || !target.Adjacent(user) || !user.Adjacent(src))
		return FALSE
	if(target.buckled)
		to_chat(user, SPAN_WARNING("Unbuckle \the [target] before attempting to move them!"))
		return FALSE
	if(occupant)
		to_chat(user, SPAN_WARNING("\The [src] is already occupied!"))
		return FALSE
	target.forceMove(src)
	occupant = target
	add_fingerprint(user)
	return TRUE

/obj/structure/metalworking/crucible/MouseDrop_T(var/mob/living/target, var/mob/user)
	. = CanMouseDrop(target, user) && try_move_inside(target, user)

/obj/structure/metalworking/crucible/attackby(obj/item/grab/normal/G, var/mob/user)
	if(istype(G) && try_move_inside(G.affecting, user))
		user.drop_from_inventory(G)
		qdel(G)
		return TRUE
	. = ..()

/obj/structure/metalworking/crucible/on_update_icon()
	var/list/new_overlays
	if(LAZYLEN(matter_contents))
		var/last_highest_mat
		for(var/mat_name in matter_contents)
			if(!last_highest_mat || matter_contents[last_highest_mat] < matter_contents[mat_name])
				last_highest_mat = mat_name
		if(last_highest_mat)
			var/material/mat = SSmaterials.get_material_datum(last_highest_mat)
			if(mat)
				var/image/I = image(icon, "crucible_liquid")
				I.color = mat.icon_colour
				LAZYADD(new_overlays, I)
	if(contents.len)
		for(var/obj/item/donor in contents)
			if(donor.material)
				var/image/I = image(icon, "crucible_filled")
				I.color = donor.material.icon_colour
				LAZYADD(new_overlays, I)
				break
	overlays = new_overlays
	
/obj/structure/metalworking/crucible/attack_hand(var/mob/user)

	if(tipping)
		to_chat(user, SPAN_WARNING("\The [src] is already being tipped!"))
		return

	tipping = TRUE
	var/string_tip_dir = input(user, "Which direction do you wish to tip the crucible?", "Tip Crucible") as null|anything in list("North", "South", "East", "West")
	var/tip_dir = string_tip_dir
	switch(tip_dir)
		if("North") 
			tip_dir = NORTH
		if("West") 
			tip_dir = WEST
		if("East") 
			tip_dir = EAST
		if("South") 
			tip_dir = SOUTH
		else
			tip_dir = 0

	tipping = FALSE // No delays after this point, no need to hold this var.
	if(!tip_dir || !user.Adjacent(src) || user.incapacitated() || tipping)
		return

	var/turf/pour_to = get_step(get_turf(src), tip_dir)
	if(!istype(pour_to))
		to_chat(user, SPAN_WARNING("There is nothing in that direction to pour onto."))
		return

	if(user.a_intent != I_HURT)
		var/mob/living/M = locate() in pour_to
		if(M)
			to_chat(user, SPAN_WARNING("You cannot pour in that direction - \the [M] is in the way."))
			return
		if(!(locate(/obj/structure/metalworking/casting_basin) in pour_to) && !(locate(/obj/item/mold) in pour_to))
			to_chat(user, SPAN_WARNING("There are no molds or basins to pour into in that direction."))
			return

	// TODO: swinging door squeak
	user.visible_message(SPAN_DANGER("\The [user] tips \the [src] to the [lowertext(string_tip_dir)]!"))

	// Condense the matter list down to the primary metal and slag the rest.
	var/primary_material
	for(var/mat in matter_contents)
		if(mat == MAT_WASTE)
			continue
		if(!primary_material || matter_contents[mat] > matter_contents[primary_material])
			primary_material = mat
	for(var/mat in matter_contents)
		if(mat != primary_material && mat != MAT_WASTE)
			matter_contents[MAT_WASTE] = matter_contents[MAT_WASTE] + matter_contents[mat]
			matter_contents -= mat

	// Pour the metal out.
	if(!LAZYLEN(matter_contents))
		visible_message(SPAN_WARNING("Nothing comes out..."))
		return

	// Splash mobs.
	// TODO: welding sound + splash sound
	for(var/mob/living/M in pour_to)
		var/material/mat = SSmaterials.get_material_datum(primary_material)
		visible_message(SPAN_DANGER("Molten [mat.display_name] splashes over \the [M]!"))
		M.adjustFireLoss(rand(40,60))
		M.fire_stacks = min(M.fire_stacks, 15)
		M.IgniteMob()

	// Fill casts/molds.
	// TODO: welding sound
	var/list/molds
	for(var/obj/item/mold/mold in pour_to)
		LAZYADD(molds, mold)
	for(var/obj/structure/metalworking/casting_basin/basin in pour_to)
		if(basin.holding_mold)
			LAZYADD(molds, basin.holding_mold)

	if(LAZYLEN(molds))
		var/filled_a_mold = FALSE
		for(var/obj/item/mold/mold in molds)
			for(var/mat in matter_contents)
				if(mat == MAT_WASTE)
					continue
				if(mold.requires_metal <= matter_contents[mat])
					matter_contents[mat] -= mold.requires_metal
					mold.fill_with(mat)
					var/material/M = SSmaterials.get_material_datum(mat)
					visible_message(SPAN_NOTICE("\The molten [M.display_name] hisses as it fills \the [mold]."))
					filled_a_mold = TRUE
					break
			for(var/mat in matter_contents)
				if(matter_contents[mat] <= 0)
					matter_contents -= mat
			if(!LAZYLEN(matter_contents))
				break
		if(!filled_a_mold)
			to_chat(user, SPAN_WARNING("There is not enough metal within \the [src] to fill a mold."))

	if(contents.len)
		visible_message(SPAN_NOTICE("The unmelted contents of \the [src] are scattered across \the [pour_to]."))
		for(var/atom/movable/thing in contents.len)
			thing.forceMove(pour_to)

	// Splash the rest on the ground if there's no basin.
	if(locate(/obj/structure/metalworking/casting_basin) in pour_to)
		if(LAZYLEN(matter_contents))
			to_chat(user, SPAN_NOTICE("The remaining liquid swirls within \the [src] as you set it upright."))
		else
			to_chat(user, SPAN_NOTICE("The empty [name] clunks hollowly as you set it upright."))
		return
	else
		if(LAZYLEN(matter_contents))
			visible_message(SPAN_DANGER("A slurry of molten metal splashes onto \the [pour_to]!"))
			for(var/mat in matter_contents)
				new /obj/effect/decal/metal_splash(pour_to, mat, matter_contents[mat])
			matter_contents.Cut()
		else
			to_chat(user, SPAN_NOTICE("The empty [name] clunks hollowly as you set it upright."))

/obj/structure/metalworking/crucible/proc/melt_ore()
	// Melt ore into composite material.
	var/obj/item/donor = (locate() in contents)
	if(donor)
		for(var/mat in donor.matter)
			matter_contents[mat] = matter_contents[mat] + donor.matter[mat]
		donor.matter.Cut()
		qdel(donor)
	else
		// Time to make some products.
		var/list/new_metals = list()
		// Try to alloy our metal storage.
		var/list/attempt_to_alloy = list()
		for(var/metal in matter_contents)
			if(SSmaterials.alloy_components[metal])
				attempt_to_alloy[metal] = TRUE
		if(LAZYLEN(attempt_to_alloy))
			var/list/making_alloys = list()
			for(var/thing in SSmaterials.alloy_products)
				var/material/M = thing
				var/failed = FALSE
				for(var/otherthing in M.alloy_materials)
					if(!attempt_to_alloy[otherthing] || matter_contents[otherthing] < M.alloy_materials[otherthing])
						failed = TRUE
						break
				if(!failed) 
					making_alloys += M
			for(var/thing in making_alloys)
				var/material/M = thing
				var/making
				for(var/otherthing in M.alloy_materials)
					var/_make = Floor(matter_contents[otherthing] / M.alloy_materials[otherthing])
					making = min(making, _make) || _make
				for(var/otherthing in M.alloy_materials)
					matter_contents[otherthing] -= making * M.alloy_materials[otherthing]
				new_metals[M.type] = new_metals[M.type] + (making * M.units_per_sheet)

		// Smelt whatever is left, if it has a smeltery product.
		for(var/metal in matter_contents)
			var/material/M = SSmaterials.get_material_datum(metal)
			if(M && M.ore_smelts_to)
				var/total_smelted = Floor(matter_contents[metal]/M.units_per_sheet) * M.units_per_sheet
				if(total_smelted > 0)
					new_metals[M.ore_smelts_to] = matter_contents[M.ore_smelts_to] + total_smelted
					matter_contents[metal] -= total_smelted
		// Add metals to stockpile.
		for(var/thing in new_metals)
			matter_contents[thing] = matter_contents[thing] + new_metals[thing]

	if(occupant)
		if(occupant.stat == CONSCIOUS)
			to_chat(occupant, SPAN_DANGER("You are being cooked alive!"))
		occupant.adjustFireLoss(rand(40,60))
		occupant.fire_stacks = min(occupant.fire_stacks, 15)
		occupant.IgniteMob()

	update_icon()

/obj/structure/metalworking/crucible/proc/total_matter()
	. = 0
	for(var/mat in matter_contents)
		. += matter_contents[mat]

/obj/structure/metalworking/crucible/attackby(obj/item/O, mob/user)
	if(istype(O) && LAZYLEN(O.matter))
		if(contents.len < MAX_ORE && total_matter() < MAX_METAL)
			user.unEquip(O)
			O.forceMove(src)
			user.visible_message(SPAN_NOTICE("\The [user] drops \the [O] into chamber of \the [src]."))
			update_icon()
		else
			to_chat(user, SPAN_WARNING("\The [src] is full."))
		return
	. = ..()
