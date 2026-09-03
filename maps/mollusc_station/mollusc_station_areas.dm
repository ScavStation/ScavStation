/datum/event/prison_break/medical
	areaType = list(/area/mollusc_station/medical)

/datum/event/prison_break/science
	areaType = list(/area/mollusc_station/science)

/datum/event/prison_break/station
	areaType = list(/area/mollusc_station/security)

/area/mollusc_station
	name = "\improper Mollusc Station"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')
	icon = 'maps/mollusc_station/mollusc_station_areas.dmi'
	icon_state = "default"

/area/mollusc_station/supply_dock
	name = "Supply Shuttle Dock"
	icon_state = "yellow"
	base_turf = /turf/space

/area/mollusc_station/supply
	name = "Supply Shuttle"
	icon_state = "shuttle3"
	req_access = list(access_cargo)
	requires_power = 0

//Hallways
/area/mollusc_station/hall
	icon_state = "white"
	area_flags = AREA_FLAG_HALLWAY

/area/mollusc_station/hall/n
	name = "\improper Forward Hallway"

// first floor hallways

/area/mollusc_station/hall/s1
	name = "\improper L1 Aft Hallway"

//  second floor hallways

/area/mollusc_station/hall/w2
	name = "\improper L2 Port Hallway"

/area/mollusc_station/hall/e2
	name = "\improper L2 Starboard Hallway"

// third floor hallways

/area/mollusc_station/hall/s3
	name = "\improper L3 Aft Hallway"

/area/mollusc_station/hall/n3
	name = "\improper L3 Forward Hallway"

//Maintenance
/area/mollusc_station/maint
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_MAINTENANCE
	req_access = list(access_maint_tunnels)
	turf_initializer = /decl/turf_initializer/maintenance
	icon_state = "orange"
	secure = TRUE

// First floor maint

/area/mollusc_station/maint/westatmos
	name = "\improper West Atmos Maintenance"

/area/mollusc_station/maint/eastatmos
	name = "\improper East Atmos Maintenance"

// /area/mollusc_station/maint/l1nw
//	name = "\improper Level One North West Maintenance"

/area/mollusc_station/maint/l1ne
	name = "\improper Level One North East Maintenance"

/area/mollusc_station/maint/l1central
	name = "\improper Level One Central Maintenance"

// Second Floor Maint

/area/mollusc_station/maint/l2centraln
	name = "\improper Level Two Central North Maintenance"

/area/mollusc_station/maint/l2central
	name = "\improper Level Two Central Maintenance"

/area/mollusc_station/maint/l2centrals
	name = "\improper Level Two Central South Maintenance"

/area/mollusc_station/maint/secmaint
	name = "\improper Security Maintenance"

/area/mollusc_station/maint/hydromaint
	name = "\improper Hydro Maintenance"

/area/mollusc_station/maint/l2underpass
	name = "\improper Level Two Maintenance Underpass"

// Third Floor Maint

/area/mollusc_station/maint/l3nw
	name = "\improper Level Three Northwest Maintenance"

/area/mollusc_station/maint/l3ne
	name = "\improper Level Three Northeast Maintenance"

/area/mollusc_station/maint/l3central
	name = "\improper Level Three Central Maintenance"

/area/mollusc_station/maint/l3sw
	name = "\improper Level Three Southwest Maintenance"

/area/mollusc_station/maint/l3se
	name = "\improper Level Three Southeast Maintenance"

// Fourth Floor Maint
/area/mollusc_station/maint/l4central
	name = "\improper Level Four Central Maintenance"

/area/mollusc_station/maint/l4overpass
	name = "\improper Level Four Maintenance Overpass"

// Fourth Floor Deck

/area/mollusc_station/observation_deck
	name = "\improper Observation Deck"
	icon_state = "white"

/area/mollusc_station/bombrange
	name = "\improper Bomb Range"
	requires_power = 0
	icon_state = "blue"

//Maint Bypasses

/area/mollusc_station/maint/sebypass
	name = "\improper Southeast Maintenance Shaft"

/area/mollusc_station/maint/nebypass
	name = "\improper Northeast Maintenance Shaft"

//Departments
/area/mollusc_station/hop
	name = "\improper Lieutenant's Office"
	req_access = list(access_hop)
	secure = TRUE
	icon_state = "dark_blue"

/area/mollusc_station/janitor
	name = "\improper Custodial Closet"
	req_access = list(access_janitor)
	icon_state = "janitor"

/area/mollusc_station/trash
	name = "\improper Trash Room"
	req_access = list(access_janitor)
	icon_state = "janitor"

/area/mollusc_station/cargo
	name = "\improper Cargo Bay"
	req_access = list(access_mining)
	icon_state = "brown"
	secure = TRUE
