if listNumber > listMax
{
	listNumber = 0	
}

if !buffer_exists(Buffer)
{Buffer = buffer_create(100, buffer_fixed, 100)}

if Texto = "Inicio" && TopicOpen = 0
{TopicOpen = 1 Texto = "Andando..."}
else
if Texto = "Andando..." && TopicOpen = 1 && Responde = "Closed Topic"
{Texto = "Voces..."}

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
		if (listNumber < listLimit-1)
		{
			if (!dlc_tts_is_talking())
			{
				dlc_tts_stop_talking()
				scrCharaTalk()
				listNumber++
				Voces = 3
			}
		}
	}
	else
	if Voces = 3
	{
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
					}
				}
			}
		}
		
		if !dlc_tts_is_talking()
		{
			alarm[1] = TIME_TO_TALK
			Voces = 4
		}
	}
}

scrPosition()