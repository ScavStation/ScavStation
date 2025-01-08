/datum/map/modpack_testing
	name = "Modpack Testing"
	full_name = "Modpack Testing District"
	path = "modpack_testing"
	allowed_latejoin_spawns = list()
	default_spawn = null
	votable = FALSE

/datum/map/modpack_testing/validate()
	return TRUE // Do not check for level lists, this is not a playable map.
