draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_set_font(fntDmSans)

var VisualX = display_get_gui_width()
var VisualY = display_get_gui_height()

with(objConversationGenerator)
{
	draw_set_color(c_white)
	
	if Texto = "Voces..."
	{
		other.TextNumber = listNumber
	}
	
	if listNumber > 0 && Texto = "Voces..."
	{
		var Width = 32*37
		var STR = string(TextPending[listNumber-1]);
	
		var Scale = 1.0;
		var Separation = 40; 
	
		if (string_length(STR) < 282+3)
		{Scale = 1.0 Separation = 40;}
		else
		if (string_length(STR) < 354+3)
		{Scale = 0.8 Separation = 40*0.8}
		else
		if (string_length(STR) < 702+3)
		{Scale = 0.6 Separation = 40*0.6}
		else
		if (string_length(STR) <= 1000+3)
		{Scale = 0.5 Separation = 40*0.5}
		else
		if (string_length(STR) > 1000+3)
		{Scale = 1.0 Separation = 40 STR = "*SPAMMING TEXT*"}
	
		draw_set_color(make_color_rgb(000,000,060))
		draw_text_scribble_ext(VisualX/2+4,VisualY/2+224+4, STR, Width, Separation, Scale)
		
		draw_set_color(c_white)
		draw_text_scribble_ext(VisualX/2,  VisualY/2+224,   STR, Width, Separation, Scale)
	}
}
if global.StartStream = true
{	
	draw_sprite_ext(sprStartup, 0, VisualX/2, VisualY/2,0.7,0.7,0,c_white,1)
}

draw_set_color(c_white)
draw_set_font(fntDmSans)