PortToReciveMessages = 3000

Socket = network_create_socket(network_socket_ws)

network_connect_raw_async(Socket, "localhost", PortToReciveMessages)

SetQueue = -1 //TEMPORAL
Writing = false;
TIMER = 1

TrueValue = 0 //TEMPORAL
SetSleep = false //TEMPORAL

TopicBefore = ""

Start=true
OneTime = 0 //TEMPORAL

listCurrentNumber = 0
listNumber = 0
listLimit = 1
ReOpen = false; //TEMPORAL

Public = false
PublicTalking = true

buffer_first = 0
data_first = 0

clean = 0;

alarm[0] = TIMER

//Catch memory
alarm[11] = 60*10

scrDefaultValues()