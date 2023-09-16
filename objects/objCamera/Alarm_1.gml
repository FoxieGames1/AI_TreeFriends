with(objConversationGenerator) //TEMPORAL
{
	if Writing = 0
	{
		if TopicOpen = 3{TopicOpen = 0}
		
		buffer_first = buffer_create(1, buffer_grow ,1);
		data_first = ds_map_create()
   
		data_first[? "eventName"] = "Restart_New";
		data_first[? "setNew"] = TrueValue;
		
		buffer_write(buffer_first, buffer_text, json_encode(data_first));
		network_send_raw(Socket, buffer_first, buffer_tell(buffer_first));
		
		ds_map_clear(data_first)
		
		ds_map_destroy(data_first)
		buffer_delete(buffer_first)
		
		other.alarm[1] = 1
		Writing = true
	}
}//TEMPORAL