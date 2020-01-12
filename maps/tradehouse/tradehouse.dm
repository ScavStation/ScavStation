#if !defined(using_map_DATUM)
	#include "tradehouse_overrides.dm"
	#include "tradehouse_areas.dm"
	#include "tradehouse_shuttles.dm"
	#include "tradehouse_unit_testing.dm"

	#include "tradehouse-1.dmm"
	#include "tradehouse-2.dmm"
	#include "tradehouse-3.dmm"

	#define using_map_DATUM /datum/map/tradehouse

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tradehouse

#endif
