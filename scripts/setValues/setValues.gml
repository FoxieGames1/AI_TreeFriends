// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function scrDefaultValues()
{
	alarm[1] = -1
	
	/// @description Demo Object Creation
	dlc_initialize(true); // If not called first, every other extension function will always fail

	global.VoiceID = -1
	global.Character = "▯"

	if global.VoiceID = -1
	{global.VoiceID = 9}

	Texto = "";

	Voces = false

	Talk = false
	listMax = 512;

	BufferCharge = 1
	BufferList = 0

	for(var chara = 0; chara <= 10; chara++)
	{
		global.PlayerXX[chara] = 0
		global.PlayerYY[chara] = 0
	}

	global.Talker = 0
	global.TalkerBefore = 0

	global.TalkerDirectionX = global.PlayerXX[0]
	global.TalkerDirectionY = global.PlayerYY[0]
	
	End = false
}