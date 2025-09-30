var/global/notifiednullmatter = 0
var/global/notifiedend = 0
var/global/ruinstate = 0
/decl/public_access/public_method/triggerNM
	name = "activate NM"
	desc = "activate NM if possible."
	call_proc = TYPE_PROC_REF(/obj/machinery/power/supermatter/nullmatter, activate)


/decl/stock_part_preset/radio/receiver/nullmatter
	frequency = BUTTON_FREQ
	receive_and_call = list("button_active" = /decl/public_access/public_method/triggerNM)




/datum/map_template/ruin/exoplanet/summit
	name = "The Summit"
	description = "Temporal Anomaly"
	suffixes = list("summit/summit.dmm")
	cost = 2
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS
	template_tags = TEMPLATE_TAG_ALIEN
	apc_test_exempt_areas = list(
		/area/map_template/summit = NO_SCRUBBER|NO_VENT,
		/area/map_template/summit/cold = NO_SCRUBBER|NO_VENT
		)
// Areas //


/area/map_template/summit
	name = "\improper Summit Stone"
	icon_state = "main"
	icon = 'maps/random_ruins/exoplanet_ruins/summit/summit.dmi'

/area/map_template/summit/cold
	name = "\improper Summit Snow"
	icon_state = "cold"



// Enemies //

/mob/living/simple_animal/aggressive/avianborg
	name = "Avian Cyborg"
	desc = "An avian converted into a murderous cyborg. It has an embossed nametag with what appears to be a serial number on it:M-M-0103-D17."
	icon = 'maps/random_ruins/exoplanet_ruins/summit/summitA.dmi'

	base_animal_type = /mob/living/simple_animal/aggressive/avianborg
	max_health = 100
	natural_weapon = /obj/item/natural_weapon/beak
	unsuitable_atmos_damage = 5
	projectilesound = 'sound/weapons/taser2.ogg'
	projectiletype = /obj/item/projectile/beam/smalllaser
	faction = "Awkrax Contingent"
	ai = /datum/mob_controller/aggressive/avianborg
	var/corpse = /obj/abstract/landmark/corpse/avianborg
	var/weapon = /obj/item/gun/energy/gun
	death_message = "crumples to the ground in a heap."
	speak_emote = list("chirps", "wheezes")
	blood_type = "O-"
	fire_desc = "stares vacantly, mouths a plea, and fires!"



/mob/living/simple_animal/aggressive/avianborg/has_ranged_attack()
	return TRUE

/datum/mob_controller/aggressive/avianborg
	speak_chance = 15
	turns_per_wander = 5
	stop_wander_when_pulled = 0
	can_escape_buckles = TRUE
	emote_see = list("reaches a claw out pleadingly, shudders violently, and charges their weapon")
	emote_speech = list("H...el..p...", "T.he...cr..y.st...a..l...!", "Make... it... st...op...", "I... Cannot... s..stop...", "HhHhHEEeeLLP...!!!!", "uuhHHHHaahh...", "I... ne..ed... med..ic..al...", "I... thou..ght... you... d-died...", "Get... it out...!!!", "O-oh n-no.... N-no...", "Kar...la...w.a....", "Wh...ere... am... I...??", "Huuhnnhn...!!!", "Sh...ar...d...s...", "St...f... a-ah...!!!", "Chrr..p...!!!", "Scrreerrk...!!", "Uunnh...")
	emote_hear = list("squawks and wheezes")
	break_stuff_probability = 0


/mob/living/simple_animal/aggressive/avianborg/death(gibbed)
	. = ..()
	if(. && !gibbed)
		if(weapon)
			new weapon(loc)

/obj/abstract/landmark/corpse/avianborg
	name = "Dead Avian Cyborg"








