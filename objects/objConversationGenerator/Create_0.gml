PortToReciveMessages = 3000

Socket = network_create_socket(network_socket_udp);
network_connect_raw_async(Socket, "localhost", PortToReciveMessages)

Buffer = buffer_create(100, buffer_fixed, 100);

CreateNicks = false

alarm[0] = 5

TopicOpen = false

TolkDebugSet(1);//Turn this off in release builds. Prints results of the API to better understand how each function works.
TolkTrySAPI(1);//Whether or not to include Micorsoft Speech API (SAPI) as an API to use.
TolkPreferSAPI(1);//Whether or not to prioritize SAPI over other screen readers.
TolkFallbackSet(1);//Whether or not to enable the fallback option if no other screen reader is installed.
TolkPowerOn();//Must be turned on before any output can be used.

Texto = "";
Topic = ""
Message = "";

Voces = false

Talk = false
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