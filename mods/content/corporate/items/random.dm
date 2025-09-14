/obj/random/maintenance/security/spawn_choices()
	var/static/injected = FALSE
	. = ..()
	if(!injected)
		.[/obj/item/clothing/head/soft/sec/corp]                =   4
		.[/obj/item/clothing/head/beret/corp/sec]               =   3
		.[/obj/item/clothing/head/beret/corp/sec/corporate/hos] =   3
		.[/obj/item/clothing/head/beret/corp/sec/navy/officer]  =   3
		.[/obj/item/clothing/suit/armor/vest/security]          =   2
		injected = TRUE