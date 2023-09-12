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

function sprite_index_3d(TAG)
{
	switch(Character)
	{
		case "Flaky":
			if TAG = "Talk"
			{
				if image_index_3d = 0 {MODEL.texPack[0] = sprFlakyTalk}
				if image_index_3d > 0 {MODEL.texPack[0] = sprFlakyTalk}
				if image_index_3d > 1 {MODEL.texPack[0] = sprFlakyTalk1}
				if image_index_3d > 2 {MODEL.texPack[0] = sprFlakyTalk2}
				if image_index_3d > 3 {MODEL.texPack[0] = sprFlakyTalk1}
		
				if image_index_3d >= 4 
				{
					MODEL.texPack[0] = sprFlakyTalk
					image_index_3d = 0
				}
			}
			else
			if TAG = "Idle"
			{
				if image_index_3d = 0 {MODEL.texPack[0] = sprFlakyTalk}
				if image_index_3d > 0 {MODEL.texPack[0] = sprFlakyTalk}
				if image_index_3d > 1 {MODEL.texPack[0] = sprFlakyTalk1}
				if image_index_3d > 2 {MODEL.texPack[0] = sprFlakyTalk2}
				if image_index_3d > 3 {MODEL.texPack[0] = sprFlakyTalk1}
		
				if image_index_3d >= 4 
				{
					MODEL.texPack[0] = sprFlakyTalk 
					image_speed = 0 
				}
			}
		break;
	}
}