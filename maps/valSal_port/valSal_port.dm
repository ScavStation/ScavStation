#if !defined(USING_MAP_DATUM)

	#include "../../mods/content/pheromones/_pheromones.dme"
	#include "../../mods/valsalia/_valsalia.dme"
	#include "../../mods/content/matchmaking/_matchmaking.dme"
	#include "../../mods/content/dungeon_loot/_dungeon_loot.dme"
	#include "../../mods/content/mouse_highlights/_mouse_highlight.dme"
	#include "../../mods/content/scaling_descriptors.dm"
	#include "../../mods/species/drakes/_drakes.dme" // include before _fantasy.dme so overrides work
	#include "../../mods/content/fantasy/_fantasy.dme"

	#include "areas/_areas.dm"
	#include "areas/caverns.dm"
	#include "areas/enclave.dm"
	#include "areas/town.dm"

	#include "jobs/_jobs.dm"
	#include "jobs/shrine.dm"
	#include "jobs/visitors.dm"
	#include "jobs/enclave.dm"


	#include "levels/_levels.dm"
	#include "levels/random_map.dm"
	#include "levels/strata.dm"

	#include "outfits/_outfits.dm"
	#include "outfits/caves.dm"
	#include "outfits/inn.dm"
	#include "outfits/shrine.dm"
	#include "outfits/visitors.dm"
	#include "outfits/enclave.dm"

	#include "valSal_port_currency.dm"
	#include "valSal_port_events.dm"
	#include "valSal_port_locks.dm"
	#include "valSal_port_map.dm"
	#include "valSal_port_skills.dm"
	#include "valSal_port_testing.dm"
	#include "valSal_port_turfs.dm"

	// caverns are below enclave and must be compiled in that order for multiz.
	#include "valSal_port-caverns.dmm"
	#include "valsal_port-enclave.dmm"

	#include "valsal_port-town.dmm"



	#define USING_MAP_DATUM /datum/map/valSal_port

#elif !defined(MAP_OVERRIDE)
	#warn A map has already been included, ignoring ValSalPort
#endif
