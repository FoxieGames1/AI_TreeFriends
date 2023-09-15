scrCharactersFix()


if Texto = "Inicio" && TopicOpen = 0
{
	TopicOpen = 1 
	Texto = "Andando..."
}
else
if Texto = "Terminando" && TopicOpen = 1 || TopicOpen = 1.5
{
	with(objVars){alarm[0] = -1}
	Texto = "Voces..." 
	TopicOpen = 2
}

if SetSleep = true //TEMPORAL
{
	if TrueValue = 1
	{
		SetQueue = -1
		with(objCamera){alarm[1] = -1}
		scrDefaultValues() 
		Writing = 0
		TrueValue = 0
		Texto = "";
		
		OneTime = 0
		
		listCurrentNumber = 0
		listNumber = 0
		listLimit = 1
		TopicBefore = Topic
		ReOpen = true
	}
	SetSleep = false
} //TEMPORAL

if Texto = "Voces..."
{
	var TIME_TO_TALK = 40;
	
	if Voces = 0
	{
		listNumber = 0
		alarm[1] = TIME_TO_TALK
		Voces = 1
	}
	else
	if Voces = 2
	{
		if listNumber < listLimit-1
		{
			if NicksPending[listNumber] = "Public"
			{
				if Public = false
				{
					listNumber++
					PublicTalking = 2
					audio_stop_sound(sndPublic)
					audio_play_sound(sndPublic,0,0)
					Public = true
					Voces = 10
				}
			}
			else
			{
				PublicTalking = false
				if (!dlc_tts_is_talking() && !PublicTalking)
				{
					dlc_tts_stop_talking()
					scrCharaTalk()
					listNumber++
					Voces = 3
				}	
			}
		}
		else
		if listNumber >= listLimit-1
		{
			alarm[2] = 60
			End = true
			TopicOpen = 3
			Voces = 3
		}
	}
	else
	if Voces = 3
	{
		if Public = true
		{alarm[1] = TIME_TO_TALK Public = false}
		
		with(objModelGen)
		{
			if Character = global.Character
			{
				if SPR3D = "Idle"
				{
					if dlc_tts_is_talking()
					{SPR3D = "Talk"}
				}
				else
				if SPR3D = "Talk"
				{
					if !dlc_tts_is_talking()
					{
						SPR3D = "Talk_Stop"
						State = "Idle"
						other.alarm[1] = TIME_TO_TALK
						other.Voces = 4
					}
				}
			}
		}
	}
	
	scrPosition()
}

if !instance_exists(objCamera) && Start=false
{
	var Buffer = buffer_create(1, buffer_grow, 1);
	var data = ds_map_create();
	data[? "eventName"] = "Restart_Values";
	data[? "eventPlus"] = listLimit 
	data[? "message_topic"] = Topic
	
	for (var i = 0; i < listMax; ++i) 
	{
		data[? "message_text"] = TextPending[i] 
		data[? "message_nick"] = NicksPending[i]
	}
	
	buffer_write(Buffer, buffer_text , json_encode(data));
	network_send_raw(Socket, Buffer, buffer_tell(Buffer));
	ds_map_destroy(data);
	buffer_delete(Buffer)
}

if Voces = 10
{
	var TIME_TO_TALK = 40;
	
	if !audio_is_playing(sndPublic) && PublicTalking = 2
	{
		if Public = true
		{
			listCurrentNumber = listNumber;
			alarm[1] = TIME_TO_TALK
			PublicTalking = false
			Voces = 4
			Public = 2
		}
	}
}