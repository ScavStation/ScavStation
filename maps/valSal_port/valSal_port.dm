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
	#include "jobs/caves.dm"
	#include "jobs/inn.dm"
	#include "jobs/shrine.dm"
	#include "jobs/visitors.dm"
	#include "jobs/wilderness.dm"

	#include "submaps/_submaps.dm"
	#include "submaps/downlands/_downlands.dm"
	#include "submaps/grassland/_grassland.dm"
	#include "submaps/swamp/_swamp.dm"
	#include "submaps/woods/_woods.dm"
	#include "submaps/woods/bear_den/bear_den.dm"
	#include "submaps/woods/chemistry_shack/chemistry_shack.dm"
	#include "submaps/woods/fairy_rings/fairy_rings.dm"
	#include "submaps/woods/fox_den/fox_den.dm"
	#include "submaps/woods/hunter_camp/hunter_camp.dm"
	#include "submaps/woods/old_cabin/old_cabin.dm"

	#include "levels/_levels.dm"
	#include "levels/random_map.dm"
	#include "levels/strata.dm"

	#include "outfits/_outfits.dm"
	#include "outfits/caves.dm"
	#include "outfits/inn.dm"
	#include "outfits/shrine.dm"
	#include "outfits/visitors.dm"
	#include "outfits/wilderness.dm"

	#include "valSal_port_currency.dm"
	#include "valSal_port_events.dm"
	#include "valSal_port_locks.dm"
	#include "valSal_port_map.dm"
	#include "valSal_port_skills.dm"
	#include "valSal_port_testing.dm"
	#include "valSal_port_turfs.dm"

	// undertown are below town and must be compiled in that order for multiz.

	//.#include "valSal_port-undertown.dmm"

	#include "valsal_port-town.dmm"
	#include "valsal_port-enclave.dmm"

	#define USING_MAP_DATUM /datum/map/valSal_port

#elif !defined(MAP_OVERRIDE)
	#warn A map has already been included, ignoring ValSalPort
#endif
