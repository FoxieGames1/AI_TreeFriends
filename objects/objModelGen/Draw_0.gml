var SCALE = 64;

var MainShader = sh_smf_animate;

var UR = shader_get_uniform(MainShader, "R");
var UG = shader_get_uniform(MainShader, "G");
var UB = shader_get_uniform(MainShader, "B");
var UA = shader_get_uniform(MainShader, "A");

shader_set(MainShader);

shader_set_uniform_f(UR,RED)
shader_set_uniform_f(UG,GREEN)
shader_set_uniform_f(UB,BLUE)
shader_set_uniform_f(UA,ALPHA)

matrix_set(matrix_world, matrix_multiply(matrix_build(x,y,z,0,0,ROT,SCALE,SCALE,SCALE), MODELMAT));
MODELINSTANCE.draw();
matrix_set(matrix_world, matrix_build_identity());

shader_set_uniform_f(UR,1)
shader_set_uniform_f(UG,1)
shader_set_uniform_f(UB,1)
shader_set_uniform_f(UA,1)

shader_reset();

if SPR3D = "Idle"
{
	image_index_3d = 0
	if TolkIsSpeaking()
	{
		SPR3D = "Talk"
	}
	
	if image_speed != 0{image_speed = 0.12}
	image_index_3d += image_speed
	sprite_index_3d(SPR3D)
}
else
if SPR3D = "Talk"
{ 
	image_speed = 0.12
	image_index_3d += image_speed
	sprite_index_3d(SPR3D)
}
else
if SPR3D = "Talk_Stop"
{
	SPR3D = "Idle"
}

if State = "Idle"
{
	var ANIMSPD = 0.005;
	var ANIM = "Flaky_Idle";
	var ANIMLRP = 0.01;
	MODELINSTANCE.play(ANIM, ANIMSPD, ANIMLRP, 0)
}
else
if State = "Walk"
{
	var ANIMSPD = 0.005,;
	var ANIM = "Flaky_Walk";
	var ANIMLRP = 0.01;
	MODELINSTANCE.play(ANIM, ANIMSPD, ANIMLRP, 0)
}