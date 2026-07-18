/obj/item/knife/ritual_psionic
	name = "ritual knife"
	desc = "An inscription upon its blade reads: 'Need It Never Be Used'"
	icon = 'icons/obj/items/weapon/knives/ritual.dmi'
	material_alteration = MAT_FLAG_ALTERATION_NONE
	var/has_been_activated = FALSE

/obj/item/knife/ritual_psionic/get_autopsy_descriptors()
	. = ..()
	. += "curved"

/obj/item/knife/ritual_psionic/equipped(mob/living/user, slot)
	. = ..()
	if(!has_been_activated)
		has_been_activated = TRUE

		// add telepathy
		user.add_genetic_condition(/decl/genetic_condition/superpower/remotetalk)

		// set psi faculty and rank
		user.set_psi_rank(PSI_COERCION, PSI_RANK_OPERANT)
		var/datum/ability_handler/psionics/psi = user.get_ability_handler(/datum/ability_handler/psionics)
		psi.update()

/obj/item/sword/katana/vibro/blueslice
	color = "#4040ff"
	name = "Blueslice"
	desc = "A mysterious blade that feels like it both does and does not exist at the same time, leaving a ripple in the air behind it when it moves. <span class='danger'>You get headaches just from looking at it.</span>"

	can_be_twohanded = 1 // Special - The Chosen wielder can two-hand it
	//  Can't overwrite can_twohand_item() because it's part of /mob/living rather than this.
	// Also, setting it to FALSE as before causes it to have no penalty, which is not what's wanted
	minimum_size_to_twohand = -1
	maximum_size_to_twohand = -1

	// Stats for the UNWORTHY
	var/unworthy_thrown_force_multiplier = 0.1
	var/unworthy_wielded_force_multiplier = 0.2
	var/unworthy_attack_cooldown = 5
	var/unworthy_base_attack_force = 2
	var/unworthy_melee_accuracy_bonus = -20
	var/unworthy_armor_penetration = 0
	var/unworthy_base_parry_chance = -20
	var/unworthy_wielded_parry_bonus = 0

	var/weakref/chosen = null
	var/chosen_old_redaction = -1 // -1 means the sword didn't boost their Redaction psi, nothing to do when relinquishing.
	var/redaction_level = PSI_RANK_PARAMOUNT

	// Stats for the CHOSEN ONE
	var/chosen_thrown_force_multiplier = 2
	var/chosen_wielded_force_multiplier = 4
	var/chosen_attack_cooldown = 3 // 0 becomes 3 after init
	var/chosen_base_attack_force = 50
	var/chosen_melee_accuracy_bonus = 20
	var/chosen_armor_penetration = 56 // 40 becomes 56 after init
	var/chosen_base_parry_chance = 40
	var/chosen_wielded_parry_bonus = 30

	paint_color = "#4040ff"
	light_color = "#4040ff"
	paint_verb = "altered"


/obj/item/sword/katana/vibro/blueslice/Initialize()
	. = ..()
	verbs |= /obj/item/sword/katana/vibro/blueslice/proc/forge_connection

/obj/item/sword/katana/vibro/blueslice/set_material(new_material)
	. = ..()
	name = initial(name) // Remove "titatium Blueslice" without skipping all the rest of the bookkeeping

/obj/item/sword/katana/vibro/blueslice/equipped(mob/living/user, slot)
	// Here's where it sets can_be_twohanded...
	var/mob/living/chosen_mob = chosen?.resolve()
	if(user == chosen_mob)
		minimum_size_to_twohand = user.mob_size
		maximum_size_to_twohand = user.mob_size
		_thrown_force_multiplier = chosen_thrown_force_multiplier
		_wielded_force_multiplier = chosen_wielded_force_multiplier
		attack_cooldown = chosen_attack_cooldown
		_base_attack_force = chosen_base_attack_force
		melee_accuracy_bonus = chosen_melee_accuracy_bonus
		armor_penetration = chosen_armor_penetration
		base_parry_chance = chosen_base_parry_chance
		wielded_parry_bonus = chosen_wielded_parry_bonus
		_cached_attack_force = null // Invalidate to force recheck
	else
		minimum_size_to_twohand = -1
		maximum_size_to_twohand = -1
		_thrown_force_multiplier = unworthy_thrown_force_multiplier
		_wielded_force_multiplier = unworthy_wielded_force_multiplier
		attack_cooldown = unworthy_attack_cooldown
		_base_attack_force = unworthy_base_attack_force
		melee_accuracy_bonus = unworthy_melee_accuracy_bonus
		armor_penetration = unworthy_armor_penetration
		base_parry_chance = unworthy_base_parry_chance
		wielded_parry_bonus = unworthy_wielded_parry_bonus
		_cached_attack_force = null // Invalidate to force recheck
	. = ..()

