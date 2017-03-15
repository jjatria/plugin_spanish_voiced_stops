include ./../lib_preferences.proc

file_dir_preferences$  = "./../../.preferences/preferences.txt"

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "textGrid_folder_dir"
tg_folder$ = lib_preference.preferences_get_field_content_from.return$
@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "sound_folder_dir"
sd_folder$ = lib_preference.preferences_get_field_content_from.return$

beginPause: "Spanish Voiced Stops Project - Preferences"
    sentence: "TextGrid folder directory", tg_folder$
    sentence: "Sound folder directory", sd_folder$
clicked = endPause: "Continue", "Quit", 1

if clicked = 1
    @lib_preference.preferences_set_field_content_from: file_dir_preferences$, "textGrid_folder_dir", textGrid_folder_directory$
    @lib_preference.preferences_set_field_content_from: file_dir_preferences$, "sound_folder_dir", sound_folder_directory$
endif
