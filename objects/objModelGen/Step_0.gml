if M3D != ""
{
	MODELINSTANCE.step(1)
}

switch(M3D)
{
	case "Models/Flaky.m3d":   IdCharacter = 1 break;
	case "Models/Toothy.m3d":  IdCharacter = 2 break;
	case "Models/Handy.m3d":   IdCharacter = 3 LightLength = 6 ZLight = 40 break;
	case "Models/Giggles.m3d": IdCharacter = 4 break;
	case "Models/Petunia.m3d": IdCharacter = 5 break;
	case "Models/Nutty.m3d":   IdCharacter = 6 break;
	case "Models/Cuddles.m3d": IdCharacter = 7 break
}