/mob/living/simple_animal/aggressive/yingborg
	name = "Yinglet Cyborg"
	desc = "A yinglet converted into a murderous cyborg. It has an embossed nametag with what appears to be a serial number on it:VYN-IT0-UNK."
	icon = 'maps/random_ruins/exoplanet_ruins/summit/summitB.dmi'

	base_animal_type = /mob/living/simple_animal/aggressive/yingborg
	max_health = 75
	natural_weapon = /obj/item/natural_weapon/bite/strong
	unsuitable_atmos_damage = 5
	projectilesound = 'sound/weapons/gunshot/gunshot3.ogg'
	projectiletype = /obj/item/projectile/bullet/pistol/strong
	faction = "Awkrax Contingent"
	ai = /datum/mob_controller/aggressive/yingborg
	var/corpse = /obj/abstract/landmark/corpse/yingborg
	var/weapon = /obj/item/gun/projectile/revolver
	death_message = "falls apart like a pile of twigs."
	speak_emote = list("shrieks", "sputters")
	blood_type = "O-"
	fire_desc = "struggles momentarily, then takes aim and fires!"


/mob/living/simple_animal/aggressive/yingborg/has_ranged_attack()
	return TRUE

/datum/mob_controller/aggressive/yingborg
	speak_chance = 10
	turns_per_wander = 3
	stop_wander_when_pulled = 0
	can_escape_buckles = FALSE
	emote_see = list("unsteadily raises their weapon")
	emote_speech = list("Zhis... is not...", "wh...y... w..hy...?", "I... cannot... sto...p... i...t...", "Zh...e... wrong... time...", "uuhHHnnnhHHaahh...", "S...te...f..f..a...", "I... c...ca.n.no.t... g...give... in...", "R...run...!!!", "Oh... no... no... n...o... no....!!!", "B.....zh..re.e...", "W..hy... am... I... stil.l...a.l.i..v..e...?", "M...aw...re...e...k... n..no....", "h..hi..t... z...zhe... but..ton...", "NNghh...", "W...w.eh...", "Ple..as..e...")
	emote_hear = list("gasps audibly")
	break_stuff_probability = 0



/mob/living/simple_animal/aggressive/yingborg/death(gibbed)
	. = ..()
	if(. && !gibbed)
		if(weapon)
			new weapon(loc)

/obj/abstract/landmark/corpse/yingborg
	name = "Dead Yinglet Cyborg"





/mob/living/simple_animal/aggressive/humborg
	name = "Human Cyborg"
	desc = "A human converted into a murderous cyborg. It has an embossed nametag with what appears to be a serial number on it:STLY-ALS-F."
	icon = 'maps/random_ruins/exoplanet_ruins/summit/summitC.dmi'

	base_animal_type = /mob/living/simple_animal/aggressive/humborg
	max_health = 150
	natural_weapon = /obj/item/natural_weapon/claws/weak
	unsuitable_atmos_damage = 5
	projectilesound = 'sound/weapons/gunshot/shotgun.ogg'
	projectiletype = /obj/item/projectile/bullet/shotgun
	faction = "Awkrax Contingent"
	ai = /datum/mob_controller/aggressive/humborg
	var/corpse = /obj/abstract/landmark/corpse/humborg
	var/weapon = /obj/item/gun/projectile/shotgun/quadbarrel
	death_message = "crumples to the ground with a series of sickening cracks."
	speak_emote = list("moans", "sobs")
	blood_type = "O-"
	fire_desc = "listlessly fires their weapon!"


/mob/living/simple_animal/aggressive/humborg/has_ranged_attack()
	return TRUE

/datum/mob_controller/aggressive/humborg
	speak_chance = 5
	turns_per_wander = 8
	stop_wander_when_pulled = 0
	can_escape_buckles = FALSE
	emote_see = list("awkwardly aims their gun")
	emote_speech = list("Hhnnngnn...", "Mmaww...r..e..e..k..", "I... F..a...il..ed...", "S..so... t...thi..s... is... what... I..", "V...ay....rnnhhghh....", "Wh...ho... am... I...", "S..s..or..r.y...", "...dese..rve... t.h..is...", "I... kn...ew... I... w.a.s... a... mm..mon...st...err..", "mm..my... b...bon..es.... th...ey.... hu..rt...", "...I... do...not... dese..erv...e... d..e..a...th...", "...It...hurts... it...hurts......", "Mm...om... d...dad...", "S.or..ry... lit.tl.e...b.ro.t..h.er...Nghh!", "Uaghh...!!!", "..aAAuhh..hu... au...!")
	emote_hear = list("sobs intensely")
	break_stuff_probability = 0



