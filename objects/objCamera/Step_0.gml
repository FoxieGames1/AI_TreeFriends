if keyboard_check_pressed(vk_escape)
{
	game_end()	
}

Target = global.Character

with(objModelGen)
{
	if Character = other.Target
	{
		other.XX = lerp(other.XX, x, 0.1)
		other.YY = lerp(other.YY, y, 0.1)	
	}
}