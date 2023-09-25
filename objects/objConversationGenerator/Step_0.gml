scrCharactersFix()

if Texto = "Inicio"
{
	Texto = "Andando..."
}
else
if Texto = "Terminando"
{
	with(objVars){alarm[0] = -1}
	Texto = "Voces..." 
}

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
					dlc_text_to_speech(TextPending[listNumber-1])
					Voces = 3
				}	
			}
		}
		else
		if listNumber >= listLimit-1
		{
			alarm[2] = 60
			End = true
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

if ClosedTopicWaitToNext = 2
{
	if (CheckDirectory())
	{
		readAndSortFilesByName()
	}
}
else
if ClosedTopicWaitToNext = 3 
{
	with(objCamera)
	{alarm[0] = -1 TimeCard = false TimeCardSound = false WaitingANewRequester = false}

	ClosedTopicWaitToNext = -1
}

if ClosedTopicWaitToNext = -1
{
	ClosedTopicWaitToNext = -2
}