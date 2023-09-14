with(objConversationGenerator)
{
	if Writing = false
	{
		TopicBefore = Topic
		Start=false
		scrDefaultValues()
		OneTime = 0
		listNumber = 0
		listLimit = 1
	}
}

var Exisisting = objConversationGenerator;

if instance_exists(Exisisting)
{
	if Exisisting.Writing = false
	{
		instance_create_depth(0,0,-100,objCamera)
		instance_destroy()
	}
}

with(objConversationGenerator)
{
	if Writing = true
	{
		var Buffer = buffer_create(1, buffer_grow ,1);
		var data = ds_map_create();
		data[? "eventName"] = "Restart_New";
		data[? "setNew"] = TrueValue;
	
		buffer_write(Buffer, buffer_text, json_encode(data));
		network_send_raw(Socket , Buffer , buffer_tell(Buffer));
		ds_map_destroy(data);
		buffer_delete(Buffer)
	
		other.alarm[1] = 1
	}
}