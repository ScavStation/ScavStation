/datum/computer_file/program/merchant/ministation
	read_access = list()

/obj/machinery/computer/modular/preset/merchant/ministation
	default_software = list(
		/datum/computer_file/program/merchant/ministation,
		/datum/computer_file/program/email_client,
		/datum/computer_file/program/wordprocessor,
		/datum/computer_file/program/supply
	)

// This has to be here rather than ministation_define.dm because it's from a modpack.
/datum/map/ministation
	default_law_type = /datum/ai_laws/nanotrasen

/datum/map/ministation/New()
	lobby_tracks |= /decl/music_track/zazie
	return ..()

// This has to be here rather than ministation_define.dm because it's from a modpack.
/datum/map/ministation
	default_law_type = /datum/ai_laws/nanotrasen

/decl/species/yinglet
	available_background_info = list(
			/decl/background_category/heritage =  list(
				/decl/background_detail/heritage/yinglet,
				/decl/background_detail/heritage/yinglet/tribal,
				/decl/background_detail/heritage/yinglet/void,
				/decl/background_detail/heritage/yinglet/misc,
				/decl/background_detail/heritage/other
			),
			/decl/background_category/homeworld = list(
				/decl/background_detail/location/yingletacrology,
				/decl/background_detail/location/tradehousespace,
				/decl/background_detail/location/stateless
			),
			/decl/background_category/faction =   list(
				/decl/background_detail/faction/enclave_scav,
				/decl/background_detail/faction/tradehouse_scav,
				/decl/background_detail/faction/exiled_scav,
				/decl/background_detail/faction/wanderer
			),
			/decl/background_category/religion =  list(
				/decl/background_detail/religion/dinnaism,
				/decl/background_detail/religion/veil_worship,
				/decl/background_detail/religion/angel_worship,
				/decl/background_detail/religion/ancestor_worship,
				/decl/background_detail/religion/faithless,
			)
		)