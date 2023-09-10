if keyboard_check_pressed(vk_space) && TopicOpen = 2
{
	TolkSilence();
	TolkOutput(TextPending[listNumber]);
}

if listNumber > listMax
{
	listNumber = 0	
}

if EventNumb = undefined && TopicOpen = true
{
	alarm[0] = -1
	EventNumb = 0
}

if !buffer_exists(Buffer)
{Buffer = buffer_create(100, buffer_fixed, 100)}