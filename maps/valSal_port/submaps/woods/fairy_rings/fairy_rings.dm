/datum/map_template/valSal_port/woods/fairy_ring
	name = "fairy ring"
	mappaths = list("maps/valSal_port/submaps/woods/fairy_rings/fairy_ring.dmm")
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_ALLOW_DUPLICATES | TEMPLATE_FLAG_GENERIC_REPEATABLE
	template_categories = list(
		MAP_TEMPLATE_CATEGORY_SH_WOODS
	)
	area_coherency_test_exempt_areas    = list(/area/valSal_port/outside/point_of_interest/fairy_ring)

/datum/map_template/valSal_port/woods/fairy_ring/glowing
	name = "glowing fairy ring"
	mappaths = list("maps/valSal_port/submaps/woods/fairy_rings/fairy_ring_glowing.dmm")

/area/valSal_port/outside/point_of_interest/fairy_ring
	name = "Point of Interest - Fairy Ring"
