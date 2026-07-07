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
	#include "areas/mtn_pass.dm"
	#include "areas/mtn_top.dm"
	#include "areas/town.dm"

	#include "jobs/_jobs.dm"
	#include "jobs/tradehouse.dm"
	#include "jobs/visitors.dm"
	#include "jobs/enclave.dm"


	#include "levels/_levels.dm"
	#include "levels/random_map.dm"
	#include "levels/strata.dm"

	#include "outfits/_outfits.dm"
	#include "outfits/caves.dm"
	#include "outfits/inn.dm"
	#include "outfits/tradehouse.dm"
	#include "outfits/visitors.dm"
	#include "outfits/enclave.dm"

	#include "valSal_port_currency.dm"
	#include "valSal_port_events.dm"
	#include "valSal_port_locks.dm"
	#include "valSal_port_map.dm"
	#include "valSal_port_skills.dm"
	#include "valSal_port_testing.dm"
	#include "valSal_port_turfs.dm"

	// load order is as such because it must start from the lowest z level going up.
	// Any map loaded before another becomes the bottom z level for the next map UNLESS SPECIFIED IN _levels.dm
	// THAT ITS CONNECTED VIA A CARDINAL DIRECTION
	#include "valsal_port-caverns.dmm"
	#include "valsal_port-enclave.dmm"
	#include "valsal_port-mtntop.dmm"
	#include "valsal_port-mtnpass.dmm"

	// this is z_level = 1, same as enclave but its loaded after so mtntop can be loaded ontop of enclave
	// and mtnpass can be loaded next to it. This works because _level.dm specifies this is connected to
	// enclave via cardinal direction. Lengthy notes for future reference on sewing these maps together.
	#include "valsal_port-town.dmm"



	#define USING_MAP_DATUM /datum/map/valSal_port

#elif !defined(MAP_OVERRIDE)
	#warn A map has already been included, ignoring ValSalPort
#endif
