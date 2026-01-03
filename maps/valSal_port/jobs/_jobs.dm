/datum/map/valSal_port
	id_hud_icons = 'maps/valSal_port/icons/hud.dmi'
	allowed_jobs = list(
		/datum/job/valSal_port/enclave/matriarch,
		/datum/job/valSal_port/enclave/patriarch,
		/datum/job/valSal_port/enclave/daughter,
		/datum/job/valSal_port/enclave/digger,
		/datum/job/valSal_port/enclave/reedtender,
		/datum/job/valSal_port/enclave/scout,
		/datum/job/valSal_port/enclave/hunter,
		/datum/job/valSal_port/enclave/idiot,
		/datum/job/valSal_port/tradehouse/surveyor,
		/datum/job/valSal_port/tradehouse/generalrecruit,
		/datum/job/valSal_port/visitor/traveller,
		/datum/job/valSal_port/visitor/traveller/learned,
		/datum/job/valSal_port/visitor/warrior,
		/datum/job/valSal_port/visitor/traveller/merchant
	)

	default_job_type = /datum/job/valSal_port/visitor/traveller
	default_department_type = /decl/department/valSal_port/visitors
	species_to_job_whitelist = list(
		/decl/species/grafadreka = list(
			/datum/job/valSal_port/visitor/traveller
		)
	)

	job_to_species_blacklist = list(

	)

	species_to_job_blacklist = list(
		/decl/species/kobaloi = list(
			/datum/job/valSal_port/visitor/warrior,
			/datum/job/valSal_port/tradehouse/surveyor,
			/datum/job/valSal_port/tradehouse/generalrecruit,
			/datum/job/valSal_port/visitor/traveller/merchant,
			/datum/job/valSal_port/visitor/traveller,
		  	/datum/job/valSal_port/visitor/traveller/learned,
			/datum/job/valSal_port/enclave/matriarch,
			/datum/job/valSal_port/enclave/patriarch,
			/datum/job/valSal_port/enclave/daughter,
			/datum/job/valSal_port/enclave/digger,
			/datum/job/valSal_port/enclave/reedtender,
			/datum/job/valSal_port/enclave/scout,
			/datum/job/valSal_port/enclave/hunter,
			/datum/job/valSal_port/enclave/idiot
		),
		/decl/species/hnoll = list(
			/datum/job/valSal_port/visitor/warrior,
			/datum/job/valSal_port/tradehouse/surveyor,
			/datum/job/valSal_port/tradehouse/generalrecruit,
			/datum/job/valSal_port/visitor/traveller/merchant,
			/datum/job/valSal_port/visitor/traveller,
		  	/datum/job/valSal_port/visitor/traveller/learned,
			/datum/job/valSal_port/enclave/matriarch,
			/datum/job/valSal_port/enclave/patriarch,
			/datum/job/valSal_port/enclave/daughter,
			/datum/job/valSal_port/enclave/digger,
			/datum/job/valSal_port/enclave/reedtender,
			/datum/job/valSal_port/enclave/scout,
			/datum/job/valSal_port/enclave/hunter,
			/datum/job/valSal_port/enclave/idiot
		),
		/decl/species/grafadreka = list(
			/datum/job/valSal_port/visitor/warrior,
			/datum/job/valSal_port/tradehouse/surveyor,
			/datum/job/valSal_port/tradehouse/generalrecruit,
			/datum/job/valSal_port/visitor/traveller/merchant,
			/datum/job/valSal_port/visitor/traveller,
		  	/datum/job/valSal_port/visitor/traveller/learned,
			/datum/job/valSal_port/enclave/matriarch,
			/datum/job/valSal_port/enclave/patriarch,
			/datum/job/valSal_port/enclave/daughter,
			/datum/job/valSal_port/enclave/digger,
			/datum/job/valSal_port/enclave/reedtender,
			/datum/job/valSal_port/enclave/scout,
			/datum/job/valSal_port/enclave/hunter,
			/datum/job/valSal_port/enclave/idiot
		),
		/decl/species/human = list(
			/datum/job/valSal_port/enclave/matriarch,
			/datum/job/valSal_port/enclave/patriarch,
			/datum/job/valSal_port/enclave/daughter,
			/datum/job/valSal_port/enclave/digger,
			/datum/job/valSal_port/enclave/reedtender,
			/datum/job/valSal_port/enclave/scout,
			/datum/job/valSal_port/enclave/hunter,
			/datum/job/valSal_port/enclave/idiot
		),
		/decl/species/baxxid = list(
			/datum/job/valSal_port/enclave/matriarch,
			/datum/job/valSal_port/enclave/patriarch,
			/datum/job/valSal_port/enclave/daughter,
			/datum/job/valSal_port/enclave/digger,
			/datum/job/valSal_port/enclave/reedtender,
			/datum/job/valSal_port/enclave/scout,
			/datum/job/valSal_port/enclave/hunter,
			/datum/job/valSal_port/enclave/idiot
		),
		/decl/species/indrel = list(
			/datum/job/valSal_port/enclave/matriarch,
			/datum/job/valSal_port/enclave/patriarch,
			/datum/job/valSal_port/enclave/daughter,
			/datum/job/valSal_port/enclave/digger,
			/datum/job/valSal_port/enclave/reedtender,
			/datum/job/valSal_port/enclave/scout,
			/datum/job/valSal_port/enclave/hunter,
			/datum/job/valSal_port/enclave/idiot
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
		/decl/department/valSal_port/yinglets
	)
	min_skill               = list()
	// if you consider adding something like literacy to this list to make it rarer/more exclusive
	// consider making the higher levels cost more points instead
	max_skill               = list(
		SKILL_CHEMISTRY     = SKILL_BASIC, // this is the domain of the herbalist
	)
	skill_points            = 20
