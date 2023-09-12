/*
if keyboard_check_pressed(vk_space)
{
	TolkSilence();
	TolkOutput(TextPending[listNumber]);
}
*/

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
			if (!TolkIsSpeaking())
			{
				TolkSilence();
				TolkSpeak(TextPending[listNumber])
				listNumber++
				Voces = 3
			}
		}
	}
	else
	if Voces = 3
	{
		if (TolkIsSpeaking())
		{
			alarm[1] = TIME_TO_TALK
			Voces = 4
		}
	}
}

if Texto = "Voces..."
{
	with(objModelGen)
	{
		switch(Character)
		{
			case "Flaky":
			if SPR3D = "Idle"
			{
				if TolkIsSpeaking()
				{SPR3D = "Talk"}
			}
			else
			if SPR3D = "Talk"
			{
				if !TolkIsSpeaking()
				{SPR3D = "Talk_Stop"}
			}
			break;
		}
	}
}