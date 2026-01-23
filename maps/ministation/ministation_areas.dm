/datum/event/prison_break/medical
	areaType = list(/area/ministation/medical)

/datum/event/prison_break/science
	areaType = list(/area/ministation/science)

/datum/event/prison_break/station
	areaType = list(/area/ministation/security)

/area/ministation
	name = "\improper Ministation"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')
	icon = 'maps/ministation/ministation_areas.dmi'
	icon_state = "default"

/area/ministation/supply_dock
	name = "Supply Shuttle Dock"
	icon_state = "yellow"
	base_turf = /turf/space

/area/ministation/supply
	name = "Supply Shuttle"
	icon_state = "shuttle3"
	req_access = list(access_cargo)
	requires_power = 0

//Hallways
/area/ministation/hall
	icon_state = "white"
	area_flags = AREA_FLAG_HALLWAY

/area/ministation/hall/n
	name = "\improper Forward Hallway"

// first floor hallways

/area/ministation/hall/s1
	name = "\improper L1 Aft Hallway"

//  second floor hallways

/area/ministation/hall/w2
	name = "\improper L2 Port Hallway"

/area/ministation/hall/e2
	name = "\improper L2 Starboard Hallway"

// third floor hallways

/area/ministation/hall/s3
	name = "\improper L3 Aft Hallway"

/area/ministation/hall/n3
	name = "\improper L3 Forward Hallway"

//Maintenance
/area/ministation/maint
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_MAINTENANCE
	req_access = list(access_maint_tunnels)
	turf_initializer = /decl/turf_initializer/maintenance
	icon_state = "orange"
	secure = TRUE

// First floor maint

/area/ministation/maint/westatmos
	name = "\improper West Atmos Maintenance"

/area/ministation/maint/eastatmos
	name = "\improper East Atmos Maintenance"

// /area/ministation/maint/l1nw
//	name = "\improper Level One North West Maintenance"

/area/ministation/maint/l1ne
	name = "\improper Level One North East Maintenance"

/area/ministation/maint/l1central
	name = "\improper Level One Central Maintenance"

// Second Floor Maint

/area/ministation/maint/l2centraln
	name = "\improper Level Two Central North Maintenance"

/area/ministation/maint/l2central
	name = "\improper Level Two Central Maintenance"

/area/ministation/maint/l2centrals
	name = "\improper Level Two Central South Maintenance"

/area/ministation/maint/secmaint
	name = "\improper Security Maintenance"

/area/ministation/maint/hydromaint
	name = "\improper Hydro Maintenance"

/area/ministation/maint/l2underpass
	name = "\improper Level Two Maintenance Underpass"

// Third Floor Maint

/area/ministation/maint/l3nw
	name = "\improper Level Three Northwest Maintenance"

/area/ministation/maint/l3ne
	name = "\improper Level Three Northeast Maintenance"

/area/ministation/maint/l3central
	name = "\improper Level Three Central Maintenance"

/area/ministation/maint/l3sw
	name = "\improper Level Three Southwest Maintenance"

/area/ministation/maint/l3se
	name = "\improper Level Three Southeast Maintenance"

// Fourth Floor Maint
/area/ministation/maint/l4central
	name = "\improper Level Four Central Maintenance"

/area/ministation/maint/l4overpass
	name = "\improper Level Four Maintenance Overpass"

// Fourth Floor Deck

/area/ministation/observation_deck
	name = "\improper Observation Deck"
	icon_state = "white"

/area/ministation/bombrange
	name = "\improper Bomb Range"
	requires_power = 0
	icon_state = "blue"

//Maint Bypasses

/area/ministation/maint/sebypass
	name = "\improper Southeast Maintenance Shaft"

/area/ministation/maint/nebypass
	name = "\improper Northeast Maintenance Shaft"

//Departments
/area/ministation/hop
	name = "\improper Lieutenant's Office"
	req_access = list(access_hop)
	secure = TRUE
	icon_state = "dark_blue"

/area/ministation/janitor
	name = "\improper Custodial Closet"
	req_access = list(access_janitor)
	icon_state = "janitor"

/area/ministation/trash
	name = "\improper Trash Room"
	req_access = list(access_janitor)
	icon_state = "janitor"

/area/ministation/cargo
	name = "\improper Cargo Bay"
	req_access = list(access_mining)
	icon_state = "brown"
	secure = TRUE
