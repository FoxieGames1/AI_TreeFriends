function cluck_apply(shader) {
    static warnings = { };
    if (!shader_is_compiled(shader)) {
        if (warnings[$ shader]) {
            show_debug_message("Warning: trying to set a shader which is not compiled - " + shader_get_name(shader));
            warnings[$ shader] = true;
        }
        return;
    }
    var fog_color = global.__cluck_fog_color;
    var ambient_color = global.__cluck_light_ambient;
    
    static light_active_data_primary = array_create(CLUCK_MAX_LIGHTS * 4);
    static light_active_data_secondary = array_create(CLUCK_MAX_LIGHTS * 4);
    static light_active_data_tertiary = array_create(CLUCK_MAX_LIGHTS * 4);
    var light_count = 0;
    for (var i = 0, n = array_length(global.__cluck_light_data); i < n; i += __cluck_light_data_size) {
        if (global.__cluck_light_data[i + 3] != 0) {
            array_copy(light_active_data_primary,    light_count * 4, global.__cluck_light_data, i + 0, 4);
            array_copy(light_active_data_secondary,  light_count * 4, global.__cluck_light_data, i + 4, 4);
            array_copy(light_active_data_tertiary, light_count++ * 4, global.__cluck_light_data, i + 8, 4);
        }
    }
    
    shader_set(shader);
    shader_set_uniform_f(shader_get_uniform(shader, "alphaRef"), min(gpu_get_alphatestenable() * gpu_get_alphatestref() / 255, 0.999));
    
    shader_set_uniform_i(shader_get_uniform(shader, "lightCount"), light_count);
    shader_set_uniform_f_array(shader_get_uniform(shader, "lightDataPrimary"), light_active_data_primary);
    shader_set_uniform_f_array(shader_get_uniform(shader, "lightDataSecondary"), light_active_data_secondary);
    shader_set_uniform_f_array(shader_get_uniform(shader, "lightDataTertiary"), light_active_data_tertiary);
    
    shader_set_uniform_f(shader_get_uniform(shader, "lightAmbientColor"), (ambient_color & 0x0000ff) / 0xff, ((ambient_color & 0x00ff00) >> 8) / 0xff, ((ambient_color & 0xff0000) >> 16) / 0xff);
    
    shader_set_uniform_f(shader_get_uniform(shader, "fogStrength"), global.__cluck_fog_enabled ? global.__cluck_fog_strength : 0);
    shader_set_uniform_f(shader_get_uniform(shader, "fogStart"), global.__cluck_fog_start);
    shader_set_uniform_f(shader_get_uniform(shader, "fogEnd"), global.__cluck_fog_end);
    shader_set_uniform_f(shader_get_uniform(shader, "fogColor"), (fog_color & 0x0000ff) / 0xff, ((fog_color & 0x00ff00) >> 8) / 0xff, ((fog_color & 0xff0000) >> 16) / 0xff);
}