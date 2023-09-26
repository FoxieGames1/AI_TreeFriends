with(objConversationGenerator)
{
	other.Event = Texto;
	other.FirstName = NicksPending[0]
}

if TimeCard = false
{TimeCardNumber = irandom_range(1,4)}

if FirstName = "Flaky"
{Player = 1;}
else
if FirstName = "Toothy"
{Player = 2;}
else
if FirstName = "Handy"
{Player = 3;}
else
if FirstName = "Giggles"
{Player = 4;}
else
if FirstName = "Petunia"
{Player = 5;}
else
if FirstName = "Public"
{Player = 10}

if global.Talker > 0 && Player > 0
{
	global.TalkerDirectionX = lerp(global.TalkerDirectionX, global.PlayerXX[global.Talker], 0.1)
	global.TalkerDirectionY = lerp(global.TalkerDirectionY, global.PlayerYY[global.Talker], 0.1)	
}