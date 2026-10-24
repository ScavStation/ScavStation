// A dumb joke prop mob for admin fun. Not on any spawn table, vendor, or loot list - admin-spawn only.
/mob/living/simple_animal/admeme_thanos
	name = "Thanos"
	desc = "Perfectly balanced, as all things should be."
	icon = 'mods/valsalia/icons/misc/admeme_thanos.dmi'
	icon_state = "standing_twerk"
	is_spawnable_type = TRUE // so it shows up in the admin "spawn atom by name" search
	density = TRUE
	max_health = 100
	speak_emote = list("grins")

/mob/living/simple_animal/admeme_thanos/Initialize()
	. = ..()
	icon_state = pick("standing_twerk", "crouch_twerk")
