function scrCharaTalk()
{
	if global.Language = "English"
	{
		switch(NicksPending[listNumber])
		{
			case "Flaky":	global.Character = "Flaky"    dlc_tts_set_opt(10, 100, 0, 0)	global.Talker = 1 break;
			case "Toothy":	global.Character = "Toothy"   dlc_tts_set_opt(8, 100, 0, 10)	global.Talker = 2 break;
			case "Handy":	global.Character = "Handy"    dlc_tts_set_opt(18, 100, 0, 10)	global.Talker = 3 break;
			case "Giggles":	global.Character = "Giggles"  dlc_tts_set_opt(9, 100, 0, 10)	global.Talker = 4 break;
			case "Petunia":	global.Character = "Petunia"  dlc_tts_set_opt(5, 100, 0, 0)	global.Talker = 5 break;
			case "Public":	global.Character = "Public"   global.Talker = 10 break;
		}
	}
	else
	if global.Language = "Español"
	{
		switch(NicksPending[listNumber])
		{
			case "Flaky":	global.Character = "Flaky"  dlc_tts_set_opt(17, 100, 0, 10)		global.Talker = 1 break;
			case "Toothy":	global.Character = "Toothy" dlc_tts_set_opt(15, 100, 0, 10)		global.Talker = 2 break;
			case "Handy":	global.Character = "Handy"  dlc_tts_set_opt(23, 50, 0, 0)		global.Talker = 3 break;
			case "Giggles":	global.Character = "Giggles"  dlc_tts_set_opt(22, 100, 0, 0)	global.Talker = 4 break;
			case "Petunia":	global.Character = "Petunia"  dlc_tts_set_opt(24, 50, 0, 0)	global.Talker = 5 break;
			case "Public":	global.Character = "Public" global.Talker = 10 break;
		}
	}
}

function scrCharactersFix()
{
	if !(NicksPending[listNumber] = "Flaky"
	|| NicksPending[listNumber] = "Toothy"
	|| NicksPending[listNumber] = "Handy"
	|| NicksPending[listNumber] = "Giggles"
	|| NicksPending[listNumber] = "Petunia")
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
		case "Handy":
			if TAG = "Talk"
			{
				with(objModelGen){State = "Listening"}
				State = "Talk"
				if image_index_3d = 0 {MODEL.texPack[0] = sprHandyTalk}
				if image_index_3d > 0 {MODEL.texPack[0] = sprHandyTalk}
				if image_index_3d > 1 {MODEL.texPack[0] = sprHandyTalk1}
				if image_index_3d > 2 {MODEL.texPack[0] = sprHandyTalk2}
				if image_index_3d > 3 {MODEL.texPack[0] = sprHandyTalk1}
		
				if image_index_3d >= 4 
				{
					MODEL.texPack[0] = sprHandyTalk
					image_index_3d = 0
				}
			}
			else
			if TAG = "Idle"
			{
				if image_index_3d = 0 {MODEL.texPack[0] = sprHandyTalk}
				if image_index_3d > 0 {MODEL.texPack[0] = sprHandyTalk}
				if image_index_3d > 1 {MODEL.texPack[0] = sprHandyTalk1}
				if image_index_3d > 2 {MODEL.texPack[0] = sprHandyTalk2}
				if image_index_3d > 3 {MODEL.texPack[0] = sprHandyTalk1}
		
				if image_index_3d >= 4 
				{
					image_index_3d = 0
					MODEL.texPack[0] = sprHandyTalk 
					image_speed = 0 
				}
			}
		break;
		case "Giggles":
			if TAG = "Talk"
			{
				with(objModelGen){State = "Listening"}
				State = "Talk"
				if image_index_3d = 0 {MODEL.texPack[0] = sprGigglesTalk}
				if image_index_3d > 0 {MODEL.texPack[0] = sprGigglesTalk}
				if image_index_3d > 1 {MODEL.texPack[0] = sprGigglesTalk1}
				if image_index_3d > 2 {MODEL.texPack[0] = sprGigglesTalk2}
				if image_index_3d > 3 {MODEL.texPack[0] = sprGigglesTalk1}
		
				if image_index_3d >= 4 
				{
					MODEL.texPack[0] = sprGigglesTalk
					image_index_3d = 0
				}
			}
			else
			if TAG = "Idle"
			{
				if image_index_3d = 0 {MODEL.texPack[0] = sprGigglesTalk}
				if image_index_3d > 0 {MODEL.texPack[0] = sprGigglesTalk}
				if image_index_3d > 1 {MODEL.texPack[0] = sprGigglesTalk1}
				if image_index_3d > 2 {MODEL.texPack[0] = sprGigglesTalk2}
				if image_index_3d > 3 {MODEL.texPack[0] = sprGigglesTalk1}
		
				if image_index_3d >= 4 
				{
					image_index_3d = 0
					MODEL.texPack[0] = sprGigglesTalk 
					image_speed = 0 
				}
			}
		break;
		case "Petunia":
			if TAG = "Talk"
			{
				with(objModelGen){State = "Listening"}
				State = "Talk"
				if image_index_3d = 0 {MODEL.texPack[0] = sprPetuniaTalk}
				if image_index_3d > 0 {MODEL.texPack[0] = sprPetuniaTalk}
				if image_index_3d > 1 {MODEL.texPack[0] = sprPetuniaTalk1}
				if image_index_3d > 2 {MODEL.texPack[0] = sprPetuniaTalk2}
				if image_index_3d > 3 {MODEL.texPack[0] = sprPetuniaTalk1}
		
				if image_index_3d >= 4 
				{
					MODEL.texPack[0] = sprPetuniaTalk
					image_index_3d = 0
				}
			}
			else
			if TAG = "Idle"
			{
				if image_index_3d = 0 {MODEL.texPack[0] = sprPetuniaTalk}
				if image_index_3d > 0 {MODEL.texPack[0] = sprPetuniaTalk}
				if image_index_3d > 1 {MODEL.texPack[0] = sprPetuniaTalk1}
				if image_index_3d > 2 {MODEL.texPack[0] = sprPetuniaTalk2}
				if image_index_3d > 3 {MODEL.texPack[0] = sprPetuniaTalk1}
		
				if image_index_3d >= 4 
				{
					image_index_3d = 0
					MODEL.texPack[0] = sprPetuniaTalk 
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
		if Character = "Handy"
		{	
			global.PlayerXX[3] = x
			global.PlayerYY[3] = y
		}
		else
		if Character = "Giggles"
		{	
			global.PlayerXX[4] = x
			global.PlayerYY[4] = y
		}
		else
		if Character = "Petunia"
		{	
			global.PlayerXX[5] = x
			global.PlayerYY[5] = y
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
		case "Handy": ANIM = "Handy_Idle"; break;
		case "Giggles": ANIM = "Giggles_Idle"; break;
		case "Petunia": ANIM = "Petunia_Idle"; break;
	}
}