/area/ministation/mining
	name = "\improper Mineral Processing"
	req_access = list(access_mining)
	icon_state = "mining_production"
	secure = TRUE

/area/ministation/cargo/f2
	name = "\improper Cargo Bay"
	req_access = list(access_mining)
	icon_state = "brown"
	secure = TRUE

/area/ministation/cargo/f3
	name = "\improper Cargo Bay"
	req_access = list(access_mining)
	icon_state = "brown"
	secure = TRUE

/area/ministation/bridge
	name = "\improper Bridge"
	req_access = list(access_heads)
	secure = TRUE
	icon_state = "dark_blue"

/area/ministation/bridge/vault
	name = "\improper Vault"
	req_access = list(access_heads_vault)
	ambience = list()
	icon_state = "green"

/area/ministation/security
	name = "\improper Security Department"
	req_access = list(access_security)
	secure = TRUE
	icon_state = "red"
	area_flags = AREA_FLAG_SECURITY

/area/ministation/securityoffice
	name = "\improper Security Meeting Office"
	req_access = list(access_security)
	secure = TRUE
	icon_state = "light_blue"
	area_flags = AREA_FLAG_SECURITY

/area/ministation/armory
	name = "\improper Armory"
	req_access = list(access_armory)
	secure = TRUE
	icon_state = "purple"
	area_flags = AREA_FLAG_SECURITY

/area/ministation/detective
	name = "\improper Detective Office"
	req_access = list(access_forensics_lockers)
	secure = TRUE
	icon_state = "dark_blue"

/area/ministation/perma
	name = "\improper Perma Prison"
	req_access = list(access_brig)
	secure = TRUE
	icon_state = "green"

/area/ministation/court
	name = "\improper Court Room"
	req_access =list(access_lawyer)
	turf_initializer = /decl/turf_initializer/maintenance
	secure = TRUE
	icon_state = "pink"

/area/ministation/library
	name = "\improper Library"
	icon_state = "LIB"

/area/ministation/atmospherics
	name = "\improper Atmospherics"
	req_access = list(access_atmospherics)
	icon_state = "ATMOS"

/area/ministation/atmospump
	name = "\improper Atmospherics Aux Pump Room"
	req_access = list(access_atmospherics)
	icon_state = "ATMOS"

/area/ministation/science
	name = "\improper Research & Development Laboratory"
	req_access = list(access_robotics)
	secure = TRUE
	icon_state = "purple"

/area/ministation/psion
	name = "\improper Psion Office"
	req_access = list(access_robotics)
	secure = TRUE
	icon_state = "dark_blue"

/area/ministation/eva
	name = "\improper EVA Storage"
	req_access = list(access_eva)
	secure = TRUE
	icon_state = "dark_blue"

/area/ministation/medical
	name = "\improper Infirmary"
	req_access = list(access_medical)
	icon_state = "light_blue"
	secure = TRUE

/area/ministation/surgicaln
	name = "\improper Surgery North"
	req_access = list(access_medical_equip)
	icon_state = "yellow"
	secure = TRUE

/area/ministation/surgicals
	name = "\improper Surgery South"
	req_access = list(access_medical_equip)
	icon_state = "purple"
	secure = TRUE

/area/ministation/meddocking
	name = "\improper Medical Docking Bay"
	req_access = list()
	icon_state = "green"
	secure = FALSE

/area/ministation/medical/nursery
	name = "\improper Nursery"
	area_flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "green"
	secure = TRUE

/area/ministation/medical/psychology
	name = "\improper Psychology"
	req_zccess = list(access_psychiatrist)
	icon_state = "green"
	secure = TRUE

/area/ministation/cryo
	name = "\improper Medical Cryogenics"
	req_access = list()
	icon_state = "green"
	secure = FALSE

/area/ministation/dorms
	name = "\improper Dormatories"
	req_access = list()
	icon_state = "red"
	secure = FALSE

/area/ministation/hydro
	name = "\improper Hydroponics"
//	req_access = list(access_hydroponics) -- given public access so players can grow things
	icon_state = "green"

/area/ministation/cafe // no access requirement to get in. inner doors need access kitchen
	name = "\improper Dining Lounge"
	icon_state = "red"
	secure = TRUE

/area/ministation/kitchen // no access requirement to get in. inner doors need access kitchen
	name = "\improper Kitchen"
	icon_state = "orange"
	secure = TRUE

