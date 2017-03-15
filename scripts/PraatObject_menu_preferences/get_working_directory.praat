include ./../lib_preferences.proc

file_dir_preferences$  = "./../../.preferences/preferences.txt"

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "textGrid_folder_dir"
tg_folder$ = lib_preference.preferences_get_field_content_from.return$
@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "sound_folder_dir"
sd_folder$ = lib_preference.preferences_get_field_content_from.return$

writeInfoLine: "TextGrid folder directory:'tab$'" + tg_folder$
appendInfoLine: "Sound folder directory:'tab$'" + sd_folder$