/mob/living/simple_animal/aggressive/humborg/death(gibbed)
	. = ..()
	if(. && !gibbed)
		if(weapon)
			new weapon(loc)

/obj/abstract/landmark/corpse/humborg
	name = "Dead Human Cyborg"






/mob/living/simple_animal/aggressive/robosharah
	name = "The Sharah Ultimatum"
	desc = "...Oh shards."
	icon = 'maps/random_ruins/exoplanet_ruins/summit/summitD.dmi'
	base_animal_type = /mob/living/simple_animal/aggressive/robosharah
	max_health = 10000
	natural_weapon = /obj/item/natural_weapon/giant
	unsuitable_atmos_damage = 50
	projectilesound = 'sound/weapons/railgun.ogg'
	projectiletype = /obj/item/projectile/bullet/magnetic/slug
	faction = "Awkrax Contingent"
	ai = /datum/mob_controller/aggressive/robosharah
	var/corpse = /obj/abstract/landmark/corpse/robosharah
	var/weapon = /obj/item/gun/magnetic/railgun
	death_message = "explodes, a cacophony of shearing metal and screaming yinglet filling your ears!!"
	speak_emote = list("screams", "shrieks", "rants")
	blood_type = "O-"
	fire_desc = "starts blasting!!!"
	butchery_data = /decl/butchery_data/synthetic
	var/sound_id
	var/datum/sound_token/sound_token
	var/datum/track/song_to_play = new/datum/track("DEMON PUNCHER", /decl/music_track/DEMON_PUNCHER)
	var/music_volume = 100

/mob/living/simple_animal/aggressive/robosharah/proc/timerfun()
	if(global.ruinstate)
		max_health = 10
		explosion(src, 2, 2, 2, 2, 1)


/mob/living/simple_animal/aggressive/robosharah/Initialize()
	if(global.ruinstate)
		max_health = 10
	. = ..() // Does all the normal init stuff
	sound_id = "[/mob/living/simple_animal/aggressive/robosharah]_[sequential_id(/mob/living/simple_animal/aggressive/robosharah)]"
	addtimer(CALLBACK(src, PROC_REF(timerfun)), 10 MINUTE)



/mob/living/simple_animal/aggressive/robosharah/isSynthetic()
	return TRUE



/mob/living/simple_animal/aggressive/robosharah/has_ranged_attack()
	return TRUE

/mob/living/simple_animal/aggressive/robosharah/shoot_at(var/atom/target, var/atom/start)
	log_debug("Robosharah Shooting")
	if(!sound_token)
		sound_token = play_looping_sound(src, sound_id, song_to_play.GetTrack(), volume = music_volume, range = 30, falloff = 5, prefer_mute = FALSE, preference = /datum/client_preference/play_game_music, streaming = TRUE)

	. = ..()

