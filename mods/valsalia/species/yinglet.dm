// Semi-adapted from Polaris Teshari.
/decl/species/yinglet
	name = SPECIES_YINGLET
	name_plural = "Yinglets"
	description = "A species of short, slender rat-birds with a fondness for clams. Commonly found wherever humans are, \
	either scavenging amongst their leavings, or benefiting from adjacency to an older and more developed culture."
	base_external_prosthetics_model = /decl/bodytype/prosthetic/ying/wooden
	base_internal_prosthetics_model = /decl/bodytype/prosthetic/ying/metal
	autohiss_basic_map = list(
		"th" = list("z")
	)

	autohiss_extra_map = list(
		"th" = list("d")
	)

	preview_outfit = /decl/outfit/job/yinglet/assistant
	gluttonous = GLUT_SMALLER | GLUT_ITEM_TINY
	metabolism_mod = 1.25

	available_bodytypes = list(
		/decl/bodytype/yinglet/masculine,
		/decl/bodytype/yinglet/hairymasculine,
		/decl/bodytype/yinglet,
		/decl/bodytype/prosthetic/ying/metal/fbp,
		/decl/bodytype/prosthetic/ying/metal/fbp/masculine
	)

	unarmed_attacks = list(
		/decl/natural_attack/punch/weak,
		/decl/natural_attack/stomp/weak,
		/decl/natural_attack/bite
	)

	flesh_color = "#ab8c65"
	spawn_flags = SPECIES_CAN_JOIN
	bump_flag = MONKEY
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL|ALIEN

	total_health = 150
	brute_mod = 1.25
	burn_mod =  1.25
	holder_type = /obj/item/holder/human/yinglet
	blood_volume = 350
	hunger_factor = 0.1
	inherent_verbs = list(/mob/living/proc/hide)
	toxins_mod = 0.65

	available_background_info = list(
		/decl/background_category/heritage =  list(
			/decl/background_detail/heritage/yinglet,
			/decl/background_detail/heritage/yinglet/valsalian,
			/decl/background_detail/heritage/yinglet/tribal,
			/decl/background_detail/heritage/yinglet/void,
			/decl/background_detail/heritage/other
		),
		/decl/background_category/homeworld = list(
			/decl/background_detail/location/yingletacrology,
			/decl/background_detail/location/tradehousespace,
			/decl/background_detail/location/stateless
		),
		/decl/background_category/faction =   list(
			/decl/background_detail/faction/enclave_scav,
			/decl/background_detail/faction/tradehouse_scav,
			/decl/background_detail/faction/exiled_scav,
			/decl/background_detail/faction/wanderer
		),
		/decl/background_category/religion =  list(
			/decl/background_detail/religion/dinnaism,
			/decl/background_detail/religion/veil_worship,
			/decl/background_detail/religion/angel_worship,
			/decl/background_detail/religion/ancestor_worship,
			/decl/background_detail/religion/faithless,
		)
	)

	traits = list(
		/decl/trait/mollusc_lover = TRAIT_LEVEL_EXISTS,
		/decl/trait/gluten_allergy = TRAIT_LEVEL_EXISTS
	)

/decl/species/yinglet/get_root_species_name(mob/living/human/H)
	return SPECIES_YINGLET

/decl/species/yinglet/skills_from_age(age)
	switch(age)
		if(0 to 2)
			. = -2
		if(3 to 10)
			. = 0
		if(11 to 16)
			. = 4
		else
			. = 8

/decl/species/yinglet/handle_additional_hair_loss(var/mob/living/human/H, var/defer_body_update = TRUE)
	. = H && H.set_skin_colour(rgb(189, 171, 143))

/decl/species/yinglet/get_autohiss_map(var/mode)
	if(mode == PREF_FULL)
		. = autohiss_extra_map?.Copy()
	else
		. = autohiss_basic_map?.Copy()
	if(!islist(.))
		. = list()

/decl/species/yinglet/equip_default_fallback_uniform(var/mob/living/human/H)
	return

/obj/item/holder/yinglet
	sharp = 1
	edge = 1

/obj/item/holder/yinglet/Initialize()
	. = ..()
	set_extension(src, /datum/extension/tool, list(TOOL_CROWBAR = TOOL_QUALITY_MEDIOCRE))

/obj/item/holder/human/yinglet/attack_self(mob/user)
	var/mob/owner = locate() in contents
	if(owner.stat != DEAD)
		var/turf/T = get_turf(owner)
		T.visible_message(SPAN_WARNING("\icon[owner] Eee!"))
		playsound(T, 'sound/effects/mousesqueek.ogg', 75, 1)
		user.setClickCooldown(15)
		return TRUE
	. = ..()

/obj/item/organ/internal/liver/yinglet
	scale_max_damage_to_species_health = FALSE
	min_bruised_damage = 30
	min_broken_damage = 60
	max_damage = 85

/obj/item/organ/internal/kidneys/yinglet
	scale_max_damage_to_species_health = FALSE
	min_bruised_damage = 30
	min_broken_damage = 60
	max_damage = 85
