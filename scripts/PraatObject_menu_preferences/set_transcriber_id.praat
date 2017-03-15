include ./../lib_preferences.proc

file_dir_preferences$  = "./../../.preferences/preferences.txt"

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "transcriber_id"
transcriber_id$ = lib_preference.preferences_get_field_content_from.return$

beginPause: "Spanish Voiced Stops Project - Preferences"
    sentence: "Transcriber ID", transcriber_id$
clicked = endPause: "Continue", "Quit", 1

if clicked = 1
    @lib_preference.preferences_set_field_content_from: file_dir_preferences$, "transcriber_id", transcriber_ID$
endif