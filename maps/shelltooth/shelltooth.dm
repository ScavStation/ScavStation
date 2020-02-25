#if !defined(using_map_DATUM)

	#include "../tradeship/valsalia_defines.dm"
	#include "../tradeship/items/airlocks.dm"
	#include "../tradeship/items/documents.dm"
	#include "../tradeship/items/chemistry.dm"
	#include "../tradeship/items/clothing.dm"
	#include "../tradeship/items/clothing_baxxid.dm"
	#include "../tradeship/items/clothing_yinglet.dm"
	#include "../tradeship/items/javelin.dm"
	#include "../tradeship/items/mollusc.dm"
	#include "../tradeship/items/prosthetics.dm"
	#include "../tradeship/items/seed_storage.dm"
	#include "../tradeship/items/suit_cycler.dm"
	#include "../tradeship/items/turfs.dm"
	#include "../tradeship/map/culture.dm"
	#include "../tradeship/map/overrides.dm"
	#include "../tradeship/lobby/music.dm"
	#include "../tradeship/species/baxxid.dm"
	#include "../tradeship/species/yinglet.dm"
	#include "../tradeship/species/yinglet_organs.dm"
	#include "../tradeship/species/yinglet_accessories.dm"

	#include "shelltooth_unit_testing.dm"
	#include "shelltooth_antagonists.dm"
	#include "shelltooth_items.dm"
	#include "shelltooth_areas.dm"
	#include "shelltooth_jobs.dm"
	#include "shelltooth_spawnpoints.dm"
	#include "shelltooth_shuttles.dm"
	#include "shelltooth_overmap.dm"
	#include "shelltooth_overrides.dm"
	#include "shelltooth_loadouts.dm"
	#include "shelltooth-0.dmm"
	#include "shelltooth-1.dmm"
	#include "shelltooth-2.dmm"
	#include "shelltooth-3.dmm"
	#include "shelltooth-4.dmm"

	#define using_map_DATUM /datum/map/shelltooth

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Shelltooth Station

#endif
