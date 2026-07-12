
/obj/item/stack/material/rods/attack_self(mob/user)
	if(user.a_intent == I_GRAB)
		list_recipes(user)
		add_fingerprint(user)
		return TRUE
	add_fingerprint(user)
	if(isturf(user.loc))
		place_grille(user, user.loc, src)


/obj/item/stack/material/rods
	crafting_stack_type = /obj/item/stack/material/rods


/obj/item/stack/material/rods/cyborg
	name = "metal rod synthesizer"
	desc = "A device that makes metal rods."
	gender = NEUTER
	matter = null
	material = /decl/material/solid/metal/steel
	uses_charge = 1
	charge_costs = list(500)
	max_health = ITEM_HEALTH_NO_DAMAGE
	is_spawnable_type = FALSE
	crafting_stack_type = /obj/item/stack/material/rods

/obj/item/stack/material/rods/cyborg/attack_self(mob/user)
	var/list/recipes

	if(!user?.client)
		return

	recipes = get_stack_recipes(get_material(), get_reinforced_material(), crafting_stack_type, user?.get_active_held_item()?.get_best_tool_archetype())

	var/list/dat = list()

	var/popup_title
	var/datum/stack_recipe_list/recipe_list = recipes
	if (istype(recipe_list))
		popup_title = "Crafting [recipe_list.name] with \the [src]"
		dat += "<p><a href='byond://?src=\ref[src];back=1'>Back</a></p>"
		recipes = recipe_list.recipes
	else if(islist(recipes) && length(recipes))
		popup_title = "Crafting with \the [src]"
	else
		return

	dat += "<p>[capitalize(plural_name)] left: [get_amount()]</p>"
	dat += "<table border = '1px' padding = '1px' style = 'margin-left: auto; margin-right: auto;'>"
	dat += "<tr><th width = '150px'>Product</th><th width = '75px'>Cost</th><th width = '75px'>Time</th><th width = '200px'>Required skill</th><th width = '200px'>Amount to craft</tr>"
	var/list/recipe_strings = list()
	for(var/thing in recipes)
		if(istype(thing, /decl/stack_recipe))
			var/decl/stack_recipe/recipe = thing
			recipe_strings[recipe.name] = recipe.get_list_display(user, src, recipe_list)
		else if(istype(thing, /datum/stack_recipe_list))
			var/datum/stack_recipe_list/sub_recipe_list = thing
			recipe_strings[sub_recipe_list.name] = sub_recipe_list.get_list_display(user, src)
	for(var/recipe_name in sortTim(recipe_strings.Copy(), /proc/cmp_text_asc))
		dat += recipe_strings[recipe_name]
	dat += "</table>"

	var/datum/browser/popup = new(user, "stack_crafting", popup_title, 800, 800)
	popup.set_content(JOINTEXT(dat))
	popup.open()