/area/mollusc_station/mining
	name = "\improper Mineral Processing"
	req_access = list(access_mining)
	icon_state = "mining_production"
	secure = TRUE

/area/mollusc_station/cargo/f2
	name = "\improper Cargo Bay"
	req_access = list(access_mining)
	icon_state = "brown"
	secure = TRUE

/area/mollusc_station/cargo/f3
	name = "\improper Cargo Bay"
	req_access = list(access_mining)
	icon_state = "brown"
	secure = TRUE

/area/mollusc_station/bridge
	name = "\improper Bridge"
	req_access = list(access_heads)
	secure = TRUE
	icon_state = "dark_blue"

/area/mollusc_station/bridge/vault
	name = "\improper Vault"
	req_access = list(access_heads_vault)
	ambience = list()
	icon_state = "green"

/area/mollusc_station/security
	name = "\improper Security Department"
	req_access = list(access_security)
	secure = TRUE
	icon_state = "red"
	area_flags = AREA_FLAG_SECURITY

/area/mollusc_station/securityoffice
	name = "\improper Security Meeting Office"
	req_access = list(access_security)
	secure = TRUE
	icon_state = "light_blue"
	area_flags = AREA_FLAG_SECURITY

/area/mollusc_station/armory
	name = "\improper Armory"
	req_access = list(access_armory)
	secure = TRUE
	icon_state = "purple"
	area_flags = AREA_FLAG_SECURITY

/area/mollusc_station/detective
	name = "\improper Detective Office"
	req_access = list(access_forensics_lockers)
	secure = TRUE
	icon_state = "dark_blue"

/area/mollusc_station/perma
	name = "\improper Perma Prison"
	req_access = list(access_brig)
	secure = TRUE
	icon_state = "green"

/area/mollusc_station/court
	name = "\improper Court Room"
	req_access =list(access_lawyer)
	turf_initializer = /decl/turf_initializer/maintenance
	secure = TRUE
	icon_state = "pink"

/area/mollusc_station/library
	name = "\improper Library"
	icon_state = "LIB"

/area/mollusc_station/atmospherics
	name = "\improper Atmospherics"
	req_access = list(access_atmospherics)
	icon_state = "ATMOS"

/area/mollusc_station/atmospump
	name = "\improper Atmospherics Aux Pump Room"
	req_access = list(access_atmospherics)
	icon_state = "ATMOS"

/area/mollusc_station/science
	name = "\improper Research & Development Laboratory"
	req_access = list(access_robotics)
	secure = TRUE
	icon_state = "purple"

/area/mollusc_station/psion
	name = "\improper Psion Office"
	req_access = list(access_robotics)
	secure = TRUE
	icon_state = "dark_blue"

/area/mollusc_station/eva
	name = "\improper EVA Storage"
	req_access = list(access_eva)
	secure = TRUE
	icon_state = "dark_blue"

/area/mollusc_station/medical
	name = "\improper Infirmary"
	req_access = list(access_medical)
	icon_state = "light_blue"
	secure = TRUE

/area/mollusc_station/surgicaln
	name = "\improper Surgery North"
	req_access = list(access_medical_equip)
	icon_state = "yellow"
	secure = TRUE

/area/mollusc_station/surgicals
	name = "\improper Surgery South"
	req_access = list(access_medical_equip)
	icon_state = "purple"
	secure = TRUE

/area/mollusc_station/meddocking
	name = "\improper Medical Docking Bay"
	req_access = list()
	icon_state = "green"
	secure = FALSE

/area/mollusc_station/medical/nursery
	name = "\improper Nursery"
	area_flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "green"
	secure = TRUE

/area/mollusc_station/medical/psychology
	name = "\improper Psychology"
	req_access = list(access_psychiatrist)
	icon_state = "green"
	secure = TRUE

/area/mollusc_station/cryo
	name = "\improper Medical Cryogenics"
	req_access = list()
	icon_state = "green"
	secure = FALSE

/area/mollusc_station/dorms
	name = "\improper Dormatories"
	req_access = list()
	icon_state = "red"
	secure = FALSE

/area/mollusc_station/hydro
	name = "\improper Hydroponics"
//	req_access = list(access_hydroponics) -- given public access so players can grow things
	icon_state = "green"

/area/mollusc_station/cafe // no access requirement to get in. inner doors need access kitchen
	name = "\improper Dining Lounge"
	icon_state = "red"
	secure = TRUE

/area/mollusc_station/kitchen // no access requirement to get in. inner doors need access kitchen
	name = "\improper Kitchen"
	icon_state = "orange"
	secure = TRUE

/area/mollusc_station/engine
	name = "Engineering"
	req_access = list(access_engine_equip)
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')
	secure = TRUE
	icon_state = "yellow"

