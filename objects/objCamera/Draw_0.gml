var camera = camera_get_active();

var Alejania = 256;

if instance_exists(Target)
{
	if Target.Character = "Flaky"
	{
		XX = lerp(XX, Target.x, 0.05);
		YY = lerp(YY, Target.y, 0.05);
	}
	camera_set_view_mat(camera, matrix_build_lookat(XX-Alejania, YY-Alejania, 128, XX, YY, 16, 0, 0, -1));
}
else
{
	camera_set_view_mat(camera, matrix_build_lookat(XX, YY, 10, room_width/2, room_height/2, 0, 0, 0, -1));	
}
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(60, -window_get_width() / window_get_height(), 1, 32000));
camera_apply(camera);