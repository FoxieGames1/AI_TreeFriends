var camera = camera_get_active();

if global.DisableModelsDuringPause = false
{
	cluck_set_light_ambient(make_color_rgb(190,190,190))
	
	cluck_set_light_point(0, c_white, room_width/2, room_height/2, 64, 2000, 500)
	
	if Topic = 2 && Event = "Voces..."
	{
		//Draw player shadow
		camera_set_view_mat(camera, matrix_build_lookat(XX, YY, 128, global.TalkerDirectionX, global.TalkerDirectionY, 16, 0, 0, -1));
		camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(60, -window_get_width() / window_get_height(), 1, 32000));
		camera_apply(camera);
	}
	else
	{
		camera_set_view_mat(camera, matrix_build_lookat(XX, YY, 128, global.TalkerDirectionX, global.TalkerDirectionY, 16, 0, 0, -1));
		camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(60, -window_get_width() / window_get_height(), 1, 32000));
		camera_apply(camera);	
	}
	
	cluck_apply(sh_smf_static)
	cluck_apply(sh_smf_animate)
}