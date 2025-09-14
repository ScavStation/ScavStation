/obj/item/clothing/tail/glove
	name = "yinglet tail glove"
	desc = "A nitrile tail covering, sterile!"
	icon = 'mods/valsalia/icons/clothing/accessories/tailglove.dmi'
	bodytype_equip_flags = BODY_FLAG_YINGLET

/obj/item/clothing/tail/bells
	name = "tail bells"
	desc = "A set of lightweight, jangly tail bells."
	icon = 'mods/valsalia/icons/clothing/accessories/tailbells.dmi'
	gender = PLURAL
	bodytype_equip_flags = BODY_FLAG_YINGLET
	material = /decl/material/solid/metal/gold
	obj_flags = OBJ_FLAG_HOLLOW
	var/tmp/dingaling_sound = list(
		'mods/valsalia/sounds/dingaling1.ogg',
		'mods/valsalia/sounds/dingaling2.ogg',
		'mods/valsalia/sounds/dingaling3.ogg',
		'mods/valsalia/sounds/dingaling4.ogg'
	)
	var/tmp/dingaling_volume = 80
	var/tmp/dingaling_chance = 30
	var/tmp/dingaling_vary = FALSE

/obj/item/clothing/tail/bells/Initialize()
	. = ..()
	if(dingaling_sound && dingaling_chance)
		events_repository.register(/decl/observ/moved, src, src, .proc/dingaling)

/obj/item/clothing/tail/bells/Destroy()
	events_repository.unregister(/decl/observ/moved, src, src)
	return ..()

/obj/item/clothing/tail/bells/proc/dingaling()
	if(dingaling_sound && prob(dingaling_chance))
		if(islist(dingaling_sound) && length(dingaling_sound))
			playsound(get_turf(src), pick(dingaling_sound), dingaling_volume, dingaling_vary)
		else
			playsound(get_turf(src), dingaling_sound, dingaling_volume, dingaling_vary)
