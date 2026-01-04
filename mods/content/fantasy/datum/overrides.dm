/decl/species
	available_background_info = list(
		/decl/background_category/homeworld = list(
			/decl/background_detail/location/fantasy,
			/decl/background_detail/location/fantasy/mountains,
			/decl/background_detail/location/fantasy/valsal,
			/decl/background_detail/location/fantasy/hold,
			/decl/background_detail/location/fantasy/dinnlan,
			/decl/background_detail/location/fantasy/beletam,
			/decl/background_detail/location/fantasy/auhei,
			/decl/background_detail/location/fantasy/brinnilee,
			/decl/background_detail/location/fantasy/peshtul,
			/decl/background_detail/location/fantasy/baramor,
			/decl/background_detail/location/fantasy/eastwall,
			/decl/background_detail/location/fantasy/reach,
			/decl/background_detail/location/fantasy/empire,
			/decl/background_detail/location/fantasy/isles,
			/decl/background_detail/location/other
		),
		/decl/background_category/faction =   list(
			/decl/background_detail/faction/fantasy,
			/decl/background_detail/faction/fantasy/ivenmoth,
			/decl/background_detail/faction/fantasy/cult,
			/decl/background_detail/faction/fantasy/merc,
			/decl/background_detail/faction/fantasy/talleraine,
			/decl/background_detail/faction/other
		),
		/decl/background_category/heritage =   list(
			/decl/background_detail/heritage/fantasy,
			/decl/background_detail/heritage/fantasy/steppe,
			/decl/background_detail/heritage/other
		),
		/decl/background_category/religion =  list(
			/decl/background_detail/religion/ancestor,
			/decl/background_detail/religion/folk_deity,
			/decl/background_detail/religion/dinn,
			/decl/background_detail/religion/veil,
			/decl/background_detail/religion/angel,
			/decl/background_detail/religion/other
		)
	)
	default_background_info = list(
		/decl/background_category/homeworld = /decl/background_detail/location/fantasy,
		/decl/background_category/faction   = /decl/background_detail/faction/fantasy,
		/decl/background_category/heritage   = /decl/background_detail/heritage/fantasy,
		/decl/background_category/religion  = /decl/background_detail/religion/other
	)

// Rename grafadreka
/decl/species/grafadreka
	name = "Meredrake"
	name_plural = "Meredrakes"
	description = "Meredrakes, sometimes called mire-drakes, are large reptillian pack predators, widely assumed to be cousins to true dragons. \
	They are commonly found living in caves or burrows bordering grassland or forest, and while they prefer to hunt deer or rabbits, they will sometimes attack travellers if pickings are slim enough. \
	While they are not domesticated, they can be habituated and trained as working animals if captured young enough."

/decl/sprite_accessory/marking/grafadreka
	species_allowed = list("Meredrake")

/decl/language/grafadreka
	desc = "Hiss hiss, feed me rabbits."

/decl/material/liquid/sifsap
	name = "drake spittle"
	lore_text = "A complex chemical slurry brewed up in the gullet of meredrakes."

/obj/aura/sifsap_salve
	name = "Drakespittle Salve"
	descriptor = "glowing spittle"

// Rename wooden prostheses
/decl/bodytype/prosthetic/wooden
	name = "carved wooden" // weird to call it 'crude' when it's cutting-edge for the setting

// Just some fun overrides for when robot debris shows up in maint.
/obj/effect/decal/cleanable/blood/gibs/robot
	name = "mysterious debris"
	desc = "Some kind of complex, oily detritus. What could it be?"

/obj/item/remains/robot
	name = "mysterious remains"
	desc = "The oily remains of some complex, metallic object. What could they be from?"

// Override to remove non-fantasy stuff.
/obj/random/trash/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/remains/lizard,
		/obj/effect/decal/cleanable/blood/gibs/robot,
		/obj/effect/decal/cleanable/spiderling_remains,
		/obj/item/remains/mouse,
		/obj/effect/decal/cleanable/vomit,
		/obj/effect/decal/cleanable/blood/splatter,
		/obj/effect/decal/cleanable/ash,
		/obj/effect/decal/cleanable/generic,
		/obj/effect/decal/cleanable/flour,
		/obj/effect/decal/cleanable/filth,
		/obj/effect/decal/cleanable/dirt/visible,
		/obj/item/remains/robot
	)
	return spawnable_choices
