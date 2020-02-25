/area/ship/bearcat
	name = "Generic Ship"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')

/area/ship/bearcat/crew
	name = "Crew Compartements"
	icon_state = "crew_quarters"

/area/ship/bearcat/crew/hallway/port
	name = "Crew Hallway - Port"

/area/ship/bearcat/crew/hallway/starboard
	name = "Crew Hallway - Starboard"

/area/ship/bearcat/crew/kitchen
	name = "Galley"
	icon_state = "kitchen"

/area/ship/bearcat/crew/cryo
	name = "Cryo Storage"
	icon_state = "cryo"

/area/ship/bearcat/crew/dorms1
	name = "Crew Cabin #1"
	icon_state = "green"

/area/ship/bearcat/crew/dorms2
	name = "Crew Cabin #2"
	icon_state = "purple"

/area/ship/bearcat/crew/dorms3
	name = "Crew Cabin #3"
	icon_state = "yellow"

/area/ship/bearcat/crew/saloon
	name = "Saloon"
	icon_state = "conference"

/area/ship/bearcat/crew/toilets
	name = "Bathrooms"
	icon_state = "toilet"
	turf_initializer = /decl/turf_initializer/maintenance

/area/ship/bearcat/crew/wash
	name = "Washroom"
	icon_state = "locker"

/area/ship/bearcat/crew/medbay
	name = "Medical Bay"
	icon_state = "medbay"

/area/ship/bearcat/cargo
	name = "Cargo Hold"
	icon_state = "quartstorage"

/area/ship/bearcat/cargo/lower
	name = "Lower Cargo Hold"

/area/ship/bearcat/dock
	name = "Docking Bay"
	icon_state = "entry_1"

/area/ship/bearcat/fire
	name = "Firefighting Equipment Comparment"
	icon_state = "green"

/area/ship/bearcat/unused
	name = "Compartment 2-B"
	icon_state = "yellow"
	turf_initializer = /decl/turf_initializer/maintenance
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg')

/area/ship/bearcat/hidden
	name = "Unknown" //shielded compartment
	icon_state = "auxstorage"

/area/ship/bearcat/escape_port
	name = "Port Escape Pods"
	icon_state = "green"

/area/ship/bearcat/escape_star
	name = "Starboard Escape Pods"
	icon_state = "yellow"

/area/ship/bearcat/broken1
	name = "Robotic Maintenance"
	icon_state = "green"

/area/ship/bearcat/broken2
	name = "Compartment 1-B"
	icon_state = "yellow"

/area/ship/bearcat/gambling
	name = "Compartment 1-C"
	icon_state = "cave"

/area/ship/bearcat/maintenance
	name = "Maintenance Compartments"
	icon_state = "amaint"
	req_access = list(access_bearcat)

/area/ship/bearcat/maintenance/hallway
	name = "Maintenance Corridors"

/area/ship/bearcat/maintenance/lower
	name = "Lower Deck Maintenance Compartments"
	icon_state = "sub_maint_aft"

/area/ship/bearcat/maintenance/storage
	name = "Tools Storage"
	icon_state = "engineering_storage"

/area/ship/bearcat/maintenance/techstorage
	name = "Parts Storage"
	icon_state = "engineering_supply"

/area/ship/bearcat/maintenance/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/ship/bearcat/maintenance/engineering
	name = "Engineering Bay"
	icon_state = "engineering_supply"

/area/ship/bearcat/maintenance/atmos
	name = "Atmospherics Comparment"
	icon_state = "atmos"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

/area/ship/bearcat/maintenance/power
	name = "Power Compartment"
	icon_state = "engine_smes"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')

/area/ship/bearcat/maintenance/engine
	icon_state = "engine"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')

/area/ship/bearcat/maintenance/engine/aft
	name = "Main Engine Bay"

/area/ship/bearcat/maintenance/engine/port
	name = "Port Thruster"

/area/ship/bearcat/maintenance/engine/starboard
	name = "Starboard Thruster"

/area/ship/bearcat/command/hallway
	name = "Command Deck"
	icon_state = "centcom"
	req_access = list(access_bearcat)

/area/ship/bearcat/command/bridge
	name = "Bridge"
	icon_state = "bridge"
	req_access = list(access_bearcat)

/area/ship/bearcat/command/captain
	name = "Captain's Quarters"
	icon_state = "captain"
	req_access = list(access_bearcat_captain)

/area/ship/bearcat/comms
	name = "Communications Relay"
	icon_state = "tcomsatcham"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/signal.ogg','sound/ambience/sonar.ogg')

/area/ship/bearcat/shuttle/lift
  name = "Cargo Lift"
  icon_state = "shuttle3"
  base_turf = /turf/simulated/open