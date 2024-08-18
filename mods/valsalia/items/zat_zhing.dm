/obj/item/zat_zhing
	name = "Zat Zhing"
	icon = 'mods/valsalia/icons/zat_zhing.dmi'
	icon_state = "zatzhing"
	force = 1
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("whipped")
	hitsound = 'sound/weapons/towelwhip.ogg'
	desc = "A mysterious stone artefact, careful if you're human!"
	max_health = ITEM_HEALTH_NO_DAMAGE //un-fecking-breakable
	var/transform_impact_prob = 65
	var/transform_passive_prob = 10

	material = /decl/material/solid/stone/sandstone
	matter = list(
		/decl/material/liquid/mutagenics = MATTER_AMOUNT_REINFORCEMENT,
		/decl/material/solid/metal/uranium = MATTER_AMOUNT_REINFORCEMENT,
		/decl/material/liquid/blood = MATTER_AMOUNT_TRACE,
		/decl/material/solid/metal/copper = MATTER_AMOUNT_TRACE // zhe costs of one copper to buy :smugviz:s
	)
	origin_tech = @'{"engineering":7,"materials":7,"biotech":6, "esoteric":8}'

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

/obj/item/zat_zhing/proc/try_transform(mob/living/carbon/human/victim)
	if(victim.species.name != SPECIES_YINGLET)
		victim.worn_underwear = null
		victim.change_species(SPECIES_YINGLET)
		// zhis allows us to make sure each person turned into a yinglet may vary from base coloring
		var/color = pick(prob(20); rgb(171,140,101), prob(20); rgb(95,95,95), prob(10); rgb(8,8,8), prob(19); rgb(224, 217, 217), prob(18); rgb(102,51,0), prob(8); rgb(204,102,0), prob(5); rgb(192, 84, 192, 255))
		if(color == null){color = rgb(171,140,101)}
		victim.set_skin_colour(color)

		// add the marking for yinglets correctly, seem to be having trouble finding the correct method to apply markings to the marking list
		//var ears = pick(/decl/sprite_accessory/marking/yinglet/long_ears, /decl/sprite_accessory/marking/yinglet/short_ears)
		//var/obj/item/organ/external/E = GET_EXTERNAL_ORGAN(victim, tag)
		//E.set_sprite_accessory(ears, SAC_MARKINGS, color, skip_update = TRUE)
		//E.set_sprite_accessory(/decl/sprite_accessory/marking/yinglet/shelltooth, SAC_MARKINGS, "#cccccc", skip_update = TRUE)

		Destroy()