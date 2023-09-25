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
	{
		//example of reading data from server
		var buffer_raw = async_load[? "buffer"];
		var buffer_processed = buffer_read(buffer_raw , buffer_text);
		var realData = json_decode(buffer_processed);
		var eventName = realData[?"eventName"];
		var Directory = "Topics";
		
		switch(eventName)
		{
			case "Send_Topic": //DONE
				TopicID++
				TopicNameFile    = realData[? "message_topic"];
				
				if !file_exists("Topics" + "/" + "[PENDING] "+string(TopicNameFile)+".txt")
				{
					createFileWithDatetime("Topics" + "/" + "[PENDING] "+string(TopicNameFile)+".txt")
				}
			break;
			
			case "Send_Message": //DONE
				TopicNameFile    = realData[? "message_topic"];
				NicksPendingList = realData[? "message_nick"];
				TextPendingList  = realData[? "message_text"];
				
				saveInfo("Topics" + "/" + "[PENDING] "+string(TopicNameFile)+".txt", NicksPendingList, TextPendingList, TopicNameFile)
			break;
			
			case "Close_Topic": //DONE
			if ClosedTopicWaitToNext = false
			{
				with(objCamera){TimeCard = false TimeCardSound = false}
				
				SizeOfTopic = realData[? "size_to_finish"];
				NameOfTopic = realData[? "message_topic"];
				global.DisableModelsDuringPause = false
				if (global.StartStream = true) {global.StartStream = false}
				Texto = "Terminando"
				
				for (var i = 1; i <= SizeOfTopic; ++i)
				{
				    loadInfo("Topics" + "/" + "[PENDING] "+string(NameOfTopic)+".txt", i-1)
					listLimit = i
				}
				ClosedTopicWaitToNext = true
			}
			break
			
			case "Send_Language": //DONE
				global.Language = realData[? "language"];
			break;
			
			case "Cancel_Topic": //DONE
				TopicNameFile    = realData[? "message_topic"];
				deleteInfo("Topics" + "/" + "[PENDING] "+string(TopicNameFile)+".txt")
			break;
		}	
	}
}
