/obj/item/zat_zhing
	name = "Zat Zhing"
	icon = 'mods/valsalia/icons/zat_zhing.dmi'
	icon_state = "zatzhing"
	_base_attack_force = 1
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("whipped")
	hitsound = 'sound/weapons/towelwhip.ogg'
	desc = "A mysterious stone artefact, careful if you're human!"
	max_health = ITEM_HEALTH_NO_DAMAGE //un-fecking-breakable
	var/transform_impact_prob = 65
	var/transform_passive_prob = 10

/obj/item/zat_zhing/equipped()
	. = ..()
	if(!is_processing)
		START_PROCESSING(SSobj, src)

/obj/item/zat_zhing/dropped()
	..()
	if(is_processing)
		STOP_PROCESSING(SSobj, src)

/obj/item/zat_zhing/Destroy()
	if(is_processing)
		STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/zat_zhing/Process()
	if(!ishuman(loc))
		return PROCESS_KILL
	if(prob(transform_passive_prob))
		try_transform(loc)

/obj/item/zat_zhing/throw_impact(atom/hit_atom)
	..()
	if(ishuman(hit_atom) && prob(transform_impact_prob))
		try_transform(hit_atom)

/obj/item/zat_zhing/proc/try_transform(mob/living/human/victim)
	if(victim.species.name != SPECIES_YINGLET)
		victim.worn_underwear = null
		victim.change_species(SPECIES_YINGLET)
		// zhis allows us to make sure each person turned into a yinglet may vary from base coloring
		var/color = pick(prob(20); rgb(171,140,101), prob(20); rgb(95,95,95), prob(10); rgb(8,8,8), prob(19); rgb(234,234,234), prob(18); rgb(102,51,0), prob(8); rgb(204,102,0), prob(5); rgb(155,51,155))
		if(color == null){color = rgb(171,140,101)}
		victim.set_skin_colour(color)
		//victim.UpdateAppearance()
		Destroy()