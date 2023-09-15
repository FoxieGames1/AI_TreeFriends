draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_set_font(fntDmSans)

var VisualX = display_get_gui_width()
var VisualY = display_get_gui_height()

if TimeCard > 0
{
	var Scale = 0.70;
	var Width = display_get_gui_width()/2;
	var Height = display_get_gui_height()/2;
	
	if TimeCardNumber = 1
	{
		if TimeCardSound = false{audio_play_sound(sndAFewMomentsLater,0,0) TimeCardSound = true}
		draw_sprite_ext(sprA_Few_moments_later,0,Width,Height,Scale,Scale,0,c_white,1)

		if !audio_is_playing(sndAFewMomentsLater) && TimeCardSound = true
		{
			alarm[1] = 60 alarm[0] = 60*10 TimeCardSound = 2
		}
	}
	else
	if TimeCardNumber = 2
	{
		if TimeCardSound = false{audio_play_sound(sndOneEternityLater,0,0) TimeCardSound = true}
		draw_sprite_ext(sprOne_eternity_later,0,Width,Height,Scale,Scale,0,c_white,1)

		if !audio_is_playing(sndOneEternityLater) && TimeCardSound = true
		{
			alarm[1] = 60 alarm[0] = 60*10 TimeCardSound = 2
		}
	}
	else
	if TimeCardNumber = 3
	{
		if TimeCardSound = false{audio_play_sound(sndTwoSecondsLater,0,0) TimeCardSound = true}
		draw_sprite_ext(spr2_Seconds_later,0,Width,Height,Scale,Scale,0,c_white,1)
			
		if !audio_is_playing(sndTwoSecondsLater) && TimeCardSound = true
		{
			alarm[1] = 60 alarm[0] = 60*10 TimeCardSound = 2
		}
	}
	else
	if TimeCardNumber = 4
	{
		if TimeCardSound = false{audio_play_sound(sndLater,0,0) TimeCardSound = true}
		draw_sprite_ext(sprLater,0,Width,Height,Scale,Scale,0,c_white,1)
		
		if !audio_is_playing(sndLater) && TimeCardSound = true
		{
			alarm[1] = 60 alarm[0] = 60*10 TimeCardSound = 2
		}
	}
}

if WaitingANewRequester = true
{
	draw_set_color(make_color_rgb(000,000,060))
	draw_text(VisualX/2+4,VisualY/2-240+4,string(WaitingText))
		
	draw_set_color(c_yellow)
	draw_text(VisualX/2,VisualY/2-240,string(WaitingText))
}