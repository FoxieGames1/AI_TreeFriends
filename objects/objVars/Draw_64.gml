draw_set_color(c_red)

with(objConversationGenerator)
{
	for(var i = 0; i < 10; i++)
	{
		draw_text(0,0+16*i,"TextPending "+string(i)+": "+string(TextPending[i]))
	}
	
	draw_text(320,0, "listNumber: "+string(listNumber))
	draw_text(320,16,"listLimit: "+string(listLimit))
	draw_text(320,32,"Topic: "+string(Topic))
	
	draw_text(320,64,"alarm[2]: "+string(alarm[2]))
}