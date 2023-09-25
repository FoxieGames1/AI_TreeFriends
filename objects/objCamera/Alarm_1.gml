global.DisableModelsDuringPause = false

with(objConversationGenerator)
{
	if ClosedTopicWaitToNext = true
	{
		deleteInfo("Topics" + "/" + "[PENDING] "+string(NameOfTopic)+".txt")
		
		for(var I = 0; I < listMax; I++)
		{
			TextPending[I] = ""
			NicksPending[I] = "" 
		}
		
		scrDefaultValues()
		listLimit = 1
		ClosedTopicWaitToNext = 2
	}
}

WaitingANewRequester = false