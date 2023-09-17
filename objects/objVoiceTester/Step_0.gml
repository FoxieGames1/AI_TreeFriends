// Switch text-to-speech voice
if (keyboard_check_pressed(vk_enter))
{
	// Before switching voices, stop any ongoing speech operation
	if (dlc_tts_is_talking())
	{
		dlc_tts_stop_talking();
	}
	
	tts_voice_index++;

	if (tts_voice_index >= tts_voice_count)
	{
		tts_voice_index = 0;
	}
	
	tts_voice_desc = dlc_tts_get_voice_desc(tts_voice_index);
}

if keyboard_check_pressed(vk_space)
{
	dlc_tts_set_opt(tts_voice_index, tts_volume, 0, 0)
	dlc_text_to_speech("Hola mundo.");
}