/mob/verb/say(var/text_to_say as text)

	if(spam_protection_say >= 1)
		to_chat(span("warning","You are out of breath! Please wait [spam_protection_say - 1] seconds before speaking again!"))
		return FALSE

	if(is_advanced(src))
		var/mob/living/advanced/A = src
		A.start_typing()

	if(!text_to_say)
		text_to_say = input("What would you like to say?")

	text_to_say = police_input(text_to_say)

	if(text_to_say && length(text_to_say))
		var/first_character = copytext(text_to_say,1,2)
		if(first_character == "/" || first_character == "!")
			if(src.client)
				var/client/C = src.client
				var/final_command = trim(copytext(text_to_say,2,0))
				winset(C, null, "command='[final_command]'")
		else if(first_character == ";")
			for(var/obj/item/radio/R in all_radios)
				if(get_turf(R) != get_turf(src))
					continue
				var/final_command = trim(copytext(text_to_say,2,0))
				visible_message(span("notice","\The [src.name] speaks into \the [R.name]."),span("notice","You speak into \the [R.name]."))
				R.send_data(list("speaker" = src, "source" = src, "message" = final_command))
				break
		else
			display_message(src,src,text_to_say,TEXT_TALK)
			if(is_advanced(src))
				var/mob/living/advanced/A = src
				A.do_type(TALK_TYPE_EXCLAIMATION)

	if(is_advanced(src))
		var/mob/living/advanced/A = src
		A.end_typing()

	spam_protection_say += max(0.25,lentext(text_to_say)*0.01)

	return TRUE

/mob/verb/emote(var/emote_id as text)
	//do stuff


/mob/verb/whisper(var/text_to_say as text)
	//do stuff

/mob/verb/looc(var/text_to_say as text)
	display_message(src,src,text_to_say,TEXT_LOOC)

/mob/proc/to_chat(var/text,var/chat_type = CHAT_TYPE_INFO)

	if(client)
		client.to_chat(text,chat_type)
		return TRUE

	return FALSE