/datum/job/
	var/required_gender


/datum/job/check_special_blockers(var/datum/preferences/prefs)
	if(required_gender && prefs.gender != required_gender)
		. = "[required_gender] only"
