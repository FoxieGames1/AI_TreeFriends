///@desc Create Cube
z = 0
ROT = 0

gpu_set_zwriteenable(true)
gpu_set_ztestenable(true)

MODEL = smf_model_load(M3D)
MODELINSTANCE = smf_instance_create(MODEL)
MODELMAT = matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1)

RED = 1;
GREEN = 1;
BLUE = 1;
ALPHA = 1;

State = "Idle"
image_index_3d = 0

image_index = 0