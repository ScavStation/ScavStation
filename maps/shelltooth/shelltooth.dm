#if !defined(USING_MAP_DATUM)


	#include "../random_ruins/exoplanet_ruins/playablecolony/playablecolony.dm"

	#include "../../mods/content/xenobiology/_xenobiology.dme"
	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/valsalia/_valsalia.dme"
	#include "../../mods/content/matchmaking/_matchmaking.dme"
	#include "../../mods/species/ascent/_ascent.dme"
	#include "../../mods/species/neoavians/_neoavians.dme"
	#include "../../mods/species/vox/_vox.dme"
	#include "../../mods/species/serpentid/_serpentid.dme"
	#include "../../mods/species/bayliens/_bayliens.dme"
	#include "../../mods/content/mundane.dm"
	#include "../../mods/content/bigpharma/_bigpharma.dme"
	#include "../../mods/content/government/_government.dme"
	#include "../../mods/content/modern_earth/_modern_earth.dme"
	#include "../../mods/content/mouse_highlights/_mouse_highlight.dme"
	#include "../../mods/content/psionics/_psionics.dme"
	#include "../../mods/content/scaling_descriptors.dm"

	#include "shelltooth_areas.dm"
	#include "shelltooth_antagonists.dm"
	#include "shelltooth_departments.dm"
	#include "shelltooth_items.dm"
	#include "shelltooth_jobs.dm"
	#include "shelltooth_levels.dm"
	#include "shelltooth_loadouts.dm"
	#include "shelltooth_spawnpoints.dm"
	#include "shelltooth_shuttles.dm"
	#include "shelltooth_overmap.dm"
	#include "shelltooth_overrides.dm"
	#include "shelltooth_unit_testing.dm"
	#include "shelltooth-0.dmm"
	#include "shelltooth-1.dmm"
	#include "shelltooth-2.dmm"
	#include "shelltooth-3.dmm"
	#include "shelltooth-4.dmm"
	#include "shelltooth-wetland.dmm"

	#include "jobs/_jobs.dm"
	#include "jobs/command.dm"
	#include "jobs/engineering.dm"
	#include "jobs/medical.dm"
	#include "jobs/science.dm"
	#include "jobs/yinglets.dm"
	#include "outfits/_outfits.dm"
	#include "outfits/command.dm"
	#include "outfits/engineering.dm"
	#include "outfits/medical.dm"
	#include "outfits/science.dm"
	#include "outfits/yinglets.dm"

	#include "../away/bearcat/bearcat.dm"
	#include "../away/casino/casino.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/mining/mining.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/unishi/unishi.dm"
	#include "../away/yacht/yacht.dm"
	#include "../away/liberia/liberia.dm"

	#include "../../mods/mobs/dionaea/_dionaea.dme"
	#include "../../mods/mobs/borers/_borers.dme"

	#define USING_MAP_DATUM /datum/map/shelltooth

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Shelltooth Station

#endif
