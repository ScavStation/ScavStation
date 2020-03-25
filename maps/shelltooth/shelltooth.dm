#if !defined(using_map_DATUM)

	#include "..\..\code\content_packages\corporate\_corporate.dme"
	#include "..\..\code\content_packages\valsalia\_valsalia.dme"
	
	#include "shelltooth_unit_testing.dm"
	#include "shelltooth_antagonists.dm"
	#include "shelltooth_items.dm"
	#include "shelltooth_areas.dm"
	#include "shelltooth_jobs.dm"
	#include "shelltooth_loadouts.dm"
	#include "shelltooth_spawnpoints.dm"
	#include "shelltooth_shuttles.dm"
	#include "shelltooth_overmap.dm"
	#include "shelltooth_overrides.dm"
	#include "shelltooth-0.dmm"
	#include "shelltooth-1.dmm"
	#include "shelltooth-2.dmm"
	#include "shelltooth-3.dmm"
	#include "shelltooth-4.dmm"

	#define using_map_DATUM /datum/map/shelltooth

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Shelltooth Station

#endif
