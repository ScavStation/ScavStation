// New and improved(?) trays. Apologies to Agouri, and Doohl, wherever you may be.

/obj/item/storage/tray
	name = "DEFAULT TRAY"
	icon = 'icons/obj/food.dmi'
	icon_state = "tray_material"
	desc = "This is a default traY YOU SHOULD NOT HAVE THIS PUT IT BACK AND CALL AN ADMIN."
	force = 4
	throwforce = 10.0
	throw_speed = 1
	throw_range = 5
	melee_accuracy_bonus = -10
	w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_BOX_STORAGE
	attack_verb = list("served","slammed","hit")
	use_to_pickup = 1
	allow_quick_gather = 1
	use_sound = null

	var/cooldown = 0	//Cooldown for banging the tray with a rolling pin. based on world.time. very silly

	material = MATERIAL_CARDBOARD
	applies_material_colour = TRUE
	applies_material_name = TRUE

/obj/item/storage/tray/resolve_attackby(var/atom/A, mob/user)
	if(istype(A, /obj/item/storage/)) //Disallow putting in bags without raising w_class. Don't know why though, it was part of the old trays
		to_chat(user, "<span class='warning'>The tray won't fit in [A].</span>")
		return
	else
		. = ..()

/obj/item/storage/tray/attack(mob/living/carbon/M, mob/living/carbon/user)
	// Hitting someone with a tray drops everything on it
	overlays.Cut()
	for(var/obj/item/I in contents)
		I.dropInto(M.loc)
		contents.Remove(I)
		if(isturf(I.loc))
			spawn()
				for(var/i = 1, i <= rand(1,2), i++)
					if(I)
						step(I, pick(NORTH,SOUTH,EAST,WEST))
						sleep(rand(2,4))

	if((MUTATION_CLUMSY in user.mutations) && prob(50)) // There is a better way to do this but I'll be damned if I'm the one to fix it.
		to_chat(M, "<span class='warning'>You accidentally slam yourself with the [src]!</span>")
		M.Weaken(1)
		user.take_organ_damage(2)
		if(prob(50))
			playsound(M, hitsound, 50, 1)
			return
		else
			playsound(M, hitsound, 50, 1) 
			return 

	..()

/obj/item/storage/tray/attackby(obj/item/W as obj, mob/user as mob) // Keeping this from old trays because... i guess?
	if(istype(W, /obj/item/material/kitchen/rollingpin))
		if(cooldown < world.time - 25)
			user.visible_message("<span class='warning'>[user] bashes [src] with [W]!</span>")
			playsound(user.loc, 'sound/effects/shieldbash.ogg', 50, 1)
			cooldown = world.time
	else
		..()

/obj/item/storage/tray/dropped(mob/user)
	..()
	spawn(1) //why sleep 1? Because forceMove first drops us on the ground.
		if(!isturf(loc)) //to handle hand switching
			return

		var/foundtable = 0
		for(var/obj/structure/table/T in loc)
			foundtable = 1
			break

		close(user)
		overlays.Cut()
		if(!foundtable)
			visible_message("Everything falls off the [name]! Good job [user].")
		for(var/obj/item/I in contents)
			I.dropInto(loc)
			contents.Remove(I)
			if(!foundtable && isturf(loc))
			// if no table, presume that the person just shittily dropped the tray on the ground and made a mess everywhere!
				spawn()
					for(var/i = 1, i <= rand(1,2), i++)
						if(I)
							step(I, pick(NORTH,SOUTH,EAST,WEST))
							sleep(rand(2,4))

/obj/item/storage/tray/on_update_icon()
	..() //shouldn't need overlay.Cut here already done for us
	for(var/obj/item/I in contents)
		overlays += image("icon" = I.icon, "icon_state" = I.icon_state, "layer" = 30 + I.layer, "pixel_x" = I.pixel_x, "pixel_y" = I.pixel_y)

/obj/item/storage/tray/examine(mob/user) // So when you look at the tray you can see whats on it.
	.=..()
	if(.)
		var/tray_examine = list()
		if(!contents)
			return
		for(var/obj/item/I in contents)
			tray_examine += I.name
		to_chat(user, "There is a [english_list(tray_examine)] on the tray.")
	return

/obj/item/storage/tray/get_codex_value()
	return "tray"

/* 
-----------------------------------------------------------------
TRAY TYPES GO HERE
-----------------------------------------------------------------
 */

/obj/item/storage/tray/wood
	name = "tray" //material names are automatic kay?
	desc = "A wooden tray to serve food on."
	material = MATERIAL_WOOD

/obj/item/storage/tray/metal
	obj_flags = OBJ_FLAG_CONDUCTIBLE

/obj/item/storage/tray/metal/attack(mob/living/carbon/M, mob/living/carbon/user) // So metal trays make the fun noise
	hitsound = pick('sound/items/trayhit1.ogg','sound/items/trayhit2.ogg')
	..()

/obj/item/storage/tray/metal/aluminium
	name = "tray"
	desc = "An aluminium tray to serve food on."
	material = MATERIAL_ALUMINIUM

/obj/item/storage/tray/metal/silver
	name = "platter"
	desc = "You lazy bum."
	material = MATERIAL_SILVER

/obj/item/storage/tray/metal/gold
	name = "platter"
	desc = "A gold tray to serve food on. But oh sofancy."
	material = MATERIAL_GOLD