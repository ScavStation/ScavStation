/spell/open_gateway
	name = "Open Gateway"
	desc = "Open a gateway for your master. Don't do it for too long, or you will die."

	charge_max = 600
	spell_flags = Z2NOCAST
	invocation = "none"
	invocation_type = SpI_NONE

	number_of_channels = 0
	time_between_channels = 200
	hud_state = "const_wall"
	cast_sound = 'sound/effects/meteorimpact.ogg'

/spell/open_gateway/choose_targets()
	var/mob/living/spellcaster = holder
	var/turf/source_turf = get_turf(spellcaster)
	holder.visible_message(SPAN_NOTICE("A gateway opens up underneath \the [spellcaster]!"))
	var/deity
	var/decl/special_role/godcultist/godcult = GET_DECL(/decl/special_role/godcultist)
	if(spellcaster.mind && (spellcaster.mind in godcult.current_antagonists))
		deity = godcult.get_deity(spellcaster.mind)
	return list(new /obj/structure/deity/gateway(source_turf, deity))

/spell/open_gateway/cast(var/list/targets, var/mob/holder, var/channel_count)
	if(prob((channel_count / 5) * 100))
		to_chat(holder, SPAN_DANGER("If you hold the portal open for much longer you'll be ripped apart!"))
	if(channel_count == 6)
		to_chat(holder, SPAN_DANGER("The gateway consumes you... leaving nothing but dust."))
		holder.dust()


/spell/open_gateway/after_spell(var/list/targets)
	QDEL_NULL_LIST(targets)