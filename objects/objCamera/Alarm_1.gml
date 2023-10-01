global.DisableModelsDuringPause = false

with(objConversationGenerator)
{
	var TopicIDRealFind = "";
	var FILE = "";
	
	if (TopicIDReal = FirstTalker)
	{
		TopicIDRealFind = FindFirst();
		FILE = "Topics" + "/" + string(TopicIDRealFind);
		show_message("MESSAGE BORRADO: "+string(TopicIDRealFind))
	}
	else
	{
		TopicIDRealFind = FirstTalk
		FILE = "Topics" + "/" + string(FirstTalk) +" [PENDING]"+".txt";
		show_message("MESSAGE BORRADO: "+string(TopicIDRealFind))
		TopicIDReal = FirstTalker
	}
	
	if ClosedTopicWaitToNext < 2
	{
		deleteInfo(FILE)
		
		for(var I = 0; I < listMax; I++)
		{
			TextPending[I] = ""
			NicksPending[I] = "" 
		}
		
		scrDefaultValues()
		listLimit = 1
		
		if ClosedTopicWaitToNext < 2
		{
			if (FindLastTxtFileInDirectory())
			{
				ClosedTopicWaitToNext = 2
			}
			else
			if (!FindLastTxtFileInDirectory())
			{
				ClosedTopicWaitToNext = -1
			}
		}
	}
}

WaitingANewRequester = false