var camera = camera_get_active();

var Alejania = 256;

camera_set_view_mat(camera, matrix_build_lookat(XX, YY, 128, global.TalkerDirectionX, global.TalkerDirectionY, 16, 0, 0, -1));
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(60, -window_get_width() / window_get_height(), 1, 32000));
camera_apply(camera);