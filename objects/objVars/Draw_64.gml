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
		draw_set_color(make_color_rgb(000,000,060))
		draw_text_fixed(VisualX/2+4,VisualY/2+224+4,string(TextPending[listNumber-1]))
		
		draw_set_color(c_white)
		draw_text_fixed(VisualX/2,VisualY/2+224,string(TextPending[listNumber-1]))
	}
}
draw_set_color(c_white)

if global.StartStream = true
{	
	draw_sprite_ext(sprStartup, 0, VisualX/2, VisualY/2,0.7,0.7,0,c_white,1)
}

draw_set_color(c_red)
draw_set_font(fntPC98)

with(objConversationGenerator)
{
	for (var i = 1; i <= 10; ++i)
	{
	    draw_text(128,32+16 + i * 16,"NicksPending "+string(i)+": "+string(NicksPending[i])+ " TEXT: "+string(TextPending[i]))	  
	}
	
	draw_text(256,256,"Voces: "+string(Voces))
	
	draw_text(256,300,"alarm[1]: "+string(alarm[1]))
	draw_text(256,316,"alarm[2]: "+string(alarm[2]))
}

draw_set_color(c_white)
draw_set_font(fntDmSans)