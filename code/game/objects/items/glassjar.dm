/obj/item/glass_jar
	name = "glass jar"
	desc = "A small empty jar."
	icon = 'icons/obj/items.dmi'
	icon_state = "jar"
	w_class = 2
	matter = list("glass" = 200)
	flags = NOBLUDGEON
	var/list/accept_mobs = list(/mob/living/simple_animal/lizard, /mob/living/simple_animal/mouse)
	var/contains = FALSE // FALSE = nothing, TRUE = money, 2 = animal, 3 = spiderling

/obj/item/glass_jar/New()
	..()
	update_icon()

/obj/item/glass_jar/afterattack(var/atom/A, var/mob/user, var/proximity)
	if (!proximity || contains)
		return
	if (istype(A, /mob))
		var/accept = FALSE
		for (var/D in accept_mobs)
			if (istype(A, D))
				accept = TRUE
		if (!accept)
			user << "[A] doesn't fit into \the [src]."
			return
		var/mob/L = A
		user.visible_message("<span class='notice'>[user] scoops [L] into \the [src].</span>", "<span class='notice'>You scoop [L] into \the [src].</span>")
		L.forceMove(src)
		contains = 2
		update_icon()
		return

/obj/item/glass_jar/attack_self(var/mob/user)
	switch(contains)
		if (1)
			for (var/obj/O in src)
				O.loc = user.loc
			user << "<span class='notice'>You take money out of \the [src].</span>"
			contains = FALSE
			update_icon()
			return
		if (2)
			for (var/mob/M in src)
				M.loc = user.loc
				user.visible_message("<span class='notice'>[user] releases [M] from \the [src].</span>", "<span class='notice'>You release [M] from \the [src].</span>")
			contains = FALSE
			update_icon()
			return

/obj/item/glass_jar/attackby(var/obj/item/W, var/mob/user)
	/*
	if (istype(W, /obj/item/weapon/spacecash))
		if (contains == FALSE)
			contains = TRUE
		if (contains != TRUE)
			return
		var/obj/item/weapon/spacecash/S = W
		user.visible_message("<span class='notice'>[user] puts [S.worth] [S.worth > 1 ? "thalers" : "thaler"] into \the [src].</span>")
		user.drop_from_inventory(S)
		S.forceMove(src)
		update_icon()*/
	return

/obj/item/glass_jar/update_icon() // Also updates name and desc
	underlays.Cut()
	overlays.Cut()
	switch(contains)
		if (0)
			name = initial(name)
			desc = initial(desc)
		if (1)
			name = "tip jar"
			desc = "A small jar with money inside."
		/*	for (var/obj/item/weapon/spacecash/S in src)
				var/image/money = image(S.icon, S.icon_state)
				money.pixel_x = rand(-2, 3)
				money.pixel_y = rand(-6, 6)
				money.transform *= 0.6
				underlays += money*/
		if (2)
			for (var/mob/M in src)
				var/image/victim = image(M.icon, M.icon_state)
				victim.pixel_y = 6
				underlays += victim
				name = "glass jar with [M]"
				desc = "A small jar with [M] inside."
	return