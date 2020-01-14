#define MAX_ORE 10
#define MAX_METAL 20000
#define FUEL_PER_TICK 0.25

/obj/structure/metalworking
	icon = 'icons/obj/structures/metalworking.dmi'

/*
	Basic process:
		- Put coal into forge fire.
		- Light forge fire with flame source (welding torch, match, etc)
		- Put ore into crucible.
		- Push crucible onto fire.
		- Wait for all the lumps to disappear.
		- Place casting basin or mold to one side of the crucible.
			- Without a casting basin, the entire contents of the crucible
			  will be used even if there's only one mold below it.
			- You can also use harm intent to tip it onto an empty turf, 
			  or to tip it onto a mob.
		- Click crucible and select direction to tip it.
		- Wait for mold to cool.
		- Click on mold with hammer.
		- Retrieve item.
*/