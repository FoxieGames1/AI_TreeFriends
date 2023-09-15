if Topic = ""
{	
	buffer_first = buffer_create(1, buffer_grow ,1);
	data_first = ds_map_create()
	
	data_first[? "eventName"] = "Send_Topic";
	
	buffer_write(buffer_first, buffer_text, json_encode(data_first));
	network_send_raw(Socket, buffer_first, buffer_tell(buffer_first));
	ds_map_destroy(data_first)
	buffer_delete(buffer_first)
}
else
if Topic != "" && TopicOpen = 1 &&
(TextPending[listNumber+1] = "" && NicksPending[listNumber+1] = "")
{
	buffer_first = buffer_create(1, buffer_grow ,1);
	data_first = ds_map_create()
	
	data_first[? "eventName"] = "Send_Message";
	data_first[? "eventPlus"] = listLimit;

	buffer_write(buffer_first, buffer_text , json_encode(data_first));
	network_send_raw(Socket, buffer_first, buffer_tell(buffer_first));
	ds_map_destroy(data_first)
	buffer_delete(buffer_first)
}

if Texto = "Andando..." && TopicOpen = 1 || TopicOpen = -1
{
	buffer_first = buffer_create(1, buffer_grow ,1);
	data_first = ds_map_create()
	
	data_first[? "eventName"] = "Close_Topic";
	data_first[? "changeNumber"] = OneTime;

	buffer_write(buffer_first, buffer_text , json_encode(data_first));
	network_send_raw(Socket, buffer_first, buffer_tell(buffer_first));
	
	ds_map_destroy(data_first)
	buffer_delete(buffer_first)
}

alarm[0] = TIMER