/obj/item/sword/katana/vibro/blueslice/proc/forge_connection()
	set name = "Forge a Connection"
	set category = "Object"
	set src in view(1) // I'd prefer it only show up if it's being held, but I don't know how to do that.

	if(!usr.isEquipped(src))
		to_chat(usr, "You need to hold the sword to be able to forge a connection with it.")
		return FALSE

	if(!chosen?.resolve())
		chosen = weakref(usr) // You are the chosen one!
		to_chat(usr, SPAN_NOTICE("[src] reshapes itself to fit your hand perfectly, feeling like an extention of your will!"))

		// add telepathy
		usr.add_genetic_condition(/decl/genetic_condition/superpower/remotetalk)
		src.verbs |= /obj/item/sword/katana/vibro/blueslice/proc/relinquish
		src.verbs -= /obj/item/sword/katana/vibro/blueslice/proc/forge_connection

		// set psi faculty and rank
		var/datum/ability_handler/psionics/psi = usr?.get_ability_handler(/datum/ability_handler/psionics)
		var/cur_redact = psi?.get_rank(PSI_REDACTION)
		if(cur_redact >= redaction_level) // Their current Redaction is equal to or better than what the sword provides.
			return TRUE
		chosen_old_redaction = cur_redact
		usr.set_psi_rank(PSI_REDACTION, redaction_level)
		if(chosen_old_redaction <= PSI_RANK_LATENT)
			to_chat(usr, SPAN_NOTICE("You can sense the past state of cells within your body (and the body of others), and can bring them into alignment to cure wounds!"))
		else
			to_chat(usr, SPAN_NOTICE("Your ability to manipulate the cells within bodies grows more powerful thanks to [src]."))
		psi = usr.get_ability_handler(/datum/ability_handler/psionics) // Re-get changed handler
		psi.update()
		return TRUE

/obj/item/sword/katana/vibro/blueslice/proc/relinquish()
	set name = "Sever Connection"
	set category = "Object"
	set src in view(1) // I guess others can try?  If the Chosen One is dead, let them clear it?

	var/mob/living/chosen_mob = chosen?.resolve()
	//if(istype(chosen_mob) && usr != chosen_mob && chosen_mob.stat != DEAD)
	if(!chosen_mob) // Mob is gone
		to_chat(usr, SPAN_NOTICE("[src] shudders and seems to grow dull, thrumming with untapped potential."))
		chosen = null
		chosen_old_redaction = -1
		src.verbs -= /obj/item/sword/katana/vibro/blueslice/proc/relinquish
		src.verbs |= /obj/item/sword/katana/vibro/blueslice/proc/forge_connection
		return TRUE

	if(istype(chosen_mob) && usr != chosen_mob) // If you aren't them...
		if(chosen_mob?.stat != DEAD) // And they aren't dead
			to_chat(usr, SPAN_DANGER("You cannot break the link [src] has with [chosen_mob]!"))
			return FALSE // You aren't the Chosen One, you can't relinquish a sword you don't own!
		else // Okay, they are dead/gone.
			to_chat(usr, SPAN_NOTICE("[src] shudders and seems to grow dull, thrumming with untapped potential."))
			var/datum/ability_handler/psionics/psi = chosen_mob?.get_ability_handler(/datum/ability_handler/psionics)
			psi?.set_rank(PSI_REDACTION, chosen_old_redaction) // Remove their psi to prevent a loophole, even though they're dead
			psi?.update()
			chosen = null
			chosen_old_redaction = -1
			src.verbs -= /obj/item/sword/katana/vibro/blueslice/proc/relinquish
			src.verbs |= /obj/item/sword/katana/vibro/blueslice/proc/forge_connection
			return TRUE
	else // The Chosen is voluntarily relinquishing the blade
		to_chat(usr, SPAN_NOTICE("You sever your link with [src]."))
		if(chosen_old_redaction != -1 ) // If we set psi, revert that.
			to_chat(usr, SPAN_DANGER("The extra power granted by [src] fades from your mind!"))
			var/datum/ability_handler/psionics/psi = usr?.get_ability_handler(/datum/ability_handler/psionics)
			psi.set_rank(PSI_REDACTION, chosen_old_redaction)
			psi.update()
			chosen_old_redaction = -1

		chosen = null
		src.verbs -= /obj/item/sword/katana/vibro/blueslice/proc/relinquish
		src.verbs |= /obj/item/sword/katana/vibro/blueslice/proc/forge_connection

/obj/item/sword/katana/vibro/blueslice/preserve_in_cryopod(var/obj/machinery/cryopod/pod)
	return TRUE // Can't delete it that easily...  Blueslice wants to be used.