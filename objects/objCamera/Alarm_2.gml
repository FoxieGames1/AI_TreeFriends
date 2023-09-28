with(objConversationGenerator)
{
	var FILE = "Topics" + "/" + string(TopicIDDef) + " [PENDING] "+string(NameOfTopic)+".txt";
}

if (FindString(FILE, "Topic: Closed"))
{
	deleteInfo(FILE)
	
	TimeCard = false TimeCardSound = false

	with(objConversationGenerator)
	{
		global.DisableModelsDuringPause = false
		Texto = "Terminando"
	
		var FileNameForOpen = file_name
		SizeOfTopic = LINE
	
		for (var i = 1; i <= SizeOfTopic; ++i)
		{
			loadInfo(string(directory) + string(FileNameForOpen), i-1)
			listLimit = i
		}
	
		// Realiza acciones con el archivo
		show_debug_message("Siguiente Archivo: " + FileNameForOpen);
		LastFile = string(directory) + string(FileNameForOpen)
	
		// Limpia la lista de archivos
		ds_list_destroy(file_list);
	
		ClosedTopicWaitToNext = 3
	}
}