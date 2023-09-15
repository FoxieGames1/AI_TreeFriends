draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_set_font(fntDmSans)

var VisualX = display_get_gui_width()
var VisualY = display_get_gui_height()

draw_set_color(c_red)
with(objConversationGenerator)
{
	draw_text(VisualX/2,32,"alarm[2]: "+string(alarm[2]))
	draw_text(VisualX/2,64,"TopicOpen: "+string(TopicOpen))
	draw_text(VisualX/2,96,"OneTime: "+string(OneTime))
	draw_text(VisualX/2,128,"SetSleep: "+string(SetSleep))
	draw_text(VisualX/2,128+32,"ReOpen: "+string(ReOpen))
	
	draw_set_color(c_white)
	
	if TopicOpen = 0 && Texto = "Voces..."
	{
		other.TextNumber = listNumber
	}
	
	if listNumber > 0 && Texto = "Voces..."
	{
		draw_set_color(make_color_rgb(000,000,060))
		draw_text(VisualX/2+4,VisualY/2+224+4,string(TextPending[listNumber-1]))
		
		draw_set_color(c_white)
		draw_text(VisualX/2,VisualY/2+224,string(TextPending[listNumber-1]))
	}
}