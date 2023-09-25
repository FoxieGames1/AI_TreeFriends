global.DisableModelsDuringPause = false

with(objConversationGenerator)
{
	if ClosedTopicWaitToNext = -2
	{
		deleteInfo("Topics" + "/" + string(TopicIDReal) + " [PENDING] "+string(NameOfTopic)+".txt")
	
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
		deleteInfo("Topics" + "/" + string(TopicIDReal) + " [PENDING] "+string(NameOfTopic)+".txt")
		
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

WaitingANewRequester = false