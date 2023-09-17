function draw_text_fixed(XX, YY, STRING) {
    // Tu línea de código completa
    var codigoCompleto = STRING;

    // Número máximo de caracteres por línea
    var caracteresPorLinea = 45;
	var SizeLetter = 0;
	var PosYY = 0;
	
	if (string_length(codigoCompleto) < 200)
	{
		SizeLetter = 1;
		caracteresPorLinea = 45
		PosYY = 0
	}
	else
	if (string_length(codigoCompleto) < 400)
	{
		caracteresPorLinea = 45
		SizeLetter = 0.8;
		PosYY = -32
	}
	else
	if (string_length(codigoCompleto) < 600)
	{
		caracteresPorLinea = 45*1.2
		SizeLetter = 0.6;
		PosYY = -144+25
	}
	else
	if (string_length(codigoCompleto) < 800)
	{
		caracteresPorLinea = 45*1.4
		SizeLetter = 0.4
		PosYY = -256+75
	}
	else
	if (string_length(codigoCompleto) <= 1000)
	{
		caracteresPorLinea = 45*1.6
		SizeLetter = 0.35
		PosYY = -256-65
	}
	else
	if (string_length(codigoCompleto) > 1000)
	{
		SizeLetter = 1;
		caracteresPorLinea = 45
		PosYY = 0
	}

    var lineas = [];
    var lineaActual = "";
    var palabras = string_split(codigoCompleto, " ");

    for (var i = 0; i < array_length_1d(palabras); i++) {
        var palabra = palabras[i];

        // Verifica si la palabra es más larga que el límite de caracteres por línea
        if (string_length(palabra) > caracteresPorLinea) {
            // Divide la palabra en fragmentos de 40 caracteres o menos y agrega cada fragmento como una línea
            while (string_length(palabra) > caracteresPorLinea) {
                var fragmento = string_copy(palabra, 1, caracteresPorLinea);
                array_push(lineas, fragmento);
                palabra = string_delete(palabra, 1, caracteresPorLinea);
            }
        }

        if (string_length(lineaActual + palabra) <= caracteresPorLinea) {
            lineaActual += palabra + " ";
        } else {
            array_push(lineas, lineaActual);
            lineaActual = palabra + " ";
        }
    }

    if (string_length(lineaActual) > 0) {
        array_push(lineas, lineaActual);
    }

	if (string_length(codigoCompleto) <= 1000)
	{
	    for (var j = 0; j < array_length_1d(lineas); j++) {
	        draw_text_transformed(XX, YY + PosYY, lineas[j], SizeLetter, SizeLetter, 0);
	        YY += 30;
	    }
	}
	else
	if (string_length(codigoCompleto) > 1000)
	{
	    draw_text(XX,YY,"*SPAMMING TEXT...*")
	}
}
