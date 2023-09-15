with(objConversationGenerator)
{
	if Writing = 0
	{
		if TopicOpen = 3{TopicOpen = 0}
		
		var Buffer = buffer_create(1, buffer_grow ,1);
		var data = ds_map_create();
		data[? "eventName"] = "Restart_New";
		data[? "setNew"] = TrueValue;
		
		buffer_write(Buffer, buffer_text, json_encode(data));
		network_send_raw(Socket , Buffer , buffer_tell(Buffer));
		ds_map_destroy(data);
		buffer_delete(Buffer)
	
		other.alarm[1] = 1
		Writing = true
	}
}