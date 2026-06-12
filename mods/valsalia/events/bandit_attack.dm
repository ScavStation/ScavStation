var/global/list/bandit_count = list() // Track spawned bandits by Z level

/datum/event/thug_attack
	announceWhen = 45
	endWhen = 75
	var/spawned_thugs = 0

/datum/event/thug_attack/setup()
	announceWhen = rand(30, 60)
	endWhen += severity * 25

/datum/event/thug_attack/tick()
	spawn_bandits()

/datum/event/thug_attack/start()
	// Initialize tracking for this event's Z levels
	for(var/Z in affecting_z)
		if(!bandit_count[num2text(Z)])
			bandit_count[num2text(Z)] = list()

/datum/event/thug_attack/announce()
	var/stealth_chance = 70 - 20*severity
	if(prob(stealth_chance))
		return
	var/naming
	switch(severity)
		if(EVENT_LEVEL_MUNDANE)
			naming = "stragglers"
		if(EVENT_LEVEL_MODERATE)
			naming = "group"
		if(EVENT_LEVEL_MAJOR)
			naming = "division"
	command_announcement.Announce("A bandit [naming] has been detected.")

/datum/event/thug_attack/proc/spawn_bandits()
	var/direction = pick(global.cardinal)
	var/Z = pick(affecting_z)

	var/n = rand(severity * 0.5, severity * 0.75)
	var/i = 0
	while(i < n)
		var/turf/T = get_random_edge_turf(direction, TRANSITIONEDGE + 2, Z)
		if(T && !T.density)
			var/mob/living/simple_animal/hostile/thug/M = new(T)
			events_repository.register(/decl/observ/death, M, src, TYPE_PROC_REF(/datum/event/thug_attack, reduce_bandit_count))
			events_repository.register(/decl/observ/destroyed, M, src, TYPE_PROC_REF(/datum/event/thug_attack, reduce_bandit_count))
			LAZYADD(bandit_count[num2text(Z)], M)
			spawned_thugs++
		i++
		if(i > 5)  // Limit per tick to prevent spawn lag
			break

/datum/event/thug_attack/end()
	log_debug("Bandit attack event spawned [spawned_thugs] bandits.")

/datum/event/thug_attack/proc/reduce_bandit_count(var/mob/M)
	for(var/Z in affecting_z)
		var/list/L = bandit_count[num2text(Z)]
		if(M in L)
			LAZYREMOVE(L, M)
			break
	events_repository.unregister(/decl/observ/death, M, src, TYPE_PROC_REF(/datum/event/thug_attack, reduce_bandit_count))
	events_repository.unregister(/decl/observ/destroyed, M, src, TYPE_PROC_REF(/datum/event/thug_attack, reduce_bandit_count))
