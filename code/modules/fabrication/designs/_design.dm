/datum/fabricator_recipe
	var/name
	var/path
	var/hidden
	var/category = "General"
	var/list/resources
	var/list/fabricator_types = list(
		FABRICATOR_CLASS_GENERAL
	)
	var/build_time = 5 SECONDS
	var/ignore_materials = list(
		/material/waste = TRUE
	)

// Populate name and resources from the product type.
/datum/fabricator_recipe/New()
	..()
	if(!path)
		return
	if(!name)
		var/obj/O = path
		name = initial(O.name)
	if(!resources)
		resources = list()
		var/obj/item/I = new path
		var/list/building_cost = I.building_cost()
		for(var/path in building_cost)
			if(!ignore_materials[path])
				resources[path] = building_cost[path] * FABRICATOR_EXTRA_COST_FACTOR
		qdel(I)

/obj/proc/building_cost()
	. = list()
	if(length(matter))
		for(var/material in matter)
			var/material/M = SSmaterials.get_material_datum(material)
			if(istype(M))
				.[M.type] = matter[material]
	if(reagents && length(reagents.reagent_list))
		for(var/datum/reagent/R in reagents.reagent_list)
			.[R.type] = R.volume

/obj/machinery/building_cost()
	. = ..()
	var/list/component_types = types_of_component(/obj/item/weapon/stock_parts)
	for(var/path in component_types)
		var/obj/item/weapon/stock_parts/part = get_component_of_type(path)
		var/list/part_costs = part.building_cost()
		for(var/key in part_costs)
			.[key] += part_costs[key] * component_types[path]

/obj/item/weapon/stock_parts/building_material/building_cost()
	. = ..()
	for(var/obj/item/thing in materials)
		var/list/costs = thing.building_cost()
		for(var/key in costs)
			.[key] += costs[key]

/datum/fabricator_recipe/proc/build(var/turf/location, var/amount = 1)
	if(ispath(path, /obj/item/stack))
		new path(location, amount)
	else
		for(var/i = 1, i <= amount, i++)
			new path(location)