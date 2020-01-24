/datum/department/civilian
	name = "Enclave"
	flag = CIV
	goals = list(
		/datum/goal/department/matriarch_survive
	)

/datum/goal/department/matriarch_survive
	var/matriarch_fatalities


/datum/goal/department/matriarch_survive/New()
	..()

/datum/goal/department/matriarch_survive/update_strings()
	description = "Don't let the Matriarch die."

/datum/goal/department/matriarch_survive/get_summary_value()
	return " (PLACEHOLDER)"

/datum/goal/department/matriarch_survive/check_success()
	return (1) //not sure how to do this

/datum/department/service
	name = "Tradehouse Ivenmoth"
	flag = SRV
	goals = list(
		/datum/goal/department/company_profits
	)

/datum/goal/department/company_profits
	var/account_value_required

/datum/goal/department/company_profits/New()
	account_value_required = rand(5000,1000)
	..()

/datum/goal/department/company_profits/update_strings()
	description = "Exploit oppertunities as the arise to maximize profits. Atleast [account_value_required]T."

/datum/goal/department/company_profits/get_summary_value()
	return " (PLACEHOLDER)"

/datum/goal/department/company_profits/check_success()
	return (1) //not sure how to do this