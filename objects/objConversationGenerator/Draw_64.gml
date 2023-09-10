draw_set_halign(fa_center)
if TextoNuevo != "" && TopicOpen = false
{
	TopicOpen = true
}

if TextoNuevo = "Closed Topic" && TopicOpen = true
{
	TextoNuevo = ""
	TopicOpen = 2
}
draw_text(320,200-48,"alarm[0]: "+string(alarm[0]))
draw_text(320,200-32,"Message: "+string(Message))
draw_text(320,200-16,"TextoBefore: "+string(TextoBefore))
draw_text(320,200,"Texto: "+string(Texto))
draw_text(320,224,"listNumber: "+string(listNumber))
draw_text(320,240,"Check if Topic is open: "+string(TopicOpen))

for(var list = 1; list <= 10; list++)
{
	draw_text(320,256 + 16*list,""+string(NicksPending[list])+": "+string(TextPending[list]))
}

draw_set_halign(fa_left)
draw_text(0,0,"Topic: "+string(Topic))
draw_text(0,16,"Event: "+string(Event))
draw_text(0,32,"Responde: "+string(Responde))

draw_text(0,64,"Buffer: "+string(Buffer))
draw_text(0,80,"NickDetected: "+string(NickDetected))

draw_text(0,480-16,"Instances: "+string(instance_number(all)))