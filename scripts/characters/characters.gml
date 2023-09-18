function scrCharaTalk()
{
	if global.Language = "English"
	{
		switch(NicksPending[listNumber])
		{
			case "Flaky":	global.Character = "Flaky"  dlc_tts_set_opt(10, 100, 0, 0)  global.Talker = 1 break;
			case "Toothy":	global.Character = "Toothy" dlc_tts_set_opt(8, 100, 0, 10) global.Talker = 2 break;
			case "Public":	global.Character = "Public" global.Talker = 10 break;
		}
	}
	else
	if global.Language = "Español"
	{
		switch(NicksPending[listNumber])
		{
			case "Flaky":	global.Character = "Flaky"  dlc_tts_set_opt(17, 100, 0, 7)  global.Talker = 1 break;
			case "Toothy":	global.Character = "Toothy" dlc_tts_set_opt(15, 100, 0, 10) global.Talker = 2 break;
			case "Public":	global.Character = "Public" global.Talker = 10 break;
		}
	}
}

function scrCharactersFix()
{
	if !(NicksPending[listNumber] = "Flaky"
	|| NicksPending[listNumber] = "Toothy")
	{
		NicksPending[listNumber] = "Public" 
	}	
}

function sprite_index_3d(TAG)
{
	switch(Character)
	{
		case "Flaky":
			if TAG = "Talk"
			{
				with(objModelGen){State = "Listening"}
				State = "Talk"
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
					image_index_3d = 0
					MODEL.texPack[0] = sprFlakyTalk 
					image_speed = 0 
				}
			}
		break;
		case "Toothy":
			if TAG = "Talk"
			{
				with(objModelGen){State = "Listening"}
				State = "Talk"
				if image_index_3d = 0 {MODEL.texPack[0] = sprToothyTalk}
				if image_index_3d > 0 {MODEL.texPack[0] = sprToothyTalk}
				if image_index_3d > 1 {MODEL.texPack[0] = sprToothyTalk1}
				if image_index_3d > 2 {MODEL.texPack[0] = sprToothyTalk2}
				if image_index_3d > 3 {MODEL.texPack[0] = sprToothyTalk1}
		
				if image_index_3d >= 4 
				{
					MODEL.texPack[0] = sprToothyTalk
					image_index_3d = 0
				}
			}
			else
			if TAG = "Idle"
			{
				if image_index_3d = 0 {MODEL.texPack[0] = sprToothyTalk}
				if image_index_3d > 0 {MODEL.texPack[0] = sprToothyTalk}
				if image_index_3d > 1 {MODEL.texPack[0] = sprToothyTalk1}
				if image_index_3d > 2 {MODEL.texPack[0] = sprToothyTalk2}
				if image_index_3d > 3 {MODEL.texPack[0] = sprToothyTalk1}
		
				if image_index_3d >= 4 
				{
					image_index_3d = 0
					MODEL.texPack[0] = sprToothyTalk 
					image_speed = 0 
				}
			}
		break;
	}
}

function scrPosition()
{
	with(objModelGen)
	{
		if Character = "Flaky"
		{	
			global.PlayerXX[1] = x
			global.PlayerYY[1] = y
		}
		else
		if Character = "Toothy"
		{	
			global.PlayerXX[2] = x
			global.PlayerYY[2] = y
		}
		else
		if Character = "Public"
		{	
			global.PlayerXX[10] = global.TalkerDirectionX
			global.PlayerYY[10] = global.TalkerDirectionY
		}
	}	
}

function scrIdleFun()
{
	switch(Character)
	{
		case "Flaky": ANIM = "Flaky_Idle"; break;
		case "Toothy": ANIM = "Toothy_Idle"; break;
	}
}