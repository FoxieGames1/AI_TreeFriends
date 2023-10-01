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
				TopicNameFile   = realData[? "message_topic"];
				TopicIDReal		= realData[? "topic_id_real"];
				
				NameOfTopicSAVE = TopicNameFile
				
				FirstTalker = TopicIDReal;
				
				if !file_exists("Topics" + "/" + string(TopicIDReal) + " [PENDING].txt")
				{
					createFileWithDatetime("Topics" + "/" + string(TopicIDReal) + " [PENDING].txt")
				}
			break;
			
			case "Send_Message": //DONE
				TopicNameFile    = realData[? "message_topic"];
				NicksPendingList = realData[? "message_nick"];
				TextPendingList  = realData[? "message_text"];
				TopicIDReal      = realData[? "topic_id_real"];
				
				saveInfo("Topics" + "/" + string(TopicIDReal) + " [PENDING].txt", NicksPendingList, TextPendingList, TopicNameFile)
			break;
			
			case "Close_Topic": //DONE
			if ClosedTopicWaitToNext = 1.5
			{
				ClosedTopicWaitToNext = 1	
			}
			
			if ClosedTopicWaitToNext = 1
			{
				ClosedTopicWaitToNext = 1.25
			}
			
			if ClosedTopicWaitToNext = -1
			{ClosedTopicWaitToNext = 0}
			
			if ClosedTopicWaitToNext = 2
			{ClosedTopicWaitToNext = 0}
			
			if ClosedTopicWaitToNext = false
			{
				with(objCamera){TimeCard = false TimeCardSound = false}
				
				TopicIDReal = realData[? "topic_id_real"];
				SizeOfTopic = realData[? "size_to_finish"];
				
				TopicIDRealRead = TopicIDReal
				
				var File = "Topics" + "/" + string(TopicIDReal) + " [PENDING].txt"
				ReplaceStringToNew(File, "Topic: Open", "Topic: Closed")
				
				global.DisableModelsDuringPause = false
				if (global.StartStream = true) {global.StartStream = false}
				Texto = "Terminando"
				
				for (var i = 1; i <= SizeOfTopic; ++i)
				{
				    loadInfo("Topics" + "/" + string(TopicIDReal) + " [PENDING].txt", i-1)
					listLimit = i
				}
				
				with(objVars)
				{
					audio_stop_sound(musJeopardy)
					if Music = true {Music = false}
					with(objCamera){WaitingANewRequester = false}
				}
				
				FirstTalk = TopicIDReal
				LastTalker = realData[? "topic_id_real"];
				
				ClosedTopicWaitToNext = 1
			}
			
			if ClosedTopicWaitToNext = 1.25
			{
				TopicIDReal = realData[? "topic_id_real"];
				SizeOfTopic = realData[? "size_to_finish"];
				
				var File = "Topics" + "/" + string(TopicIDReal) + " [PENDING].txt"
				ReplaceStringToNew(File, "Topic: Open", "Topic: Closed")
				
				ClosedTopicWaitToNext = 1.5
			}
			break
			
			case "Send_Language": //DONE
				global.Language = realData[? "language"];
			break;
			
			case "Cancel_Topic": //DONE
				TopicNameFile    = realData[? "message_topic"];
				deleteInfo("Topics" + "/" + string(TopicIDReal) + " [PENDING].txt")
			break;
		}	
	}
}
