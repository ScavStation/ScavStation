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

/obj/structure/merchant/general
	name = "trade-post merchant"
	desc = "A dusty old scav in a patched coat, sat behind a plank counter piled with odds and ends."
	vendor_name = "Trade-Post Merchant"
	vendor_products = list(
		/obj/item/chems/drinks/bottle/agedwhiskey = 4,
		/obj/item/mollusc/clam                    = 10,
		/obj/item/flame/torch                     = 5,
		/obj/item/food/grown/apple                = 8
	)
	vendor_prices = list(
		/obj/item/chems/drinks/bottle/agedwhiskey = 15, // A treat; still under a fifth of a full purse.
		/obj/item/mollusc/clam                    = 4,
		/obj/item/flame/torch                     = 6,
		/obj/item/food/grown/apple                = 2
	)

// A wandering merchant: carries a shifting handful of oddments, cheap, and it buys.
// Meant to be placed via /obj/abstract/landmark/merchant_post/roadside, not mapped directly.
/obj/structure/merchant/general/roadside
	name = "roadside pedlar"
	desc = "A hunched figure with a blanket of oddments spread on the ground."
	icon = 'mods/valsalia/icons/mobs/merchants/travelling_merchant.dmi' // Has "world" plus "arrival"/"leaving" animations.
	icon_state = ICON_STATE_WORLD // "world" - travelling_merchant.dmi doesn't carry the base's "tailor-world".
	vendor_name = "Roadside Pedlar"
	vendor_stock_slots = 4 // Carries 4 of the pool below on any given visit.
	vendor_stock_pool = list(
		/obj/item/mollusc/clam                    = 6,
		/obj/item/food/donut                      = 4,
		/obj/item/food/grown/apple                = 5,
		/obj/item/flame/torch                     = 3,
		/obj/item/chems/drinks/bottle/agedwhiskey = 2
	)
	vendor_prices = list(
		/obj/item/mollusc/clam                    = 3,
		/obj/item/food/donut                      = 2,
		/obj/item/food/grown/apple                = 2,
		/obj/item/flame/torch                     = 6,
		/obj/item/chems/drinks/bottle/agedwhiskey = 14
	)
	// Base offers, before material and condition adjustment. A brass torch beats
	// a wooden one; a pristine bottle beats a chipped one; a pearl beats a clam.
	vendor_buys = list(
		/obj/item/flame/torch               = 3,
		/obj/item/mollusc                   = 1,
		/obj/item/mollusc/clam/fished/pearl = 9,
		/obj/item/chems/drinks/bottle       = 1,
		/obj/item/food/grown                = 1
	)
	vendor_buy_budget = 60 // Runs dry after a handful of buys; refills to 60 each time he comes back.

// Map this where the roadside pedlar should appear; he cycles in and out on his own.
/obj/abstract/landmark/merchant_post/roadside
	name = "roadside pedlar post"
	merchant_type = /obj/structure/merchant/general/roadside
