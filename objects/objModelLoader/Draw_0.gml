var SCALE = 8;

if Mode = 1
{
	var MainShader = sh_smf_static_no_shade;
}
else
if Mode = 2
{
	var MainShader = sh_smf_static;
}
var UR = shader_get_uniform(MainShader, "R");
var UG = shader_get_uniform(MainShader, "G");
var UB = shader_get_uniform(MainShader, "B");
var UA = shader_get_uniform(MainShader, "A");

shader_set(MainShader);

shader_set_uniform_f(UR,RED)
shader_set_uniform_f(UG,GREEN)
shader_set_uniform_f(UB,BLUE)
shader_set_uniform_f(UA,ALPHA)

matrix_set(matrix_world, matrix_multiply(matrix_build(x,y,z,0,0,rot,SCALE*scl,SCALE*scl,SCALE*scl), MODELMAT));
MODELINSTANCE.draw();
matrix_set(matrix_world, matrix_build_identity());

shader_set_uniform_f(UR,1)
shader_set_uniform_f(UG,1)
shader_set_uniform_f(UB,1)
shader_set_uniform_f(UA,1)

shader_reset();