/area/mollusc_station/engineroom
	name = "\improper Engine Room"
	req_access = list(access_engine)
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')
	secure = TRUE
	icon_state = "brown"

/area/mollusc_station/enginecontrol
	name = "\improper Engine Control Room"
	req_access = list(access_engine)
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')
	secure = TRUE
	icon_state = "red"

/area/mollusc_station/telecomms
	name = "\improper Telecommunications Control"
	req_access = list(list(access_engine),list(access_heads)) //can get inside to monitor but not actually access anything important. Inner doors have tcomm access
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/signal.ogg','sound/ambience/sonar.ogg')
	secure = TRUE
	icon_state = "light_blue"

/area/mollusc_station/yinglet_rep
	name = "\improper Tradehouse Representative Chamber"
	req_access = list(access_lawyer)
	icon_state = "brown"

/area/mollusc_station/enclave/entrance
	name = "\improper Enclave Entrance"
	req_access = list()
	icon_state = "white"
	secure = FALSE

/area/mollusc_station/Arrival
	name = "\improper Arrival Shuttle" // I hate this ugly thing
	icon_state = "white"
	requires_power = 0

/area/mollusc_station/visitors
	name = "\improper Visiting Shuttles"
	icon_state = "white"
	requires_power = 0

/area/mollusc_station/shuttle/outgoing
	name = "\improper Science Shuttle"
	icon_state = "shuttle"


// CENTCOMMS AREAS

/area/mollusc_station/centcomm/Arrival
	name = "\improper CentComm Arrivals" // I hate this ugly thing
	icon_state = "white"
	requires_power = 0

/area/mollusc_station/centcomm/lounge
	name = "\improper CentComm Lounge"
	icon_state = "orange"

/area/mollusc_station/centcomm/custodials
	name = "\improper CentComm Custodials"
	icon_state = "red"

/area/mollusc_station/centcomm/bbcourt
	name = "\improper CentComm Basketball Court"
	icon_state = "blue"

/area/mollusc_station/centcomm/hell
	name = "\improper Hell"
	icon_state = "green"

/area/mollusc_station/centcomm/atmospherics
	name = "\improper CentComm Atmospherics"
	icon_state = "green"

/area/mollusc_station/centcomm/command
	name = "\improper CentComm Command"
	icon_state = "dark_blue"

/area/mollusc_station/centcomm/backrooms
	name = "\improper CentComm BackRooms"
	icon_state = "pink"

/area/mollusc_station/centcomm/backrooms_2
	name = "\improper CentComm BackRooms"
	icon_state = "pink"

/area/mollusc_station/centcomm/ghost_halls
	name = "\improper CentComm Ghost Halls"
	icon_state = "pink"

// for coherency, apparently an area can't exist in more than one place....
/area/mollusc_station/centcomm/ghost_halls_2
	name = "\improper CentComm Ghost Halls"
	icon_state = "pink"

/area/mollusc_station/centcomm/halls
	name = "\improper CentComm Hallways"
	icon_state = "yellow"

/area/mollusc_station/centcomm/private_room_1
	name = "\improper CentComm Private Room"
	icon_state = "green"

/area/mollusc_station/centcomm/private_room_2
	name = "\improper CentComm Private Room"
	icon_state = "red"

/area/mollusc_station/centcomm/private_room_3
	name = "\improper CentComm Private Room"
	icon_state = "yellow"

/area/mollusc_station/centcomm/bathroom
	name = "\improper CentComm Bathrooms"
	icon_state = "blue"

/area/mollusc_station/centcomm/medbay
	name = "\improper CentComm Medbay"
	icon_state = "blue"

/area/mollusc_station/centcomm/cryo
	name = "\improper CentComm Cryo"
	icon_state = "orange"

// MURPHY's AREAS

/area/mollusc_station/Murphy
	name = "\improper Murphy"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/bridge
	name = "\improper Murphy Bridge"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/common
	name = "\improper Murphy Common Area"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/ratcage
	name = "\improper Murphy Rat Cage"
	icon_state = "dark_blue"
	area_flags = AREA_FLAG_RAD_SHIELDED
	requires_power = 0 // There's one light bulb and I don't want to make a whole new APC that goes inside the cage just for it.

/area/mollusc_station/Murphy/common/upper
	name = "\improper Murphy Upstairs Common Area"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/medical
	name = "\improper Murphy Medbay"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/lounge
	name = "\improper Murphy Lounge"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/kitchen
	name = "\improper Murphy Kitchen"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/chem
	name = "\improper Murphy Chemistry Lab"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/ai
	name = "\improper Murphy AI Core"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/living
	name = "\improper Murphy Living Room"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/rnd
	name = "\improper Murphy Research Lab"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/hydro
	name = "\improper Murphy Hydroponics"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/robotics
	name = "\improper Murphy Robotics Facilities"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/smresearch
	name = "\improper Murphy Supermatter Research Area"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/lowercommon
	name = "\improper Murphy Lower Deck Common Area"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/atmos
	name = "\improper Murphy Atmospherics"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/roof
	name = "\improper Murphy Roof"
	icon_state = "dark_blue"
	is_outside = TRUE

