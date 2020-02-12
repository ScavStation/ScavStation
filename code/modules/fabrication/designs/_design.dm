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
	var/max_amount = 1 // How many instances can be queued at once
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
		get_resources()
	if(ispath(path, /obj/item/stack))
		var/obj/item/stack/stack = path
		max_amount = max(1, initial(stack.max_amount))

/datum/fabricator_recipe/proc/get_resources()
	resources = list()
	var/obj/item/I = new path
	var/list/building_cost = I.building_cost()
	for(var/path in building_cost)
		if(!ignore_materials[path])
			resources[path] = building_cost[path] * FABRICATOR_EXTRA_COST_FACTOR
	qdel(I)

/obj/proc/get_matter_multiplier()
	. = w_class

/obj/item/stack/get_matter_multiplier()
	. = amount

/obj/proc/get_matter()
	var/material/mat = get_material()
	. = mat ? mat.get_matter() : list()
	var/mult = Clamp(get_matter_multiplier(), 1, 10)
	for(var/mat_type in .)
		.[mat_type] *= mult
	// TODO trace materials, additional materials.

/obj/proc/building_cost()
	. = get_matter() || list()
	if(reagents && length(reagents.reagent_list))
		for(var/datum/reagent/R in reagents.reagent_list)
			.[R.type] = R.volume

/datum/fabricator_recipe/proc/build(var/turf/location, var/amount = 1)
	if(ispath(path, /obj/item/stack))
		new path(location, amount)
	else
		for(var/i = 1, i <= amount, i++)
			new path(location)