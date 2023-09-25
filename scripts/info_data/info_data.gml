function createFileWithDatetime(fileName)
{
	var fileHandle = file_text_open_write(fileName);

	if (fileHandle != -1)
	{
	    // Obtener la fecha y hora actual
		var current_second_fix = 0;
		if current_second < 10
		{current_second_fix = "0"+string(current_second)}
		else
		if current_second >= 10
		{current_second_fix = string(current_second)}
		
		var current_minute_fix = 0;
		if current_minute < 10
		{current_minute_fix = "0"+string(current_minute)}
		else
		if current_minute >= 10
		{current_minute_fix = string(current_minute)}
		
	    var timeStamp = "|" + string(current_day) + "/" + string(current_month) + "/" + string(current_year) + " | " + string(current_hour) + ":" + string(current_minute_fix) + ":" + string(current_second_fix) + "|";

	    // Escribir la fecha y hora en el archivo
	    file_text_write_string(fileHandle, "Fecha de Creación: " + string(timeStamp) + "\n");


	    file_text_close(fileHandle);
	}
	else
	{
	    show_message("No se pudo abrir el archivo para escribir los datos.");
	}
}

function saveInfo(fileName, characterName, msg, topicname)
{
	var fileHandle = file_text_open_append(fileName);

	if (fileHandle != -1)
	{
	    // Obtén el número de línea actual (para X)
	    var lineCount = file_text_open_append(fileName) + 1;
    
	    // Formatea la información y guárdala en el archivo
	    var dataToSave = string(characterName) + " " + msg + "\n";
    
	    file_text_write_string(fileHandle, dataToSave);
		
	    file_text_close(fileHandle);
	} 
	else 
	{
	    show_message("No se pudo abrir el archivo para guardar los datos.");
	}
}

function loadInfo(fileName, pos)
{
	var fileHandle = file_text_open_read(fileName);

	if (fileHandle != -1)
	{
		repeat(pos+1)
		{
			file_text_readln(fileHandle);
		}
	    
		var linea = file_text_readln(fileHandle); // Lee una línea del archivo

	    // Divide la línea en nombre y mensaje utilizando el primer espacio como delimitador
	    var espacio = string_pos(" ", linea);
	    if (espacio != 0)
		{
			var nombrePersonaje = string_copy(linea, 1, espacio - 1); // Obtén el nombre del personaje
			var mensaje = string_copy(linea, espacio + 1, string_length(linea)); // Obtén el mensaje completo

			NicksPending[pos] = nombrePersonaje;
			TextPending[pos] = mensaje;
		}
		
	    file_text_close(fileHandle); // Cierra el archivo después de leerlo
	}
	else
	{
	    show_message("No se pudo abrir el archivo para leer los datos.");
	}
}

function deleteInfo(fileName)
{
	if (file_exists(fileName))
	{file_delete(fileName)}
}

function delete_all_starter()
{
	var directory = "Topics" + "/"; // Reemplaza con la ruta de tu directorio

	var fileSearch = file_find_first(directory + "*.*", 0);

	while (fileSearch != "") {
	    // Elimina el archivo
	    var filePath = directory + fileSearch;
	    if (file_delete(filePath)) 
		{
	        show_debug_message("Archivo eliminado: " + filePath);
	    }
		else
		{
	        show_debug_message("Archivos ignorados: " + filePath);
	    }
    
	    // Encuentra el siguiente archivo
	    fileSearch = file_find_next();
	}
	
	show_debug_message("Los archivos que menos importan son los del %appdata%")

	file_find_close(); // Cierra la búsqueda
}

function readAndSortFilesByName()
{
	var directory = "Topics" + "/" ; // Reemplaza con la ruta de tu directorio
	var search = file_find_first(directory + "*.*", 0);
	var file_list = ds_list_create();

	while (search != "") 
	{
	    ds_list_add(file_list, search);
	    search = file_find_next();
	}
	
	// Ordena la lista de archivos alfabéticamente por nombre en orden inverso
	ds_list_sort(file_list, true); // Cambia a false para ordenar en orden ascendente

	// Ahora puedes iterar sobre los archivos en orden inverso
	var num_files = ds_list_size(file_list);
	var file_name = ds_list_find_value(file_list, 0);
	
	var file_handle = file_text_open_read(string(directory) + string(file_name));
	
	var I = 0;
	var LINE = 0;
	
	while (!file_text_eof(file_handle))
	{
        var linea = file_text_readln(file_handle);
		if (I == 0)
		{
			LINE++
			linea = file_text_readln(file_handle);
		}
		I++
		
		LINE = I+1
    }
	
	file_text_close(file_handle);
	
	with(objCamera){TimeCard = false TimeCardSound = false}
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

function CheckDirectory()
{
    var directory = "Topics" + "/"; // Reemplaza con la ruta de tu directorio
    var search = file_find_first(directory + "*.*", 0);

    // Cierra la búsqueda antes de continuar
    file_find_close();

    // Verifica si se encontraron archivos en el directorio
    if (search == "")
    {
        // El directorio está vacío
        return false;
    }
    else
    {
        // Se encontraron archivos en el directorio
        return true;
    }
}