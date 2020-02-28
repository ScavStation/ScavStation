#if !defined(using_map_DATUM)

	#define SPECIES_BAXXID           "Baxxid"
	#define SPECIES_YINGLET          "Yinglet"
	#define SPECIES_YINGLET_SOUTHERN "Southern Yinglet"
	#define DEPT_ENCLAVE             "enclave"
	#define IS_YINGLET               "yinglet"
	#define CULTURE_SCAV_ENCLAVE     "Enclave Yinglet"
	#define CULTURE_SCAV_TRIBE       "Tribal Yinglet"
	#define FACTION_SCAV             "Scav"
	#define LANGUAGE_BAXXID          "Baxxid"
	#define CULTURE_BAXXID           "Baxxid"
	#define FACTION_BAXXID           "Baxxid Nomad"

	#include "../../code/modules/scavstation_shared_content/_scavs.dme"
	#include "tradeship_antagonists.dm"
	#include "tradeship_areas.dm"
	#include "tradeship_chems.dm"
	#include "tradeship_departments.dm"
	#include "tradeship_jobs.dm"
	#include "tradeship_loadouts.dm"
	#include "tradeship_overmap.dm"
	#include "tradeship_shuttles.dm"
	#include "tradeship_spawnpoints.dm"
	#include "tradeship_unit_testing.dm"
	#include "tradeship-0.dmm"
	#include "tradeship-1.dmm"
	#include "tradeship-2.dmm"
	#include "tradeship-3.dmm"

	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/casino/casino.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/blueriver/blueriver.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lar_maria/lar_maria.dm"
	#include "../away/unishi/unishi.dm"

	#define using_map_DATUM /datum/map/tradeship

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tradeship

#endif
