/datum/job/valSal_port/caves
    abstract_type = /datum/job/valSal_port/caves

/datum/job/valSal_port/caves/dweller
    title = "Cave Dweller"
    spawn_positions = -1
    total_positions = -1
    outfit_type = /decl/outfit/job/valSal_port/cave_dweller
    max_skill = list(
        SKILL_MEDICAL = SKILL_MAX,
        SKILL_ANATOMY = SKILL_MAX,
        SKILL_CHEMISTRY = SKILL_MAX
    )
    skill_points = 24

/obj/abstract/landmark/start/valSal_port/cave_dweller
    name = "Cave Dweller"