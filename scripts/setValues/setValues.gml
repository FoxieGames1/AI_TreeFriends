// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function scrDefaultValues()
{
	Socket = network_create_socket(network_socket_udp);
	network_connect_raw_async(Socket, "localhost", PortToReciveMessages)

	CreateNicks = false

	alarm[0] = 5
	alarm[1] = -1

	TopicOpen = false


	/// @description Demo Object Creation
	dlc_initialize(true); // If not called first, every other extension function will always fail

	global.VoiceID = -1
	global.Character = "Flaky"

	if global.VoiceID = -1
	{global.VoiceID = 9}

	Texto = "";
	Topic = ""
	Message = "";

	Voces = false

	Talk = false
	listCurrentNumber = 0
	listNumber = 0
	listLimit = 0
	listMax = 100

	BufferCharge = 1
	BufferList = 0

	for(var list = 0; list <= listMax; list++)
	{
		TextPending[list] = ""
		NicksPending[list] = ""
	}

	Responde = ""
	NickDetected = "";
	Buff = global.BufferNewSize

	for(var chara = 0; chara <= 6; chara++)
	{
		if chara = 0
		{
			global.PlayerXX[chara] = 544
			global.PlayerYY[chara] = 488
		}
		else
		{
			global.PlayerXX[chara] = 0
			global.PlayerYY[chara] = 0
		}
	}

	global.Talker = 0
	global.TalkerBefore = 0

	global.TalkerDirectionX = global.PlayerXX[0]
	global.TalkerDirectionY = global.PlayerYY[0]
	
	End = false
}