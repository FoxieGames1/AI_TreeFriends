draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_set_font(fntDmSans)

var VisualX = display_get_gui_width()
var VisualY = display_get_gui_height()


with(objCamera)
{
	draw_text(VisualX/2,32,"alarm[1]: "+string(alarm[1]))
}

with(objConversationGenerator)
{
	draw_text(VisualX/2,64,"TrueValue: "+string(TrueValue))
	
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