/datum/mob_controller/aggressive/robosharah
	speak_chance = 20
	turns_per_wander = 3
	stop_wander_when_pulled = 0
	can_escape_buckles = TRUE
	emote_see = list("turns abruptly and aims their cannon")
	emote_speech = list("I. SEE. YOU!!!", "I WILL STOP DA FUTURE!!! DA BIRD GAVE ME DA POWER!!!", "YOU DO NOT FOOL ME!!!", "I KNOW DA TROOF!!!", "DIE, TIMESTEALERS!!!", "I WILL USE YOUR BLOOD TO LUBE DA FLOORS!!!", "EAT DIS!!!", "I AM POWERFUL. I AM BIG. I WILL STOP DA BAD FUTURE!!!", "DA FUTUUUUURE!!!!", "YOU WILL ALL SEE, ALL WILL SEE, I WILL STOP DIS MADNESS!!!", "YOU WILL HELP ME DEAD OR ALIVE!!! YOU WILL SAVE DA FUTURE, JUST LIKE DA REST!!!", "BOW TO YOUR MATRIARCH!!!", "HOLOGRAMS! LIES!! DA QUANTA OF REALITY IS FULL OF HOLES!!! I WILL PLUG DOZE HOLES - WIDH BULLETS!!!", "HOW ARE YOU SO INTACT? I DHOT- NO, YOU ARE PHANTOMS! DIE!!!", "I NEED TO OPEN DA GATE. I NEED TO STOP DA FUTURE!! I WILL NOT LET YOU STOP ME!!!","GggrrraaaaaaaaAAAA!!!!","EEEEEEEEEEEEE!!!!","YOU CANNOT RUN FROM DA FUTURE, COWARDS!!!","YOU ARE NUFFIN BEFORE MY MIGHT!!!","STOP RESISTING ME AND START RESISTING DA FUTURE!!!","WHY DO YOU WANT DIS!? NNRRRAAAAAUUGHH!!!","I REFUSE TO LET YOU KILL DA FUTURE!!!","STOP. STRUGGLING!!!","I WILL TAKE GOOD CARE OF YOU, IF YOU WOULD ONLY JUST. LET. MY. BULLETS. EXPLODE. YOU!!!","STOP MOVING SO I CAN HIT YOU!!!","I KNEW I SHOULDA LUBED DA FLOOR IN HERE!!!","FECK!!!","YOU GONNA REGRET WHATEVER YOU JUST DID JUST NOW!!!","HHRRAAAUGHHH!!!!","YOU DO NOT KNOW DA DEPPS OF MY RAGE RIGHT NOW!!!","I HAVE ENOUGH SPARE PARTS TO REBUILD YOU, STOP RESISTING!!!","WHY ARE YOU NOT HELPING ME!? WE WERE SUPPOSED TO- WHY HAVE YOU BETRAYED ME!? DIE TRAITOR!! DIE FOR YOUR MATRIARCH!!!", "WWRRRRYYYYYYYYYYYYY!!!!!!")
	emote_hear = list("scans the room.")
	break_stuff_probability = 5



/mob/living/simple_animal/aggressive/robosharah/death(gibbed)
	. = ..()
	if(. && !gibbed)
		if(weapon)
			new weapon(loc)
		QDEL_NULL(sound_token)

/obj/abstract/landmark/corpse/robosharah
	name = "Scrap Metal"
	icon = 'maps/random_ruins/exoplanet_ruins/summit/summitD.dmi'
	icon_state = "world-dead"
	var/butchery_data = /decl/butchery_data/synthetic  //not sure if correct, check to make sure

/obj/abstract/landmark/corpse/robosharah/randomize_appearance()
	return


//Things //

/obj/structure/closet/crate/secure/large/supermatter/experimentalsm // Borrowed from Unishi
	name = "experimental SM crate"
	desc = "It feels faintly warm to the touch."

/obj/structure/closet/crate/secure/large/supermatter/experimentalsm/WillContain() // Borrowed from Unishi
	return list(/obj/machinery/power/supermatter/randomsample)

/obj/machinery/power/supermatter/randomsample // Borrowed from Unishi
	name = "experimental supermatter sample"
	icon = 'icons/obj/supermatter_32.dmi'
	icon_state = "supermatter_shard"

