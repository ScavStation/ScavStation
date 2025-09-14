// Indrel Cultures & Heritages - Additions thanks to Val's input; CEG's description making 2/28/2025 --SAR
/decl/background_detail/faction/indrel
	name = "Indrel Workers"
	description = "The hives sometimes send workers to assist human endeavours; you are one of those workers."
	uid = "scav_background_faction_indrel"

/decl/background_detail/faction/tradehouse_indrel
	name = "Tradehouse Indrel"
	description = "You “work” for Tradehouse Ivenmoth, the Tradehouse currently in charge of the city of Val Salia, and headed by Viracroix Salia, \
	the scholarly Trademaster. Ivenmoth provides many services in trade, manufacturing, and guard work, with a focus on cooperation between peoples \
	and a greater understanding of the world. You probably mostly do odd jobs for them, and don’t command much respect."
	uid = "scav_background_faction_indrel_tradehouse"

/decl/background_detail/faction/hiveless
	name = "Hiveless Indrel"
	description = "You are connected with a hive, working with all the other indrel to make sure everything runs smoothly. Pheromones are a big part of \
	communication between you and your other workers, and you are likely very loyal to the Queen of your hive."
	uid = "scav_background_faction_indrel_hiveless"

/decl/background_detail/heritage/indrel
	name = "Hiveborn Indrel"
	description = "You were born in a mountain hive, one of thousands of larva."
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign,
		/decl/language/indrel
	)
	uid = "scav_background_heritage_indrel"

/decl/background_detail/heritage/indrel/mountains
	name = "Indrel Mountains"
	description = "You come from the Indrel Mountains, like almost all of your people. You were part of a hive, as a single piece to ensure your society ran \
	optimally, and to serve your queen, whether as a worker, or a soldier."
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign,
		/decl/language/indrel
	)
	uid = "scav_background_heritage_indrel_mountains"

/decl/background_detail/heritage/indrel/other
	name = "Other"
	description = "You come from somewhere else."
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign,
		/decl/language/indrel
	)
	uid = "scav_background_heritage_indrel_other"