// Contains generic mundane/fantasy loot.
/obj/structure/loot_pile/bookcase
	name = "bookcase"
	desc = "A bookcase that has long since fallen into disrepair. It may still have some useful things left on its shelves..."
	icon = 'icons/obj/structures/bookcase.dmi'
	icon_state = "bookcase-damaged" // preview
	material = /decl/material/solid/organic/wood/walnut
	color = /decl/material/solid/organic/wood/walnut::color
	material_alteration = MAT_FLAG_ALTERATION_ALL
	/// 1-indexed, pick a random overlay to add corresponding to "loot[rand(1, loot_states)]".
	var/loot_states = 3
	/// A text string corresponding to the icon_state of the loot overlay we're using.
	var/loot_state

/obj/structure/loot_pile/bookcase/update_material_name(override_name)
	. = ..()
	SetName("[pick("ruined", "destroyed", "dilapidated")] [name]")

/obj/structure/loot_pile/bookcase/ebony
	material = /decl/material/solid/organic/wood/ebony
	color = /decl/material/solid/organic/wood/ebony::color

/obj/structure/loot_pile/bookcase/get_icon_states_to_use()
	var/static/list/icon_states_to_use = list("bookcase-damaged", "fancy-damaged")
	return icon_states_to_use

/obj/structure/loot_pile/bookcase/Initialize(ml, _mat, _reinf_mat)
	if(isnum(loot_states) && loot_states > 0)
		loot_state = "loot[rand(1, loot_states)]"
	. = ..()

/obj/structure/loot_pile/bookcase/on_update_icon()
	. = ..()
	if(loot_state)
		add_overlay(overlay_image(icon, loot_state, null, RESET_COLOR|RESET_ALPHA))

/obj/structure/loot_pile/bookcase/get_common_loot()
	var/static/list/common_loot = list(
		/obj/item/paper/scroll,
		/obj/item/paper/scroll,
		/obj/item/paper/scroll,
		/obj/item/pen/fancy/quill,
		/obj/item/clothing/neck/necklace/prayer_beads/random,
	)
	return common_loot

/obj/structure/loot_pile/bookcase/get_uncommon_loot()
	var/static/list/uncommon_loot = list(
		/obj/item/bone/skull,
		/obj/item/chems/glass/inkwell,
		/obj/item/clothing/glasses/prescription/pincenez,
		/obj/item/chems/drinks/bottle/wine,
		/obj/item/stack/medical/ointment/crafted,
		/obj/item/stack/medical/bandage/crafted,
	)
	return uncommon_loot

/obj/structure/loot_pile/bookcase/get_rare_loot()
	var/static/list/rare_loot = list(
		/obj/item/pen/fancy/quill/goose,
		/obj/item/clothing/gloves/ring/seal/signet,
		/obj/item/chems/drinks/bottle/champagne,
		/obj/item/chems/drinks/bottle/premiumwine,
	)
	return rare_loot
