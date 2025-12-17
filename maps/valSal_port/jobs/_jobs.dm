/datum/map/valSal_port
	id_hud_icons            = 'maps/valSal_port/icons/hud.dmi'
	allowed_jobs            = list(
		/datum/job/valSal_port/visitor/traveller,
		/datum/job/valSal_port/visitor/traveller/learned,
		/datum/job/valSal_port/visitor/beggar_knight,
		/datum/job/valSal_port/local/miner,
		/datum/job/valSal_port/local/herbalist,
		/datum/job/valSal_port/local/forester,
/*		/datum/job/valSal_port/inn/storekeeper,
		/datum/job/valSal_port/inn/innkeeper,
		/datum/job/valSal_port/inn/inn_worker,
		/datum/job/valSal_port/inn/bartender,
		/datum/job/valSal_port/inn/farmer,*/
		/datum/job/valSal_port/caves/dweller,
		/datum/job/valSal_port/shrine/keeper,
		/datum/job/valSal_port/shrine/attendant,
		/datum/job/valSal_port/visitor/traveller/cleric
	)
	default_job_type = /datum/job/valSal_port/visitor/traveller
	default_department_type = /decl/department/valSal_port/visitors
	species_to_job_whitelist = list(
		/decl/species/grafadreka = list(
			/datum/job/valSal_port/caves/dweller,
			/datum/job/valSal_port/visitor/traveller
		)
	)
	job_to_species_blacklist = list(
		/datum/job/valSal_port/caves/dweller = list(
			/decl/species/human,
			/decl/species/hnoll
		),
	)
	species_to_job_blacklist = list(
		/decl/species/kobaloi = list(
			/datum/job/valSal_port/visitor/beggar_knight,
	//		/datum/job/valSal_port/inn/innkeeper,
			/datum/job/valSal_port/shrine/keeper,
			/datum/job/valSal_port/visitor/traveller/cleric
		)
	)

/decl/department/valSal_port
	abstract_type           = /decl/department/valSal_port
	noun                    = "faction"
	noun_adj                = "faction"
	announce_channel        = null

/datum/job/valSal_port
	abstract_type           = /datum/job/valSal_port
	department_types        = list(
		/decl/department/valSal_port/locals
	)
	min_skill               = list()
	// if you consider adding something like literacy to this list to make it rarer/more exclusive
	// consider making the higher levels cost more points instead
	max_skill               = list(
		SKILL_CHEMISTRY     = SKILL_BASIC, // this is the domain of the herbalist
	)
	skill_points            = 20
