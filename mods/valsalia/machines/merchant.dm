// Merchant objects
//
// TO ADD A MERCHANT: subtype /obj/structure/merchant and set some of:
//   vendor_name        - name shown on the trade UI (defaults to the structure name)
//   vendor_products    - fixed stock
//   vendor_stock_pool  - a wider catalogue; each visit shows vendor_stock_slots
//                        of these picked at random (vendor_stock_slots defaults to 4)
//   vendor_prices      - flat crown price for EVERY product and EVERY pool entry.
//                        A missing price logs a trace and falls back to 1 crown.
//   vendor_buys        - item type = base buy offer; Non-empty => the
//                        merchant buys these off players. Final offer is
//                        base * material value * condition
//   vendor_buy_budget  - coin on hand for buying; null = unlimited. Refills whenever stock is rolled
//
// TO MAKE ONE COME AND GO: map an /obj/abstract/landmark/merchant_post subtype
// instead of the merchant itself, and point its merchant_type at your merchant.
// Tunable on the landmark: present_time, absent_time, first_delay, start_present.

/obj/structure/merchant/tailor
	name = "trade-post tailor"
	desc = "A fat short man offering nice clothes, and rope? And lamp oil? But not bombs...."
	icon = 'mods/valsalia/icons/mobs/merchants/tailor_merchant.dmi'
	icon_state = ICON_STATE_WORLD
	vendor_name = "Trade-Post Tailor"
	vendor_products = list(
		/obj/item/stack/material/thread/mapped/cotton      = 10,
		/obj/item/stack/material/bolt/mapped/cloth         = 10,
		/obj/item/stack/material/bolt/yellow/mapped/yellow = 5,
		/obj/item/stack/material/bolt/teal/mapped/teal     = 5,
		/obj/item/stack/material/bolt/black/mapped/black   = 5,
		/obj/item/stack/material/bolt/green/mapped/green   = 5,
		/obj/item/stack/material/bolt/purple/mapped/purple = 5,
		/obj/item/stack/material/bolt/blue/mapped/blue     = 5,
		/obj/item/stack/material/bolt/red/mapped/red       = 5,
		/obj/item/clothing/mask/spirit                     = 2,
		/obj/item/clothing/head/beret                      = 2,
		/obj/item/clothing/head/tank/olive                 = 2,
		/obj/item/clothing/head/fez                        = 2,
		/obj/item/clothing/head/collectable/wizard         = 2,
		/obj/item/clothing/suit/judgerobe                  = 2,
		/obj/item/clothing/suit/poncho                     = 2,
		/obj/item/clothing/suit/robe/yinglet/fancy         = 2,
		/obj/item/clothing/suit/robe/yinglet/countercoat   = 2,
		/obj/item/clothing/suit/robe/yinglet/zhorin        = 2,
		/obj/item/clothing/suit/robe/yinglet/librarian     = 2,
		/obj/item/clothing/suit/robe/yinglet/merchant      = 2,
		/obj/item/clothing/suit/jacket/redcoat             = 2,
		/obj/item/clothing/shoes/craftable/boots           = 2,
		/obj/item/clothing/shoes/craftable                 = 2,
		/obj/item/clothing/pants/trousers/braies           = 2,
		/obj/item/clothing/pants/trousers/jerkin           = 2,
		/obj/item/clothing/shirt/tunic/blue                = 2,
		/obj/item/clothing/shirt/tunic/green               = 2,
		/obj/item/clothing/shirt/tunic/short               = 2
	)
	vendor_prices = list(
		/obj/item/stack/material/thread/mapped/cotton      = 3,
		/obj/item/stack/material/bolt/mapped/cloth         = 5,
		/obj/item/stack/material/bolt/yellow/mapped/yellow = 4,
		/obj/item/stack/material/bolt/teal/mapped/teal     = 4,
		/obj/item/stack/material/bolt/black/mapped/black   = 4,
		/obj/item/stack/material/bolt/green/mapped/green   = 4,
		/obj/item/stack/material/bolt/purple/mapped/purple = 4,
		/obj/item/stack/material/bolt/blue/mapped/blue     = 4,
		/obj/item/stack/material/bolt/red/mapped/red       = 4,
		/obj/item/clothing/head/tank/olive                 = 5,
		/obj/item/clothing/head/beret                      = 6,
		/obj/item/clothing/head/fez                        = 6,
		/obj/item/clothing/shirt/tunic/short               = 6,
		/obj/item/clothing/pants/trousers/braies           = 6,
		/obj/item/clothing/pants/trousers/jerkin           = 7,
		/obj/item/clothing/shirt/tunic/blue                = 7,
		/obj/item/clothing/shirt/tunic/green               = 7,
		/obj/item/clothing/shoes/craftable                 = 6,
		/obj/item/clothing/shoes/craftable/boots           = 8,
		/obj/item/clothing/mask/spirit                     = 8,
		/obj/item/clothing/suit/poncho                     = 10,
		/obj/item/clothing/suit/robe/yinglet/librarian     = 12,
		/obj/item/clothing/suit/robe/yinglet/merchant      = 12,
		/obj/item/clothing/suit/jacket/redcoat             = 14,
		/obj/item/clothing/suit/robe/yinglet/countercoat   = 14,
		/obj/item/clothing/suit/robe/yinglet/zhorin        = 14,
		/obj/item/clothing/suit/judgerobe                  = 16,
		/obj/item/clothing/suit/robe/yinglet/fancy         = 18,
		/obj/item/clothing/head/collectable/wizard         = 20
	)

