/// @description Demo Object Creation
dlc_initialize(true); // If not called first, every other extension function will always fail

// Text-to-speech related variables
tts_volume = 100;
tts_voice_index = 0;
tts_voice_pitch = 0
tts_voice_count = dlc_tts_get_voice_count();
tts_voice_desc = dlc_tts_get_voice_desc(tts_voice_index);