/area/ministation/engine
	name = "Engineering"
	req_access = list(access_engine_equip)
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')
	secure = TRUE
	icon_state = "yellow"

/area/ministation/engineroom
	name = "\improper Engine Room"
	req_access = list(access_engine)
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')
	secure = TRUE
	icon_state = "brown"

/area/ministation/enginecontrol
	name = "\improper Engine Control Room"
	req_access = list(access_engine)
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')
	secure = TRUE
	icon_state = "red"

/area/ministation/telecomms
	name = "\improper Telecommunications Control"
	req_access = list(list(access_engine),list(access_heads)) //can get inside to monitor but not actually access anything important. Inner doors have tcomm access
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/signal.ogg','sound/ambience/sonar.ogg')
	secure = TRUE
	icon_state = "light_blue"

/area/ministation/yinglet_rep
	name = "\improper Tradehouse Representative Chamber"
	req_access = list(access_lawyer)
	icon_state = "brown"

/area/ministation/enclave/entrance
	name = "\improper Enclave Entrance"
	req_access = list()
	icon_state = "white"
	secure = FALSE

/area/ministation/Arrival
	name = "\improper Arrival Shuttle" // I hate this ugly thing
	icon_state = "white"
	requires_power = 0

/area/ministation/visitors
	name = "\improper Visiting Shuttles"
	icon_state = "white"
	requires_power = 0

/area/ministation/shuttle/outgoing
	name = "\improper Science Shuttle"
	icon_state = "shuttle"


// CENTCOMMS AREAS

/area/ministation/centcomm/Arrival
	name = "\improper CentComm Arrivals" // I hate this ugly thing
	icon_state = "white"
	requires_power = 0

/area/ministation/centcomm/lounge
	name = "\improper CentComm Lounge"
	icon_state = "orange"

/area/ministation/centcomm/custodials
	name = "\improper CentComm Custodials"
	icon_state = "red"

/area/ministation/centcomm/bbcourt
	name = "\improper CentComm Basketball Court"
	icon_state = "blue"

/area/ministation/centcomm/hell
	name = "\improper Hell"
	icon_state = "green"

/area/ministation/centcomm/atmospherics
	name = "\improper CentComm Atmospherics"
	icon_state = "green"

/area/ministation/centcomm/command
	name = "\improper CentComm Command"
	icon_state = "dark_blue"

/area/ministation/centcomm/backrooms
	name = "\improper CentComm BackRooms"
	icon_state = "pink"

/area/ministation/centcomm/backrooms_2
	name = "\improper CentComm BackRooms"
	icon_state = "pink"

/area/ministation/centcomm/ghost_halls
	name = "\improper CentComm Ghost Halls"
	icon_state = "pink"

// for coherency, apparently an area can't exist in more than one place....
/area/ministation/centcomm/ghost_halls_2
	name = "\improper CentComm Ghost Halls"
	icon_state = "pink"

/area/ministation/centcomm/halls
	name = "\improper CentComm Hallways"
	icon_state = "yellow"

/area/ministation/centcomm/private_room_1
	name = "\improper CentComm Private Room"
	icon_state = "green"

/area/ministation/centcomm/private_room_2
	name = "\improper CentComm Private Room"
	icon_state = "red"

/area/ministation/centcomm/private_room_3
	name = "\improper CentComm Private Room"
	icon_state = "yellow"

/area/ministation/centcomm/bathroom
	name = "\improper CentComm Bathrooms"
	icon_state = "blue"

/area/ministation/centcomm/medbay
	name = "\improper CentComm Medbay"
	icon_state = "blue"

/area/ministation/centcomm/cryo
	name = "\improper CentComm Cryo"
	icon_state = "orange"

// MURPHY's AREAS

/area/ministation/Murphy
	name = "\improper Murphy"
	icon_state = "dark_blue"

/area/ministation/Murphy/bridge
	name = "\improper Murphy Bridge"
	icon_state = "dark_blue"

/area/ministation/Murphy/common
	name = "\improper Murphy Common Area"
	icon_state = "dark_blue"

/area/ministation/Murphy/common/upper
	name = "\improper Murphy Upstairs Common Area"
	icon_state = "dark_blue"

/area/ministation/Murphy/medical
	name = "\improper Murphy Medbay"
	icon_state = "dark_blue"

/area/ministation/Murphy/lounge
	name = "\improper Murphy Lounge"
	icon_state = "dark_blue"