/obj/machinery/power/supermatter/randomsample/Initialize() // Borrowed from Unishi
	. = ..()
	nitrogen_retardation_factor = rand(0.01, 1)	  //Higher == N2 slows reaction more
	thermal_release_modifier = rand(100, 1000000) //Higher == more heat released during reaction
	product_release_modifier = rand(0, 100000)    //Higher == less product gas released by reaction
	oxygen_release_modifier = rand(0, 100000)     //Higher == less oxygen released at high temperature/power
	radiation_release_modifier = rand(0, 100)     //Higher == more radiation released with more power.
	reaction_power_modifier =  rand(0, 100)       //Higher == more overall power

	power_factor = rand(0, 20)
	decay_factor = rand(50, 70000)			//Affects how fast the supermatter power decays
	critical_temperature = rand(3000, 5000)	//K
	charging_factor = rand(0, 1)
	damage_rate_limit = rand( 1, 10)		//damage rate cap at power = 300, scales linearly with power
//nullmatter

/obj/machinery/power/supermatter/nullmatter
	name = "nullmatter condensate"
	desc = "Nothing. Absolute physical nothing that ought to be impossible to exist. Your head hurts."
	icon = 'icons/obj/singularity.dmi'
	icon_state = "singularity_s1"
	explosion_point = 150;
	emergency_point = 125;
	critical_temperature = 1250;
	decay_factor = 250;
	emergency_alert = "INTRATEMPORAL PARADOX DETECTED. EVACUATE IMMEDIATELY.";
	safe_alert = null;
	warning_alert = "Warning! Intratemporal strain detected! Power Down all singularity generators immediately!";
	id_tag = "selfd";
	base_color = "#000000";
	color = "#000000";
	light_color = "#000000";
	blood_color = "#000000";
	emagged = 1;
	sharp = 1;
	edge = 1;
	explosion_resistance = 80;
	explosion_power = 2;
	animate_movement = 0;
	light_range = null;
	light_power = null;
	temperature = 75;
	debug = 0
	disable_adminwarn = TRUE
	var/timer = 30 //minutes
	var/started = 0
	stock_part_presets = list(/decl/stock_part_preset/radio/receiver/nullmatter = 1)
	uncreated_component_parts = list(
		/obj/item/stock_parts/radio/receiver/buildable,
		/obj/item/stock_parts/power/apc/buildable
		)
	public_methods = list(
		/decl/public_access/public_method/triggerNM)


/obj/machinery/power/supermatter/nullmatter/proc/activate()

	if(!global.ruinstate)
		damage = 0
		started = 1
		var/obj/effect/overmap/visitable/location = global.overmap_sectors[num2text(z)]
		if(!global.notifiednullmatter)
			priority_announcement.Announce("WARNING! Spatial anomaly detected at [location]!", new_sound = sound('sound/effects/cascade.ogg', volume = 35))
			global.notifiednullmatter = 1
	else
		if(!global.notifiednullmatter)
			to_world("Suddenly, you feel a wave of wrongness wash over you - then fade just as quickly, replaced with a sense of euphoric calm. The frayed edges of reality are healing.")
			global.notifiednullmatter = 1
		global.notifiedend = 1
		explosion(src, 3, 4, 5, 6, 1)
		qdel(src)

/obj/machinery/power/supermatter/nullmatter/proc/stateroll()
	if(!global.ruinstate)
		var/i = rand(1, 10)
		if(i >= 5)
			global.ruinstate = 1

/obj/machinery/power/supermatter/nullmatter/Initialize(mapload)
	. = ..()
	stateroll()
	started = 0
	addtimer(CALLBACK(src, PROC_REF(activate)), timer MINUTE)

/obj/machinery/power/supermatter/nullmatter/Process()
	if(!started)
		return
	else
		. = ..()

/obj/machinery/power/supermatter/nullmatter/explode()
	. = ..()
	if(!global.notifiedend)
		global.notifiedend = 1
		to_world("Suddenly, you feel a wave of wrongness wash over you, then fade just as quickly. Something horrific has been silenced.")

/obj/machinery/power/supermatter/nullmatter/explosion_act()
	SHOULD_CALL_PARENT(FALSE)
	currently_exploding = FALSE
