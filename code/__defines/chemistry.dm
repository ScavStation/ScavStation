#define DEFAULT_HUNGER_FACTOR 0.03 // Factor of how fast mob nutrition decreases
#define DEFAULT_THIRST_FACTOR 0.03 // Factor of how fast mob hydration decreases

#define REM 0.2 // Means 'Reagent Effect Multiplier'. This is how many units of reagent are consumed per tick

#define CHEM_TOUCH 1
#define CHEM_INGEST 2
#define CHEM_BLOOD 3

#define MINIMUM_CHEMICAL_VOLUME 0.01

#define REAGENTS_OVERDOSE 30

#define CHEM_SYNTH_ENERGY 500 // How much energy does it take to synthesize 1 unit of chemical, in Joules.

// Some on_mob_life() procs check for alien races.
#define IS_SLIME   1
#define IS_YINGLET 2

// Passive chemical effects.
#define CE_STABLE         /decl/chemical_effect/stable       // Inaprovaline
#define CE_ANTIBIOTIC     /decl/chemical_effect/antibiotic   // Spaceacilin
#define CE_BLOODRESTORE   /decl/chemical_effect/bloodrestore // Iron/nutriment
#define CE_PAINKILLER     /decl/chemical_effect/painkiller   // Reduces effective shock
#define CE_ALCOHOL        /decl/chemical_effect/alcohol      // Liver filtering
#define CE_ALCOHOL_TOXIC  /decl/chemical_effect/alcotoxic    // Liver damage
#define CE_SPEEDBOOST     /decl/chemical_effect/gofast       // Hyperzine
#define CE_SLOWDOWN       /decl/chemical_effect/goslow       // Slowdown
#define CE_PULSE          /decl/chemical_effect/xcardic      // increases or decreases heart rate
#define CE_NOPULSE        /decl/chemical_effect/heartstop    // stops heartbeat
#define CE_ANTITOX        /decl/chemical_effect/antitox      // Dylovene
#define CE_OXYGENATED     /decl/chemical_effect/oxygen       // Dexalin.
#define CE_BRAIN_REGEN    /decl/chemical_effect/brainfix     // Alkysine.
#define CE_TOXIN          /decl/chemical_effect/toxins       // Generic toxins, stops autoheal.
#define CE_BREATHLOSS     /decl/chemical_effect/breathloss   // Breathing depression, makes you need more air
#define CE_MIND           /decl/chemical_effect/mindbending  // Stabilizes or wrecks mind. Used for hallucinations
#define CE_CRYO           /decl/chemical_effect/cryogenic    // Prevents damage from being frozen
#define CE_BLOCKAGE       /decl/chemical_effect/blockage     // Gets in the way of blood circulation, higher the worse
#define CE_SQUEAKY        /decl/chemical_effect/squeaky      // Helium voice. Squeak squeak.
#define CE_THIRDEYE       /decl/chemical_effect/thirdeye     // Gives xray vision.
#define CE_SEDATE         /decl/chemical_effect/sedate       // Applies sedation effects, i.e. paralysis, inability to use items, etc.
#define CE_ENERGETIC      /decl/chemical_effect/energetic    // Speeds up stamina recovery.
#define CE_VOICELOSS      /decl/chemical_effect/whispers     // Lowers the subject's voice to a whisper
#define CE_GLOWINGEYES    /decl/chemical_effect/eyeglow      // Causes eyes to glow.

// Active chemical effects.
#define CE_NUTRITION      /decl/chemical_effect/active/nutrition
#define CE_HYDRATION      /decl/chemical_effect/active/hydration
#define CE_JITTERY        /decl/chemical_effect/active/jittery
#define CE_IMMUNITY       /decl/chemical_effect/active/immunity
#define CE_WEAKEN         /decl/chemical_effect/active/weaken
#define CE_HALLUCINATIONS /decl/chemical_effect/active/hallucinations
#define CE_DRUGGED        /decl/chemical_effect/active/drugged

//reagent flags
#define IGNORE_MOB_SIZE 0x1
#define AFFECTS_DEAD    0x2

#define HANDLE_REACTIONS(_reagents)  SSchemistry.active_holders[_reagents] = TRUE
#define UNQUEUE_REACTIONS(_reagents) SSchemistry.active_holders -= _reagents

#define REAGENT_LIST(R) (R.reagents ? R.reagents.get_reagents() : "No reagent holder")
