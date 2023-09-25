#region SEND TOPIC
buffer_first = buffer_create(1, buffer_grow ,1);
data_first = ds_map_create()
	
data_first[? "eventName"] = "Send_Topic";
	
buffer_write(buffer_first, buffer_text, json_encode(data_first));
network_send_raw(Socket, buffer_first, buffer_tell(buffer_first));
	
ds_map_clear(data_first)
	
ds_map_destroy(data_first)
buffer_delete(buffer_first)
#endregion 

#region SEND MESSAGE
buffer_first = buffer_create(1, buffer_grow ,1);
data_first = ds_map_create()
	
data_first[? "eventName"] = "Send_Message";

buffer_write(buffer_first, buffer_text , json_encode(data_first));
network_send_raw(Socket, buffer_first, buffer_tell(buffer_first));
	
ds_map_clear(data_first)
	
ds_map_destroy(data_first)
buffer_delete(buffer_first)
#endregion 

#region CLOSE TOPIC
buffer_first = buffer_create(1, buffer_grow ,1);
data_first = ds_map_create()
	
data_first[? "eventName"] = "Close_Topic"

buffer_write(buffer_first, buffer_text , json_encode(data_first));
network_send_raw(Socket, buffer_first, buffer_tell(buffer_first));
	
ds_map_clear(data_first)
	
ds_map_destroy(data_first)
buffer_delete(buffer_first)
#endregion

#region CANCEL TOPIC
buffer_first = buffer_create(1, buffer_grow ,1);
data_first = ds_map_create()
	
data_first[? "eventName"] = "Cancel_Topic";
	
buffer_write(buffer_first, buffer_text , json_encode(data_first));
network_send_raw(Socket, buffer_first, buffer_tell(buffer_first));
	
ds_map_clear(data_first)
	
ds_map_destroy(data_first)
buffer_delete(buffer_first)
#endregion 

#region SET LANGUAGE
buffer_first = buffer_create(1, buffer_grow ,1);
data_first = ds_map_create()
	
data_first[? "eventName"] = "Send_Language";
data_first[? "language"] = global.Language
	
buffer_write(buffer_first, buffer_text, json_encode(data_first));
network_send_raw(Socket, buffer_first, buffer_tell(buffer_first));
	
ds_map_clear(data_first)
	
ds_map_destroy(data_first)
buffer_delete(buffer_first)
#endregion

alarm[0] = TIMER