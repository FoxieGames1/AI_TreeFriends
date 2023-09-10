function scrCharactersDefine()
{
	switch(Responde)
	{
		case "Flaky": NickDetected = "Flaky" break;
		case "Toothy": NickDetected = "Toothy" break;
		case "Cuddles": NickDetected = "Cuddles" break;
		case "Giggles": NickDetected = "Giggles" break;
		case "Petunia": NickDetected = "Petunia" break;
		case "Nutty": NickDetected = "Nutty" break;
	}
}

function scrCharactersFix()
{
	if !(Responde = "Flaky"
	|| Responde = "Toothy"
	|| Responde = "Cuddles"
	|| Responde = "Giggles"
	|| Responde = "Petunia"
	|| Responde = "Nutty")
	{NickDetected = "Nobody"}	
}