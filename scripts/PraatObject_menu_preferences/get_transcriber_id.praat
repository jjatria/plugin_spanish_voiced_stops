include ./../lib_preferences.proc

file_dir_preferences$  = "./../../.preferences/preferences.txt"

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "transcriber_id"
transcriber_id$ = lib_preference.preferences_get_field_content_from.return$

writeInfoLine: "Transcriber ID:'tab$'" + transcriber_id$