/obj/structure/merchant/general
	name = "trade-post general store"
	desc = "A well organized woman watching over her wares with a friendly smile."
	icon = 'mods/valsalia/icons/mobs/merchants/general_merchant.dmi'
	icon_state = ICON_STATE_WORLD
	vendor_name = "Trade-Post General Store"
	vendor_products = list(
		/obj/item/chems/glass/handmade/teapot                  = 3,
		/obj/item/stack/material/brick/mapped/sandstone/five   = 3,
		/obj/item/stack/material/brick/mapped/marble/five      = 2,
		/obj/item/stack/material/brick/mapped/graphite/five    = 2,
		/obj/item/stack/material/plank/mapped/wood/five        = 5,
		/obj/item/lockpick_roll/filled                         = 2,
		/obj/item/tool/pickaxe/iron                            = 3,
		/obj/item/tool/axe/iron                                = 3,
		/obj/item/knife/hook                                   = 3,
		/obj/item/tool/shovel                                  = 3,
		/obj/item/tool/hoe                                     = 3,
		/obj/item/tool/hammer                                  = 3,
		/obj/item/chems/cooking_vessel/pot/iron                = 3,
		/obj/item/chems/glass/handmade/bottle/wide/whiskey     = 3,
		/obj/item/stick                                        = 5,
		/obj/item/rock/flint/striker                           = 4,
		/obj/item/flame/fuelled/lantern/filled                 = 3,
		/obj/item/gun/launcher/bow/sling                       = 2,
		/obj/item/chems/cooking_vessel/baking_dish/earthenware = 3
	)
	vendor_prices = list(
		/obj/item/chems/glass/handmade/teapot                  = 6,
		/obj/item/stack/material/brick/mapped/sandstone/five   = 5,
		/obj/item/stack/material/brick/mapped/marble/five      = 8,
		/obj/item/stack/material/brick/mapped/graphite/five    = 7,
		/obj/item/stack/material/plank/mapped/wood/five        = 4,
		/obj/item/lockpick_roll/filled                         = 15,
		/obj/item/tool/pickaxe/iron                            = 12,
		/obj/item/tool/axe/iron                                = 12,
		/obj/item/knife/hook                                   = 8,
		/obj/item/tool/shovel                                  = 10,
		/obj/item/tool/hoe                                     = 8,
		/obj/item/tool/hammer                                  = 8,
		/obj/item/chems/cooking_vessel/pot/iron                = 10,
		/obj/item/chems/glass/handmade/bottle/wide/whiskey     = 6,
		/obj/item/stick                                        = 1,
		/obj/item/rock/flint/striker                           = 5,
		/obj/item/flame/fuelled/lantern/filled                 = 12,
		/obj/item/gun/launcher/bow/sling                       = 20,
		/obj/item/chems/cooking_vessel/baking_dish/earthenware = 9
	)
	// Base offers before material/condition scaling (see get_buy_offer in _merchant.dm: final = base * material value * condition).
	vendor_buys = list(
		// Produce and grown goods - a coin a piece
		/obj/item/food/grown                 = 1,
		/obj/item/food/processed_grown       = 1,
		// Meat, tiered roughly by the size of the animal it came off
		/obj/item/food/butchery/meat         = 1, // catch-all for anything not tiered below
		/obj/item/food/butchery/meat/chicken = 1,
		/obj/item/food/butchery/meat/insect  = 1,
		/obj/item/food/butchery/meat/goat    = 2,
		/obj/item/food/butchery/meat/beef    = 3,
		/obj/item/food/butchery/meat/bear    = 4,
		// Clothing worth mending and reselling, tiered by how much fabric goes into it.
		/obj/item/clothing                   = 1, // catch-all for anything not tiered below
		/obj/item/clothing/head              = 2,
		/obj/item/clothing/mask              = 2,
		/obj/item/clothing/shirt             = 2,
		/obj/item/clothing/pants             = 2,
		/obj/item/clothing/shoes             = 2,
		/obj/item/clothing/suit              = 4,
		// Raw materials, refined goods, and tools.
		/obj/item/stack/material             = 1, // ore, bricks, planks, bolts, thread, etc.
		/obj/item/stack/material/ore         = 2,
		/obj/item/stack/material/ingot       = 5,
		/obj/item/tool                       = 5,
		/obj/item/knife                      = 3
	)
	// Crowns per unit of reagent - priced on top of whatever the container itself is worth (or 0 if
	// it's not otherwise listed above), so a jar of yarrow tincture is worth more than an empty jar.
	vendor_reagent_buys = list(
		/decl/material/liquid/brute_meds  = 0.4, // yarrow and its tea/tincture
		/decl/material/liquid/burn_meds   = 0.4, // aloe and its tea/tincture
		/decl/material/liquid/antitoxins  = 0.3, // ginseng and its tea/tincture
		/decl/material/liquid/sedatives   = 0.3, // valerian and its tea/tincture
		/decl/material/liquid/painkillers = 0.3,
		/decl/material/liquid/oxy_meds    = 0.3,
		/decl/material/liquid/stabilizer  = 0.5
	)
	vendor_buy_budget = 600
	vendor_buy_budget_grows = TRUE // every sale tops the till back up, on top of the starting 600.

