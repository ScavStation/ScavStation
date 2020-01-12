/datum/controller/subsystem/skybox
	background_color = "#ffffff"

#define MATERIAL_PLASTER "plaster"

/world
	turf = /turf/unsimulated/wasteland_surface
	area = /area/tradehouse_wasteland

/material/plaster
	name = MATERIAL_PLASTER
	lore_text = "A hard, brittle substance made from crushed stone."
	stack_type = /obj/item/stack/material
	icon_base = "stone"
	table_icon_base = "stone"
	icon_reinf = "reinf_stone"
	icon_colour = "#ede3cc"
	shard_type = SHARD_STONE_PIECE
	weight = 22
	hardness = MATERIAL_HARD - 5
	brute_armor = 3
	door_icon_base = "stone"
	sheet_singular_name = "slab"
	sheet_plural_name = "slabs"
	conductive = 0
	construction_difficulty = MATERIAL_NORMAL_DIY
	chem_products = list(
		/datum/reagent/silicon = 20
		)
	sale_price = 1
	value = 4

/turf/simulated/wall/plaster
	icon_state = "stone"
	color = "#d9c179"

/turf/simulated/wall/plaster/New(var/newloc)
	..(newloc,MATERIAL_PLASTER)

/turf/unsimulated/wasteland_surface
	name = "wasteland"
	desc = "Gritty, barren sand with a layer of salt. Very hospitable."
	icon_state = "seafloor"

#undef MATERIAL_PLASTER

/obj/item/weapon/flame/torch
	name = "torch"
	icon = 'maps/tradehouse/icons/torch.dmi'
	icon_state = "torch_unlit"

/obj/item/weapon/flame/torch/lit
	icon_state = "torch_lit"

/obj/item/weapon/flame/torch/lit/Initialize()
	. = ..()
	lit = TRUE
	update_icon()

/obj/item/weapon/flame/torch/attack_self(mob/user)
	. = ..()
	if(lit)
		extinguish()
	else
		lit = TRUE
		update_icon()

/obj/item/weapon/flame/torch/on_update_icon()
	. = ..()	
	icon_state = "torch_[lit ? "lit" : "unlit"]"
	if(lit)
		set_light(0.5, 1, 3, 2, "#ffc07d")
	else
		set_light(0)
