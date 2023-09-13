if TimeCard = true
{
	if TimeCardNumber = 1
	{
		if TimeCardSound = false{audio_play_sound(sndAFewMomentsLater,0,0) TimeCardSound = true}
		draw_sprite_ext(sprA_Few_moments_later,0,0,0,1,1,0,c_white,1)

		if !audio_is_playing(sndAFewMomentsLater)
		{alarm[1] = 60 TimeCard = 2}
	}
	else
	if TimeCardNumber = 2
	{
		if TimeCardSound = false{audio_play_sound(sndOneEternityLater,0,0) TimeCardSound = true}
		draw_sprite_ext(sprOne_eternity_later,0,0,0,1,1,0,c_white,1)

		if !audio_is_playing(sndOneEternityLater)
		{alarm[1] = 60 TimeCard = 2}
	}
	else
	if TimeCardNumber = 3
	{
		if TimeCardSound = false{audio_play_sound(sndTwoSecondsLater,0,0) TimeCardSound = true}
		draw_sprite_ext(spr2_Seconds_later,0,0,0,1,1,0,c_white,1)
			
		if !audio_is_playing(sndTwoSecondsLater)
		{alarm[1] = 60 TimeCard = 2}
	}
	else
	if TimeCardNumber = 4
	{
		if TimeCardSound = false{audio_play_sound(sndLater,0,0) TimeCardSound = true}
		draw_sprite_ext(sprLater,0,0,0,1,1,0,c_white,1)
		
		if !audio_is_playing(sndLater)
		{alarm[1] = 60 TimeCard = 2}
	}
}

