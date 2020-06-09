/obj/machinery/door/airlock/hatch/autoname

/obj/machinery/door/airlock/hatch/autoname/Initialize()
	. = ..()
	var/area/A = get_area(src)
	SetName("hatch ([A.name])")

/obj/machinery/door/airlock/hatch/autoname/general
	stripe_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/hatch/autoname/maintenance
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/hatch/autoname/command
	stripe_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/hatch/autoname/engineering
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/hatch/autoname/science
<<<<<<< HEAD:mods/valsalia/items/airlocks.dm
	stripe_color = COLOR_PURPLE
=======
	stripe_color = COLOR_PURPLE
>>>>>>> 8164cefcc4fbf8c5be29ddd331e9a7494647b948:code/game/machinery/doors/airlock_autoname.dm