/obj/structure/merchant/apothecary
	name = "trade-post apothecary"
	desc = "Wearing gloves slightly tinged from fire and suffering from early arthritis, this man offers a variety of herbs and potions."
	icon = 'mods/valsalia/icons/mobs/merchants/apothecary_merchant.dmi'
	icon_state = ICON_STATE_WORLD
	vendor_name = "Trade-Post Apothecary"
	vendor_products = list(
		/obj/item/food/grown/aloe                       = 4,
		/obj/item/food/grown/valerian                   = 4,
		/obj/item/food/grown/dried_tobacco/fine         = 3,
		/obj/item/food/grown/foxglove                   = 3,
		/obj/item/food/grown/ginseng                    = 3,
		/obj/item/food/processed_grown/crushed/garlic   = 4,
		/obj/item/food/grown/yarrow                     = 4,
		/obj/item/chems/drinks/bottle/holywater         = 2,
		/obj/item/chems/glass/handmade/bottle/tall/wine = 3,
		/obj/item/chems/glass/handmade/jar              = 4,
		/obj/item/ancient_surgery/scalpel               = 2,
		/obj/item/ancient_surgery/bonesetter            = 2,
		/obj/item/stack/medical/bandage/crafted/five    = 3,
		/obj/item/stack/medical/ointment/crafted/five   = 3,
		/obj/item/stack/medical/splint/crafted/five     = 3
	)
	vendor_prices = list(
		/obj/item/food/grown/aloe                       = 3,
		/obj/item/food/grown/valerian                   = 4,
		/obj/item/food/grown/dried_tobacco/fine         = 5,
		/obj/item/food/grown/foxglove                   = 4,
		/obj/item/food/grown/ginseng                    = 5,
		/obj/item/food/processed_grown/crushed/garlic   = 2,
		/obj/item/food/grown/yarrow                     = 3,
		/obj/item/chems/drinks/bottle/holywater         = 10,
		/obj/item/chems/glass/handmade/bottle/tall/wine = 6,
		/obj/item/chems/glass/handmade/jar              = 3,
		/obj/item/ancient_surgery/scalpel               = 14,
		/obj/item/ancient_surgery/bonesetter            = 14,
		/obj/item/stack/medical/bandage/crafted/five    = 8,
		/obj/item/stack/medical/ointment/crafted/five   = 8,
		/obj/item/stack/medical/splint/crafted/five     = 8
	)

