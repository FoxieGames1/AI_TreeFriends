draw_set_halign(fa_center)
draw_set_color(c_red)
draw_text(320,200-48,"alarm[0]: "+string(alarm[0]))
draw_text(320,200-32,"alarm[1]: "+string(alarm[1]))
draw_text(320,224,"listNumber: "+string(listNumber))
draw_text(320,240,"Check if Topic is open: "+string(TopicOpen))

for(var list = 1; list <= 10; list++)
{
	draw_text(320,256 + 16*list,""+string(NicksPending[list])+": "+string(TextPending[list]))
}

draw_set_halign(fa_left)
draw_text(0,0,"Topic: "+string(Topic))
draw_text(0,16,"Responde: "+string(Responde))

draw_text(0,32,"BufferList: "+string(BufferList) + " /  Buff: "+string(Buff))
draw_text(0,48,"NickDetected: "+string(NickDetected))
draw_text(0,64,"Texto: "+string(Texto))

draw_text(0,80,"Instances: "+string(instance_number(all)))