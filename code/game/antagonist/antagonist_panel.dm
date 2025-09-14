/decl/special_role/proc/get_panel_entry(var/datum/mind/player)

	var/dat = "<tr><td><b>[name]:</b>"
	var/extra = get_extra_panel_options(player)
	if(is_antagonist(player))
		dat += "<a href='byond://?src=\ref[player];remove_antagonist=\ref[src]'>\[-\]</a>"
		dat += "<a href='byond://?src=\ref[player];equip_antagonist=\ref[src]'>\[equip\]</a>"
		if(starting_locations && starting_locations.len)
			dat += "<a href='byond://?src=\ref[player];move_antag_to_spawn=\ref[src]'>\[move to spawn\]</a>"
		if(extra) dat += "[extra]"
	else
		dat += "<a href='byond://?src=\ref[player];add_antagonist=\ref[src]'>\[+\]</a>"
	dat += "</td></tr>"

	return dat

/decl/special_role/proc/get_extra_panel_options()
	return

/decl/special_role/proc/get_check_antag_output(var/datum/admins/calling_admin)

	if(!current_antagonists || !current_antagonists.len)
		return ""

	var/dat = "<br><table cellspacing=5><tr><td><B>[name_plural]</B></td><td></td></tr>"
	for(var/datum/mind/player in current_antagonists)
		var/mob/M = player.current
		dat += "<tr>"
		if(M)
			dat += "<td><a href='byond://?_src_=holder;adminplayeropts=\ref[M]'>[M.real_name]/([player.key])</a>"
			if(!M.client)
				dat += " <i>(logged out)</i>"
			if(M.stat == DEAD)
				dat += " <b><font color='red'>(DEAD)</font></b>"
			dat += "</td>"
			dat += "<td>\[<A href='byond://?src=\ref[calling_admin];priv_msg=\ref[M]'>PM</A>\]\[<A href='byond://?src=\ref[calling_admin];show_special_roles=\ref[M]'>SR</A>\]</td>"
		else
			dat += "<td><i>Mob not found/([player.key])!</i></td>"
		dat += "</tr>"
	dat += "</table>"

	if(flags & ANTAG_HAS_NUKE)
		dat += "<br><table><tr><td><B>Nuclear disk(s)</B></td></tr>"
		for(var/obj/item/disk/nuclear/N in global.nuke_disks)
			dat += "<tr><td>[N.name], "
			var/atom/disk_loc = N.loc
			while(!isturf(disk_loc))
				if(ismob(disk_loc))
					var/mob/M = disk_loc
					dat += "carried by <a href='byond://?src=\ref[calling_admin];adminplayeropts=\ref[M]'>[M.real_name]</a> "
				if(istype(disk_loc, /obj))
					var/obj/O = disk_loc
					dat += "in \a [O.name] "
				disk_loc = disk_loc.loc
			dat += "in [disk_loc.loc] at ([disk_loc.x], [disk_loc.y], [disk_loc.z])</td></tr>"
		dat += "</table>"
	dat += get_additional_check_antag_output(calling_admin)
	dat += "<hr>"
	return dat

//Overridden elsewhere.
/decl/special_role/proc/get_additional_check_antag_output(var/datum/admins/calling_admin)
	return ""
