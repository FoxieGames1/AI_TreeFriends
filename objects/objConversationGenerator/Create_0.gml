PortToReciveMessages = 3000

Socket = network_create_socket(network_socket_udp);
network_connect_raw_async(Socket, "localhost", PortToReciveMessages)

Buffer = buffer_create(100, buffer_fixed, 100);

CreateNicks = false

alarm[0] = 5

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
Buff = 0

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

global.TalkerDirectionX = global.PlayerXX[0]
global.TalkerDirectionY = global.PlayerYY[0]