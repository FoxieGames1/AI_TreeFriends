global.DisableModelsDuringPause = false

with(objConversationGenerator)
{
	var FILE = "Topics" + "/" + string(TopicIDDef) + " [PENDING] "+string(NameOfTopic)+".txt";
	
	if file_exists(FILE)
	{
		if ClosedTopicWaitToNext = -2
		{
			deleteInfo(FILE)
			
			if file_exists(LastFile)
			{deleteInfo(LastFile)}
		
			for(var I = 0; I < listMax; I++)
			{
				TextPending[I] = ""
				NicksPending[I] = "" 
			}
		
			scrDefaultValues()
			listLimit = 1
		
			if (CheckDirectory())
			{
				readAndSortFilesByName()
			}
		}
		else
		if ClosedTopicWaitToNext = true
		{
			deleteInfo(FILE)
	
			if file_exists(LastFile)
			{deleteInfo(LastFile)}
		
			for(var I = 0; I < listMax; I++)
			{
				TextPending[I] = ""
				NicksPending[I] = "" 
			}
		
			scrDefaultValues()
			listLimit = 1
			
			if (CheckDirectory() && ClosedTopicWaitToNext = 1)
			{
				ClosedTopicWaitToNext = 2
			}
			else
			if (!CheckDirectory() && ClosedTopicWaitToNext = 1)
			{
				ClosedTopicWaitToNext = -1
			}
		}
	}
}
WaitingANewRequester = false