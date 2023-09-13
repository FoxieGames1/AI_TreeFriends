draw_set_color(c_red)
draw_text(0,0,"global.BufferNewSize: "+string(global.BufferNewSize))

with(objConversationGenerator)
{
	draw_text(0,32,"Topic: "+string(Topic))	
	
	show_debug_message("Buffer: "+string(Buff))
	show_debug_message("listNumber: "+string(listNumber))
}