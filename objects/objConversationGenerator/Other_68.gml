if (async_load[? "size"] > 0)
{
	var buff = async_load[? "buffer"];
	buffer_seek(buff, buffer_seek_start, 0);
	var Response = buffer_read(buff, buffer_string);
	
	if Topic != ""
	{
		if Texto = ""
		{Texto = "Inicio"}
		scrCharactersDefine()
		scrCharactersFix()
	}
	
	Responde = Response
	
	if Topic = ""
	{Topic = Responde}
	
	Buff = buff
}

