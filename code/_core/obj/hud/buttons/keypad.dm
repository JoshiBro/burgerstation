/obj/hud/button/keypad
	name = "keypad"

	var/stored_keypad = 0

/obj/hud/button/keypad/top
	icon_state = "keypad_top"
	screen_loc = "CENTER+2,CENTER+2"
	maptext = "<p align='right'>Hello</p>"
	maptext_y = 14
	maptext_x = -2

/obj/hud/button/keypad/top/update_icon()
	if(stored_keypad)
		maptext = "<p align='right'>[stored_keypad]</p>"
	else
		maptext = null
	return ..()

/obj/hud/button/keypad/top/clicked_on_by_object(var/mob/caller,object,location,control,params)

	var/number_selected = 0

	switch(text2num(params[PARAM_ICON_X]))
		if(1 to 10)
			number_selected = 1
		if(12 to 21)
			number_selected = 2
		if(23 to 32)
			number_selected = 3
		else
			number_selected = -100

	switch(text2num(params[PARAM_ICON_Y]))
		if(12 to 21)
			number_selected *= 1
		if(1 to 10)
			number_selected += 3
		else
			number_selected = -100

	if(number_selected == -100)
		return TRUE

	else if(stored_keypad > 999)
		return ..()

	else if(stored_keypad >= 0)
		stored_keypad = (stored_keypad*10) + number_selected

	for(var/obj/hud/button/keypad/K in caller.buttons)
		K.stored_keypad = stored_keypad
		K.update_icon()

	world.log << stored_keypad

	return ..()

/obj/hud/button/keypad/bottom
	icon_state = "keypad_bottom"
	screen_loc = "CENTER+2,CENTER+1"

/obj/hud/button/keypad/bottom/clicked_on_by_object(var/mob/caller,object,location,control,params)

	var/number_selected = 0

	switch(text2num(params[PARAM_ICON_X]))
		if(1 to 10)
			number_selected = 7
		if(12 to 21)
			number_selected = 8
		if(23 to 32)
			number_selected = 9
		else
			number_selected = -100

	switch(text2num(params[PARAM_ICON_Y]))
		if(22 to 32)
			number_selected *= 1
		if(11 to 20)
			if(number_selected == 7)
				number_selected = -1
			else if(number_selected == 8)
				number_selected = 0
			else if(number_selected == 9)
				number_selected = -2

		else
			number_selected = -100

	if(number_selected == -1)
		//Clear
		stored_keypad = 0

	else if(number_selected == -2)
		//Submit
		return TRUE

	else if(number_selected == -100)
		//Nothing
		return TRUE

	else if(stored_keypad > 999)
		return ..()

	else if(stored_keypad >= 0)
		stored_keypad = (stored_keypad*10) + number_selected

	for(var/obj/hud/button/keypad/K in caller.buttons)
		K.stored_keypad = stored_keypad
		K.update_icon()

	world.log << stored_keypad

	return ..()