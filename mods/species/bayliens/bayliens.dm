#define SPECIES_SKRELL   "Skrell"
#define SPECIES_TAJARA   "Tajara"
#define SPECIES_LIZARD   "Unathi"
#define SPECIES_ADHERENT "Adherent"

/decl/modpack/bayliens
	name = "Baystation 12 Aliens"

/decl/modpack/bayliens/pre_initialize()
	..()
	SSmodpacks.default_submap_whitelisted_species |= SPECIES_TAJARA
	SSmodpacks.default_submap_whitelisted_species |= SPECIES_LIZARD
	SSmodpacks.default_submap_whitelisted_species |= SPECIES_SKRELL
	SSmodpacks.default_submap_whitelisted_species |= SPECIES_ADHERENT
