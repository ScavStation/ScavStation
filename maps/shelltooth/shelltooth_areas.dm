/area/shelltooth
	name = "\improper Generic Station"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')
	icon = 'icons/turf/areas_shelltooth.dmi'
	icon_state = "text"

/area/shelltooth/maint
	name = "\improper Maintenance Tunnel"
	req_access = list(access_maint_tunnels)
	icon_state = "maint"
	area_flags = AREA_FLAG_RAD_SHIELDED

// LEVEL ONE

/area/shelltooth/level_one
	name = "\improper Engineering Deck Hallway"
	icon_state = "1"

/area/shelltooth/level_one/hall
	name = "\improper Level One Hallway"
	icon_state = "hall"

/area/shelltooth/level_one/engine
	name = "\improper Generator Room"
	icon_state = "engine"
	req_access = list(access_engine)

/area/shelltooth/level_one/smes
	name = "\improper Power Control"
	icon_state = "smes"
	req_access = list(access_engine)

/area/shelltooth/level_one/engineering
	name = "\improper Engineering"
	icon_state = "engineering"
	req_access = list(access_engine)

/area/shelltooth/level_one/atmos
	name = "\improper Atmospherics"
	icon_state = "atmos"
	req_access = list(access_atmospherics)

/area/shelltooth/level_one/tools
	name = "\improper Tool Storage"
	icon_state = "storage"
	req_access = list(access_engine_equip)

/area/shelltooth/level_one/janitor
	name = "\improper Custodial Storage"
	icon_state = "janitor"
	req_access = list(access_janitor)

/area/shelltooth/level_one/disposals
	name = "\improper Disposals Management"
	icon_state = "disposals"


/area/shelltooth/maint/level_one/north
	name = "\improper Maintenance 1-A"
	icon_state = "maint_n"

/area/shelltooth/maint/level_one/south
	name = "\improper Maintenance 1-B"
	icon_state = "maint_s"

/area/shelltooth/maint/level_one/secret
	name = "\improper Maintenance 1-?"
	icon_state = "maint_secret"

// LEVEL TWO

/area/shelltooth/level_two
	name = "\improper Habitation Deck"
	icon_state = "2"

/area/shelltooth/level_two/hall
	name = "\improper Level Two Hallway"
	icon_state = "hall"

/area/shelltooth/level_two/dorm
	name = "\improper Doromitory"
	icon_state = "dorm"

/area/shelltooth/level_two/kitchen
	name = "\improper Kitchen"
	icon_state = "kitchen"

/area/shelltooth/level_two/cafe
	name = "\improper Cafeteria"
	icon_state = "cafe"

/area/shelltooth/level_two/laundry
	name = "\improper Laundry"
	icon_state = "laundry"

/area/shelltooth/level_two/bathroom
	name = "\improper Bathroom"
	icon_state = "bathroom"

/area/shelltooth/level_two/med
	name = "\improper Medical"
	icon_state = "med"

/area/shelltooth/level_two/chem
	name = "\improper Chemistry"
	icon_state = "chem"

/area/shelltooth/level_two/cryo
	name = "\improper Cryogenics"
	icon_state = "cryo"

/area/shelltooth/level_two/nursery
	name = "\improper Nursery"
	icon_state = "nursery"

/area/shelltooth/level_two/hydro
	name = "\improper Hydroponics"
	icon_state = "hydro"

/area/shelltooth/level_two/rec
	name = "\improper Recreation"
	icon_state = "rec"

/area/shelltooth/level_two/backstage
	name = "\improper Backstage"
	icon_state = "stage"


/area/shelltooth/maint/level_two/north
	name = "\improper Maintenance 2-A"
	icon_state = "maint_n"

/area/shelltooth/maint/level_two/north_east
	name = "\improper Maintenance 2-B"
	icon_state = "maint_ne"

/area/shelltooth/maint/level_two/east
	name = "\improper Maintenance 2-C"
	icon_state = "maint_e"

/area/shelltooth/maint/level_two/south_east
	name = "\improper Maintenance 2-D"
	icon_state = "maint_se"