/obj/structure/merchant/butcher
	name = "trade-post butcher"
	desc = "A blood-stained apron hangs from this man's neck as the smell of fresh meat wafts around him."
	icon = 'mods/valsalia/icons/mobs/merchants/butcher_merchant.dmi'
	icon_state = ICON_STATE_WORLD
	vendor_name = "Trade-Post Butcher"
	vendor_products = list(
		/obj/item/stack/material/skin/mapped/leather/five     = 3,
		/obj/item/food/butchery/meat/beef                     = 4,
		/obj/item/food/butchery/meat/goat                     = 4,
		/obj/item/food/butchery/meat/chicken/game             = 4,
		/obj/item/food/butchery/meat/insect/ivenmoth          = 2,
		/obj/item/food/butchery/meat/bear                     = 2,
		/obj/item/chems/glass/waterskin/crafted               = 3,
		/obj/item/stack/material/bone/mapped/bone/five        = 4,
		/obj/item/stack/material/thread/mapped/dried_gut/five = 3,
		/obj/item/bowstring                                   = 3,
		/obj/item/stack/material/bow_ammo/arrow/iron          = 5
	)
	vendor_prices = list(
		/obj/item/stack/material/skin/mapped/leather/five     = 8,
		/obj/item/food/butchery/meat/beef                     = 5,
		/obj/item/food/butchery/meat/goat                     = 5,
		/obj/item/food/butchery/meat/chicken/game             = 4,
		/obj/item/food/butchery/meat/insect/ivenmoth          = 6,
		/obj/item/food/butchery/meat/bear                     = 8,
		/obj/item/chems/glass/waterskin/crafted               = 6,
		/obj/item/stack/material/bone/mapped/bone/five        = 3,
		/obj/item/stack/material/thread/mapped/dried_gut/five = 4,
		/obj/item/bowstring                                   = 5,
		/obj/item/stack/material/bow_ammo/arrow/iron          = 4
	)

/obj/structure/merchant/farmer
	name = "trade-post farmer"
	desc = "A weathered looking man stands against the harsh sun and wind, seeds falling from his pocket."
	icon = 'mods/valsalia/icons/mobs/merchants/farmer_merchant.dmi'
	icon_state = ICON_STATE_WORLD
	vendor_name = "Trade-Post Farmer"
	vendor_products = list(
		/obj/item/seeds/extracted/yarrow                      = 4,
		/obj/item/seeds/extracted/aloe                        = 4,
		/obj/item/seeds/extracted/ginseng                     = 3,
		/obj/item/seeds/extracted/valerian                    = 4,
		/obj/item/seeds/extracted/foxglove                    = 3,
		/obj/item/seeds/extracted/cabbage                     = 5,
		/obj/item/seeds/extracted/potato                      = 5,
		/obj/item/seeds/extracted/wheat                       = 5,
		/obj/item/seeds/extracted/rice                        = 5,
		/obj/item/seeds/grapeseed                             = 3,
		/obj/item/seeds/blueberryseed                         = 3,
		/obj/item/seeds/eggplantseed                          = 4,
		/obj/item/seeds/cornseed                              = 5,
		/obj/item/seeds/poppyseed                             = 3,
		/obj/item/seeds/soyaseed                              = 5,
		/obj/item/seeds/nettleseed                            = 4,
		/obj/item/seeds/whitebeetseed                         = 4,
		/obj/item/seeds/tobaccoseed                           = 3,
		/obj/item/seeds/onionseed                             = 5,
		/obj/item/seeds/flax                                  = 4,
		/obj/item/food/grown/cabbage                          = 4,
		/obj/item/food/grown/carrot                           = 4,
		/obj/item/food/grown/apple                            = 4,
		/obj/item/food/processed_grown/slice/large/watermelon = 3
	)
	vendor_prices = list(
		/obj/item/seeds/extracted/yarrow                      = 3,
		/obj/item/seeds/extracted/aloe                        = 3,
		/obj/item/seeds/extracted/ginseng                     = 4,
		/obj/item/seeds/extracted/valerian                    = 3,
		/obj/item/seeds/extracted/foxglove                    = 4,
		/obj/item/seeds/extracted/cabbage                     = 2,
		/obj/item/seeds/extracted/potato                      = 2,
		/obj/item/seeds/extracted/wheat                       = 2,
		/obj/item/seeds/extracted/rice                        = 2,
		/obj/item/seeds/grapeseed                             = 4,
		/obj/item/seeds/blueberryseed                         = 3,
		/obj/item/seeds/eggplantseed                          = 3,
		/obj/item/seeds/cornseed                              = 2,
		/obj/item/seeds/poppyseed                             = 4,
		/obj/item/seeds/soyaseed                              = 2,
		/obj/item/seeds/nettleseed                            = 2,
		/obj/item/seeds/whitebeetseed                         = 2,
		/obj/item/seeds/tobaccoseed                           = 4,
		/obj/item/seeds/onionseed                             = 2,
		/obj/item/seeds/flax                                  = 3,
		/obj/item/food/grown/cabbage                          = 2,
		/obj/item/food/grown/carrot                           = 2,
		/obj/item/food/grown/apple                            = 2,
		/obj/item/food/processed_grown/slice/large/watermelon = 3
	)

