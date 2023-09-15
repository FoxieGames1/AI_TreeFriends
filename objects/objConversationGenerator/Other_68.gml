switch(async_load[? "type"])
{
	case network_type_non_blocking_connect:
		var Buffer = buffer_create(1, buffer_grow ,1);
		var data = ds_map_create();
		data[? "eventName"] = "Connected_Server"
	
		buffer_write(Buffer , buffer_text  , json_encode(data));
		network_send_raw(Socket, Buffer , buffer_tell(Buffer));
		ds_map_destroy(data);
	break;
	case network_type_data:
		//example of reading data from server
		var buffer_raw = async_load[? "buffer"];
		var buffer_processed = buffer_read(buffer_raw , buffer_text);
		var realData = json_decode(buffer_processed);
		var eventName = realData[?"eventName"];
		
		switch(eventName)
		{
			case "Send_Topic":
			if Topic = ""
			{
				Topic = realData[? "message_topic"];
				if Topic != ""{Texto = "Inicio"}
			}
			break;
			case "Send_Message":
			if Topic != ""
			{	
				listLimit = realData[? "eventPlus"];

				if (TextPending[listNumber+1] = "" 
				&& NicksPending[listNumber+1] = "")
				{
					if listNumber < listLimit-1
					{
						TextPending[listNumber] = realData[? "message_text"];
						NicksPending[listNumber] = realData[? "message_nick"];
						
						listNumber++
						alarm[0] = TIMER
					}
				}
			}
			break;
			case "Close_Topic":
			with(objCamera){alarm[0] = -1}
			OneTime = realData[? "changeNumber"];
			if OneTime > 0
			{
				if ReOpen = true //TEMPORAL
				{
					TrueValue = 1
					with(objVars){if Music = true{audio_stop_all() Music = false}}
					with(objCamera)
					{WaitingANewRequester = false TimeCard = false if TimeCardSound = 2 {TimeCardSound = false}}
					ReOpen = false	
				}//TEMPORAL
				
				if Topic != ""
				{	
					if Texto = "Andando..."
					{Texto = "Terminando"}
					listNumber = 0
				}
			}
			break;
			
			//TEMPORAL
			case "Restart_New":
				TrueValue = realData[? "setNew"];
				SetSleep = true
			break;
			//TEMPORAL
		}
	break;
}