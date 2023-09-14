if Topic = ""
{
	var Buffer = buffer_create(1, buffer_grow ,1);
	var data = ds_map_create();
	data[? "eventName"] = "Send_Topic";
	
	buffer_write(Buffer , buffer_text  , json_encode(data));
	network_send_raw(Socket , Buffer , buffer_tell(Buffer));
	ds_map_destroy(data);
	buffer_delete(Buffer)
}
else
if Topic != "" && TopicOpen = 1 &&
(TextPending[listNumber+1] = "" && NicksPending[listNumber+1] = "")
{
	var Buffer = buffer_create(1, buffer_grow, 1);
	var data = ds_map_create();
	data[? "eventName"] = "Send_Message";
	data[? "eventPlus"] = listLimit;

	buffer_write(Buffer, buffer_text , json_encode(data));
	network_send_raw(Socket, Buffer, buffer_tell(Buffer));
	ds_map_destroy(data);
	buffer_delete(Buffer)
}

if Texto = "Andando..." && TopicOpen = 1
{
	var Buffer = buffer_create(1, buffer_grow, 1);
	var data = ds_map_create();
	data[? "eventName"] = "Close_Topic";
	data[? "changeNumber"] = OneTime;

	buffer_write(Buffer, buffer_text , json_encode(data));
	network_send_raw(Socket, Buffer, buffer_tell(Buffer));
	ds_map_destroy(data);
	buffer_delete(Buffer)
}

alarm[0] = TIMER