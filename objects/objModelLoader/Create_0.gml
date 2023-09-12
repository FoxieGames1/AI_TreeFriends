///@desc Create Cube
gpu_set_zwriteenable(true)
gpu_set_ztestenable(true)

MODEL = smf_model_load(M3D)
MODELINSTANCE = smf_instance_create(MODEL)
MODELMAT = matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1)

rot = image_angle

if ModelTexture != -1
{	
	MODEL.texPack[0] = ModelTexture
}