// A wandering merchant: carries a shifting handful of oddments, cheap, and it buys.
// Meant to be placed via /obj/abstract/landmark/merchant_post/roadside, not mapped directly.
/obj/structure/merchant/roadside
	name = "roadside pedlar"
	desc = "A hunched baxxid with a blanket of oddments spread on the ground, all covered in lots of dirt."
	icon = 'mods/valsalia/icons/mobs/merchants/travelling_merchant.dmi'
	icon_state = ICON_STATE_WORLD
	vendor_name = "Roadside Pedlar"
	vendor_stock_slots = 4 // Carries 4 of the pool below on any given visit.
	// Curios, not staples: 1 or 2 of anything (stock is re-rolled fresh each visit anyway)
	vendor_stock_pool = list(
		/obj/item/seeds/shandseed                     = 2,
		/obj/item/seeds/mtearseed                     = 2,
		/obj/item/seeds/bluetomatoseed                = 2,
		/obj/item/seeds/reishimycelium                = 2,
		/obj/item/seeds/deathnettleseed               = 1,
		/obj/item/seeds/goldappleseed                 = 1,
		/obj/item/food/egg/lizard                     = 2,
		/obj/item/yinglet_egg                         = 1,
		/obj/item/scrying                             = 1,
		/obj/item/whip/abyssal                        = 1,
		/obj/item/screwdriver/gold                    = 1,
		/obj/item/clothing/webbing/drop_pouches/brown = 2,
		/obj/item/stack/material/ore/oxygen           = 2,
		/obj/item/stack/medical/resin                 = 2,
		/obj/item/stack/tile/carpet/magenta/fifty     = 1,
		/obj/item/sword/excalibur                     = 1,
		/obj/item/food/ghostburger                    = 2,
		/obj/item/food/spider/cooked                  = 2,
		/obj/item/box/candles/scented                 = 2,
		/obj/item/toy/plushie/face_hugger             = 1,
		/obj/item/toy/eightball                       = 1,
		/obj/item/chems/glass/bucket/paint/red        = 2,
		/obj/item/chems/drinks/healthy_healthy_juice  = 1,
		/obj/item/hourglass                           = 1,
		/obj/item/paper_fortune_teller                = 1,
		/obj/item/book/virtues                        = 1,
		/obj/item/bikehorn/rubberducky                = 1,
		/obj/item/dice/d20/cursed                     = 1,
		/obj/item/organ/internal/brain/insectoid      = 1,
		/obj/item/fossil/animal/skull/horned          = 1
	)
	vendor_prices = list(
		/obj/item/seeds/shandseed                     = 38,
		/obj/item/seeds/mtearseed                     = 38,
		/obj/item/seeds/bluetomatoseed                = 38,
		/obj/item/seeds/reishimycelium                = 40,
		/obj/item/food/egg/lizard                     = 36,
		/obj/item/clothing/webbing/drop_pouches/brown = 36,
		/obj/item/stack/material/ore/oxygen           = 36,
		/obj/item/stack/medical/resin                 = 40,
		/obj/item/stack/tile/carpet/magenta/fifty     = 38,
		/obj/item/food/ghostburger                    = 38,
		/obj/item/food/spider/cooked                  = 36,
		/obj/item/box/candles/scented                 = 36,
		/obj/item/toy/plushie/face_hugger             = 40,
		/obj/item/toy/eightball                       = 38,
		/obj/item/chems/glass/bucket/paint/red        = 36,
		/obj/item/paper_fortune_teller                = 38,
		/obj/item/book/virtues                        = 38,
		/obj/item/bikehorn/rubberducky                = 36,
		/obj/item/screwdriver/gold                    = 42,
		/obj/item/seeds/deathnettleseed              = 45,
		/obj/item/seeds/goldappleseed                = 48,
		/obj/item/yinglet_egg                        = 45,
		/obj/item/hourglass                          = 45,
		/obj/item/dice/d20/cursed                    = 48,
		/obj/item/organ/internal/brain/insectoid     = 45,
		/obj/item/fossil/animal/skull/horned         = 45,
		/obj/item/whip/abyssal                       = 52,
		/obj/item/chems/drinks/healthy_healthy_juice = 55,
		/obj/item/scrying                            = 55,
		/obj/item/sword/excalibur                    = 60
	)
	// Base offers before material/condition scaling (see get_buy_offer in _merchant.dm: final = base * material value * condition).
	vendor_buys = list(
		/obj/item/flame/torch               = 3,
		/obj/item/mollusc/clam/fished/pearl = 9,
		/obj/item/chems/drinks/bottle       = 1,
		// Weapons and armour - he's always after something to defend the road with.
		/obj/item/bladed                    = 6,  // axes, knives, spears, polearms
		/obj/item/sword                     = 10,
		/obj/item/whip                      = 8,
		/obj/item/gun                       = 8,
		/obj/item/clothing/head/helmet      = 6,
		/obj/item/clothing/suit/armor       = 10,
		// High-tier metals and gems only - common iron/steel ingots aren't worth his while.
		/obj/item/stack/material/ingot/mapped/silver     = 8,
		/obj/item/stack/material/ingot/mapped/osmium     = 10,
		/obj/item/stack/material/ingot/mapped/gold       = 12,
		/obj/item/stack/material/puck/mapped/uranium     = 12,
		/obj/item/stack/material/ingot/mapped/platinum   = 14,
		/obj/item/stack/material/gemstone/mapped/diamond = 20,
		// Medicine - always good for the road.
		/obj/item/stack/medical = 3 // bandages, ointment, splints; stack/medical/resin above already prices its own
	)
	// Crowns per unit of reagent - priced on top of whatever the container itself is worth
	// so a jar of yarrow tincture is worth more than an empty jar.
	vendor_reagent_buys = list(
		/decl/material/liquid/brute_meds  = 0.4, // yarrow and its tea/tincture
		/decl/material/liquid/burn_meds   = 0.4, // aloe and its tea/tincture
		/decl/material/liquid/antitoxins  = 0.3, // ginseng and its tea/tincture
		/decl/material/liquid/sedatives   = 0.3, // valerian and its tea/tincture
		/decl/material/liquid/painkillers = 0.3,
		/decl/material/liquid/oxy_meds    = 0.3,
		/decl/material/liquid/stabilizer  = 0.5
	)
	vendor_buy_budget = 120 // resets every time he leaves
	vendor_buy_budget_grows = TRUE // Sales top the purse back up during a visit, but it's still reset to 120 on the next reroll.



// Map this where the roadside pedlar should appear; he cycles in and out on his own.
/obj/abstract/landmark/merchant_post/roadside
	name = "roadside pedlar post"
	merchant_type = /obj/structure/merchant/roadside
