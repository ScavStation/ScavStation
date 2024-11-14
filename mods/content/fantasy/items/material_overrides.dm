/obj/structure/gravemarker
	material = /decl/material/solid/organic/wood/walnut
	color =    /decl/material/solid/organic/wood/walnut::color

/obj/item/gravemarker
	material = /decl/material/solid/organic/wood/walnut
	color =    /decl/material/solid/organic/wood/walnut::color

// FRANCE ISN'T REAL
/obj/item/chems/drinks/bottle/champagne
	name = "sparkling wine bottle"

/decl/material/liquid/ethanol/champagne
	name       = "sparkling wine"
	glass_name = "sparkling wine"
	glass_desc = "Sparkling white wine, a favourite at noble and merchant parties."
	lore_text  = "Sparkling white wine, a favourite at noble and merchant parties."

/obj/item/chems/drinks/bottle/premiumwine
	name = "vintage Imperial white wine"
	desc = "An expensive-looking bottle of white wine, no doubt predating the fall of the Aegis, with the name of the city or settlement that produced it written on it."
	aged_min = 98
	aged_max = 420

/obj/item/chems/drinks/bottle/premiumwine/make_random_name()
	var/decl/language/hnoll/hnoll_language = GET_DECL(/decl/language/hnoll)
	return "bottle of vintage [hnoll_language.get_random_name(FEMALE, name_count = prob(20) ? 2 : 1)]"