PortToReciveMessages = 3000

Socket = network_create_socket(network_socket_ws)

network_connect_raw_async(Socket, "localhost", PortToReciveMessages)

Writing = false;
TIMER = 1

Start=true

listCurrentNumber = 0
listNumber = 0
listLimit = 1

Public = false
PublicTalking = true

buffer_first = 0
data_first = 0

clean = 0;

alarm[0] = TIMER

scrDefaultValues()

TopicRealCount = -1

TopicNameFile = "";
TopicID = 0
TopicIDReal = 0
TextPendingList = ""
NicksPendingList = ""

ClosedTopicWaitToNext = false
NameOfTopic = ""

LastFile = ""
SizeOfTopic = 0

for(var I = 0; I < listMax; I++)
{
	TextPending[I] = ""
	NicksPending[I] = "" 
}

delete_all_starter()