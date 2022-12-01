/decl/webhook/fax_send
	id = WEBHOOK_FAX_SEND

// Data expects a "text" field containing a message.
/decl/webhook/fax_send/get_message(var/list/data)
	. = ..()
	.["embeds"] = list(list(
		"title" = (data && data["text"]) || "undefined",
		"body" = (data && data["text"]) || "undefined",
		"color" = COLOR_WEBHOOK_DEFAULT
	))
