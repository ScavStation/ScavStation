/datum/department
	var/title = "Undefined" //Player facing. Can be changed freely without breaking code or updating refrences in jobs.
	var/refrence = "undefined" //code facing. Jobs refrence their department by this.
	var/list/goals = list() 
	var/announce_channel = "Common" //The Channel for spawn annoncement. Leave as common if unsure. The channel will be selected based of the first deparment listed in a jobs .department_refs