/area/shelltooth/maint/level_two/south
	name = "\improper Maintenance 2-E"
	icon_state = "maint_s"

/area/shelltooth/maint/level_two/south_west
	name = "\improper Maintenance 2-F"
	icon_state = "maint_sw"

/area/shelltooth/maint/level_two/west
	name = "\improper Maintenance 2-G"
	icon_state = "maint_w"

/area/shelltooth/maint/level_two/north_west
	name = "\improper Maintenance 2-H"
	icon_state = "maint_nw"

// LEVEL THREE

/area/shelltooth/level_three
	name = "\improper Hangar Deck"
	icon_state = "3"

/area/shelltooth/level_three/hall
	name = "\improper Level Three Hallway"
	icon_state = "hall"

/area/shelltooth/level_three/cargo
	name = "\improper Cargo"
	icon_state = "cargo"

/area/shelltooth/level_three/dock_one
	name = "\improper Dock 1 (Transport Terminal)"
	icon_state = "dock_1"

/area/shelltooth/level_three/dock_two
	name = "\improper Dock 2 (Exploration Terminal)"
	icon_state = "dock_2"

/area/shelltooth/level_three/eva
	name = "\improper EVA"
	icon_state = "eva"

/area/shelltooth/level_three/hop
	name = "\improper ID Office"
	icon_state = "hop"


/area/shelltooth/maint/level_three/north_east
	name = "\improper Maintenance 3-A"
	icon_state = "maint_ne"

/area/shelltooth/maint/level_three/south_east
	name = "\improper Maintenance 3-B"
	icon_state = "maint_se"

// LEVEL FOUR

/area/shelltooth/level_four
	name = "\improper Operations Deck"
	icon_state = "4"

/area/shelltooth/level_four/hall
	name = "\improper Level Four Hallway"
	icon_state = "hall"

/area/shelltooth/level_four/science
	name = "\improper Research & Development"
	icon_state = "science"

/area/shelltooth/level_four/xenobiology
	name = "\improper Xenobiology"
	icon_state = "slime"

/area/shelltooth/level_four/xenobotany
	name ="\improper Xenobotany"
	icon_state = "xenobotany"

/area/shelltooth/level_four/brig
	name = "\improper Naughty Yinglet Box"
	icon_state = "gaol"

/area/shelltooth/level_four/bot_storage
	name = "\improper Robot Storage"
	icon_state = "bot"


/area/shelltooth/maint/level_four/north_east
	name = "\improper Maintenance 4-A"
	icon_state = "maint_ne"

/area/shelltooth/maint/level_four/east
	icon_state = "maint_e"

/area/shelltooth/level_four/storage
	icon_state = "storage"

// LEVEL FIVE

/area/shelltooth/level_five
	name = "\improper Command Deck"
	icon_state = "5"

/area/shelltooth/level_five/hall
	name = "\improper Level Five Hallway"
	icon_state = "hall"

/area/shelltooth/level_five/matriarch
	name = "\improper Matriarch's Chamber"
	icon_state = "matriarch"

/area/shelltooth/level_five/attend
	name = "\improper Attendent Quarter"
	icon_state = "attend"

/area/shelltooth/level_five/heads
	name = "\improper Clan Meeting Room"
	icon_state = "heads"

/area/shelltooth/level_five/control
	name = "\improper Station Control"

/area/shelltooth/level_five/comms
	name = "\improper Telecomms"
	icon_state = "comms"

/area/shelltooth/maint/level_five/north
	name = "\improper Maintenance 5-A"
	icon_state = "maint_n"

/area/shelltooth/maint/level_five/east
	name = "\improper Maintenance 5-B"
	icon_state = "maint_e"

// TURBOLIFT!!!

/area/turbolift/level_one
	name = "Engineering Deck Landing"
	icon_state = "1"

/area/turbolift/level_two
	name = "Habitation Deck Landing"
	icon_state = "2"

/area/turbolift/level_three
	name = "Hangar Deck Landing"
	icon_state = "3"

/area/turbolift/level_four
	name = "Operations Deck Landing"
	icon_state = "4"

/area/turbolift/level_five
	name = "Command Deck Landing"
	icon_state = "5"

