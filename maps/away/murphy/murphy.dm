#include "murphy_areas.dm"
#include "murphy_jobs.dm"
#include "../../../mods/content/xenobiology/_xenobiology.dme"
//core map segment
/decl/department/murphy
	name = "Murphy"
	noun = "ship"
	noun_adj = "Murphy"
	display_priority = 10
	display_color = "#7a5d2f"

/obj/abstract/submap_landmark/joinable_submap/murphy
	name = "Murphy"
	archetype = /decl/submap_archetype/derelict/murphy


/decl/submap_archetype/derelict/murphy
	descriptor = "Murphy Ship Positions"
	default_to_hidden = FALSE
	crew_jobs = list(
		/datum/job/submap/murphy_crew,
		/datum/job/submap/murphy_captain,
		/datum/job/submap/murphy_core
	)

/obj/effect/overmap/visitable/ship/murphy
	name = "Private Vessel - Murphy"
	desc = "Sensor array detects unknown class medium size vessel. The vessel appears unarmed. It has IFF code of 'murphy'."
	vessel_mass = 5000
	max_speed = 1/(3 SECONDS)
	initial_generic_waypoints = list(
		"nav_murphy_1",
		"nav_murphy_2",
		"nav_murphy_3",
	)

/datum/map_template/ruin/away_site/murphy
	name = "Murphy"
	description = "Private Vessel - Murphy"
	suffixes = list("murphy/murphy-1.dmm", "murphy/murphy-2.dmm", "murphy/murphy-3.dmm", "murphy/murphy-4.dmm")
	cost = -1
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS

	template_tags = TEMPLATE_TAG_HABITAT
	area_usage_test_exempted_root_areas = list(/area/Murphy)


/obj/effect/shuttle_landmark/nav_murphy/nav1
	name = "Murphy Deck 1 Port"
	landmark_tag = "nav_murphy_1"

/obj/effect/shuttle_landmark/nav_murphy/nav2
	name = "Murphy Deck 2 Starboard"
	landmark_tag = "nav_murphy_2"

/obj/effect/shuttle_landmark/nav_murphy/nav3
	name = "Murphy Deck 3 Aft"
	landmark_tag = "nav_murphy_3"

