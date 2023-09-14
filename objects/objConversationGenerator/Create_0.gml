PortToReciveMessages = 3000

Socket = network_create_socket(network_socket_ws)

network_connect_raw_async(Socket, "localhost", PortToReciveMessages)

Writing = false;
TIMER = 1

TrueValue = 0

TopicBefore = ""

Start=true
OneTime = 0

listCurrentNumber = 0
listNumber = 0
listLimit = 1


alarm[0] = TIMER

scrDefaultValues()