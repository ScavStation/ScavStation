/decl/webhook/fax_sent
	id = WEBHOOK_FAX_SENT

// Data expects a "text" field containing a message.
/decl/webhook/fax_sent/get_message(var/list/data)
	. = ..()
	.["embeds"] = list(list(
		"title" = (data && data["title"]) || "undefined",
		"body" = (data && data["body"]) || "undefined",
		"color" = COLOR_WEBHOOK_DEFAULT
	))
