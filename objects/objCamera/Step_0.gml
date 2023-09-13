with(objConversationGenerator)
{
	other.Topic = TopicOpen
	other.Event = Texto;
	
	other.FirstName = NicksPending[1]
}

if FirstName = "Flaky"
{Player = 1;}
else
if FirstName = "Toothy"
{Player = 2;}

if global.Talker > 0 && Player > 0
{
	global.TalkerDirectionX = lerp(global.TalkerDirectionX, global.PlayerXX[global.Talker], 0.1)
	global.TalkerDirectionY = lerp(global.TalkerDirectionY, global.PlayerYY[global.Talker], 0.1)	
}