//Speak Code
if Voces = 1
{
	if Texto = "Voces..."
	{global.TalkerBefore = global.Talker;}
	
	Voces = 2
}
else
if Voces = 4
{
	if Public = 2{Public = false}
	
	if Texto = "Voces..."
	{global.TalkerBefore = global.Talker;}
	
	Voces = 2
}