/area/mollusc_station/Murphy/maint
	name = "\improper Murphy Maintenance"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_MAINTENANCE
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/maint/central
	name = "\improper Murphy Maintenance Corridor"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/maint/midMaint
	name = "\improper Murphy - Midpoint Maintenance Corridor"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_MAINTENANCE
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/maint/Mawreek
	name = "\improper Murphy - Mawreek's Bedroom Maint"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/maint/Vayryn
	name = "\improper Murphy - Vayryn's Bedroom Maint"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/maint/guest
	name = "\improper Murphy - Guest Bedroom Maint"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/janitors
	name = "\improper Murphy Janitor Closet"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/bathroom
	name = "\improper Murphy Bathroom"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/bedroom
	name = "\improper Murphy Bedroom"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/bedroom/guest
	name = "\improper Murphy Guest Bedroom"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/bedroom/Steph
	name = "\improper Murphy - Steph's Room"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/bedroom/Karlawa_Haven
	name = "\improper Murphy - Karlawa and Haven's Room"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/bedroom/Elicot
	name = "\improper Murphy - Elicot's Room"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/bedroom/Mawreek
	name = "\improper Murphy - Mawreek's Room"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/bedroom/Kaawmer
	name = "\improper Murphy - Kaawmer's Room"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/bedroom/Vayryn
	name = "\improper Murphy - Vayryn's Room"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/bedroom/Jackson
	name = "\improper Murphy - Jackson Shaw's Room"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/meeting
	name = "\improper Murphy Meeting Room"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/exterior
	name = "\improper Murphy Exterior"
	icon_state = "dark_blue"
	is_outside = TRUE

/area/mollusc_station/Murphy/bedroom/Auciel
	name = "\improper Murphy - Auciel's Room"
	icon_state = "dark_blue"
/area/mollusc_station/Murphy/bedroom/Radina
	name = "\improper Murphy - Radina's Room"
	icon_state = "dark_blue"
/area/mollusc_station/Murphy/bedroom/Verity
	name = "\improper Murphy - Verity's Room"
	icon_state = "dark_blue"
/area/mollusc_station/Murphy/bedroom/James
	name = "\improper Murphy - James' Room"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/unfinished
	name = "\improper Murphy - Unfinished Area"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/lowerairlock
	name = "\improper Murphy Lower Deck Airlock"
	icon_state = "dark_blue"

/area/mollusc_station/Murphy/engineeringstorage
	name = "\improper Murphy Engineering Storage"
	icon_state = "dark_blue"

//satellite
/area/mollusc_station/ai_sat
	name = "\improper Satellite"
	secure = TRUE
	turf_initializer = /decl/turf_initializer/maintenance
	icon_state = "brown"

/area/mollusc_station/ai_core
	name = "\improper AI Core"
	req_access = list(access_ai_upload)
	secure = TRUE
	icon_state = "green"

/area/mollusc_station/ai_upload
	name = "\improper AI Upload Control"
	secure = TRUE
	req_access = list(access_ai_upload)
	icon_state = "light_blue"

/datum/goal/scav_hoard_junk
	valid_areas = list(/area/mollusc_station/yinglet_rep)

/area/shuttle/escape_shuttle
	name = "\improper Emergency Shuttle"
	icon_state = "shuttle"

//Elevator

/area/turbolift
	name = "\improper Elevator"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = TRUE
	sound_env = STANDARD_STATION
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	ambience = list(
		'sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg'
	)

	arrival_sound = null
	lift_announce_str = null

/area/turbolift/alert_on_fall(var/mob/living/human/H)
	if(H.client && SSpersistence.elevator_fall_shifts > 0)
		SSwebhooks.send(WEBHOOK_ELEVATOR_FALL, list("text" = "We managed to make it [SSpersistence.elevator_fall_shifts] shift\s without someone falling down an elevator shaft."))
		SSpersistence.elevator_fall_shifts = -1

/area/turbolift/l1
	name = "Station Level 1"
	base_turf = /turf/floor/plating

/area/turbolift/l2
	name = "Station Level 2"
	base_turf = /turf/open

/area/turbolift/l3
	name = "Station Level 3"
	base_turf = /turf/open

/area/turbolift/l1p
	name = "Station Level 1"
	base_turf = /turf/floor

/area/turbolift/l2p
	name = "Station Level 2"
	base_turf = /turf/open

/area/turbolift/l3p
	name = "Station Level 3"
	base_turf = /turf/open