if EasterEgg = 100 && Music = false
{
	audio_play_sound(musHTFPC98,0,1)	
	Music = 3
}
else
if EasterEgg < 100 && Music = false
{
	audio_play_sound(musHTF,0,1)	
	Music = 3
}

if Music = 2
{
	audio_play_sound(musJeopardy,0,1)
	Music = true
}

EasterEgg = irandom_range(1,100)

if keyboard_check_pressed(vk_f4)
{
	window_set_fullscreen(!window_get_fullscreen())	
	
	if window_get_fullscreen()
	{
		display_set_gui_size(1920,1080)
		window_set_size(1920,1080) 
	}
	else
	if !window_get_fullscreen()
	{
		display_set_gui_size(1280,720)
		window_set_size(1280,720) alarm[0] = 10
	}
}

if Start = false
{
	if window_get_fullscreen()
	{
		display_set_gui_size(1920,1080)
		window_set_size(1920,1080)
	}
	else
	if !window_get_fullscreen()
	{
		display_set_gui_size(1280,720)
		window_set_size(1280,720)
		window_center()
	}
	Start = true	
}