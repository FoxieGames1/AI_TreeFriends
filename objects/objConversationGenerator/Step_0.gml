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
	if Voces = false
	{listNumber = 1 alarm[1] = 60 Voces = true}
	else
	if Voces = 2
	{
		if (listNumber < listLimit)
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
		if (!TolkIsSpeaking())
		{
			alarm[1] = 30
			Voces = 4
		}
	}
}