/area/ministation/Murphy/kitchen
	name = "\improper Murphy Kitchen"
	icon_state = "dark_blue"

/area/ministation/Murphy/chem
	name = "\improper Murphy Chemistry Lab"
	icon_state = "dark_blue"

/area/ministation/Murphy/ai
	name = "\improper Murphy AI Core"
	icon_state = "dark_blue"

/area/ministation/Murphy/living
	name = "\improper Murphy Living Room"
	icon_state = "dark_blue"

/area/ministation/Murphy/rnd
	name = "\improper Murphy Research Lab"
	icon_state = "dark_blue"

/area/ministation/Murphy/hydro
	name = "\improper Murphy Hydroponics"
	icon_state = "dark_blue"

/area/ministation/Murphy/toxins
	name = "\improper Murphy Toxins Lab"
	icon_state = "dark_blue"

/area/ministation/Murphy/smresearch
	name = "\improper Murphy Supermatter Research Area"
	icon_state = "dark_blue"

/area/ministation/Murphy/engineering
	name = "\improper Murphy Engineering"
	icon_state = "dark_blue"

/area/ministation/Murphy/atmos
	name = "\improper Murphy Atmospherics"
	icon_state = "dark_blue"

/area/ministation/Murphy/roof
	name = "\improper Murphy Roof"
	icon_state = "dark_blue"

/area/ministation/Murphy/maint
	name = "\improper Murphy Maintenance"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_MAINTENANCE
	icon_state = "dark_blue"

/area/ministation/Murphy/maint/central
	name = "\improper Murphy Maintenance Corridor"
	icon_state = "dark_blue"

/area/ministation/Murphy/maint/Eighteen
	name = "\improper Murphy - Eighteen's Nest"
	icon_state = "dark_blue"

/area/ministation/Murphy/maint/Mawreek
	name = "\improper Murphy - Mawreek's Bedroom Maint"
	icon_state = "dark_blue"

/area/ministation/Murphy/maint/Vayryn
	name = "\improper Murphy - Vayryn's Bedroom Maint"
	icon_state = "dark_blue"

/area/ministation/Murphy/maint/guest
	name = "\improper Murphy - Guest Bedroom Maint"
	icon_state = "dark_blue"

/area/ministation/Murphy/janitors
	name = "\improper Murphy Janitor Closet"
	icon_state = "dark_blue"

/area/ministation/Murphy/bathroom
	name = "\improper Murphy Bathroom"
	icon_state = "dark_blue"

/area/ministation/Murphy/bedroom
	name = "\improper Murphy Bedroom"
	icon_state = "dark_blue"

/area/ministation/Murphy/bedroom/guest
	name = "\improper Murphy Guest Bedroom"
	icon_state = "dark_blue"

/area/ministation/Murphy/bedroom/Steph
	name = "\improper Murphy - Steph's Room"
	icon_state = "dark_blue"

/area/ministation/Murphy/bedroom/Karlawa_Haven
	name = "\improper Murphy - Karlawa and Haven's Room"
	icon_state = "dark_blue"

/area/ministation/Murphy/bedroom/Elicot
	name = "\improper Murphy - Elicot's Room"
	icon_state = "dark_blue"

/area/ministation/Murphy/bedroom/Mawreek
	name = "\improper Murphy - Mawreek's Room"
	icon_state = "dark_blue"

/area/ministation/Murphy/bedroom/Kaawmer
	name = "\improper Murphy - Kaawmer's Room"
	icon_state = "dark_blue"

/area/ministation/Murphy/bedroom/Vayryn
	name = "\improper Murphy - Vayryn's Room"
	icon_state = "dark_blue"

/area/ministation/Murphy/meeting
	name = "\improper Murphy Meeting Room"
	icon_state = "dark_blue"


//satellite
/area/ministation/ai_sat
	name = "\improper Satellite"
	secure = TRUE
	turf_initializer = /decl/turf_initializer/maintenance
	icon_state = "brown"

/area/ministation/ai_core
	name = "\improper AI Core"
	req_access = list(access_ai_upload)
	secure = TRUE
	icon_state = "green"

/area/ministation/ai_upload
	name = "\improper AI Upload Control"
	secure = TRUE
	req_access = list(access_ai_upload)
	icon_state = "light_blue"

/datum/goal/scav_hoard_junk
	valid_areas = list(/area/ministation/yinglet_rep)

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