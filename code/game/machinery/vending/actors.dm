
//FOR ACTORS GUILD - mainly props that cannot be spawned otherwise
/obj/machinery/vending/props
	name = "prop dispenser"
	desc = "All the props an actor could need. Probably."
	icon = 'icons/obj/machines/vending/theater.dmi'
	products = list(
		/obj/structure/flora/pottedplant = 2,
		/obj/item/flashlight/lamp = 2,
		/obj/item/flashlight/lamp/green = 2,
		/obj/item/nullrod = 1,
		/obj/item/sword/cult_toy = 4,
		/obj/item/sword/katana/toy = 2
	)

/obj/machinery/vending/props/on_update_icon()
	..()
	if(!(stat & NOPOWER))
		add_overlay("[initial(icon_state)]-overlay")

//FOR ACTORS GUILD - Containers
/obj/machinery/vending/containers
	name = "container dispenser"
	desc = "A container that dispenses containers."
	icon = 'icons/obj/machines/vending/robotics.dmi'
	base_type = /obj/machinery/vending/containers
	products = list(
		/obj/structure/closet/crate/freezer = 2,
		/obj/structure/closet = 3,
		/obj/structure/closet/crate = 3
	)
