var/global/lightmode_style = url_encode(file2text('code/modules/client/lightmode.css'))
var/global/darkmode_style = url_encode(file2text('code/modules/client/darkmode.css'))

/client/New()
	if(get_preference_value(/datum/client_preference/chat_color_mode) == PREF_DARKMODE)
		activate_darkmode(clear_chat = FALSE)
	else
		deactivate_darkmode(clear_chat = FALSE)
	. = ..()
