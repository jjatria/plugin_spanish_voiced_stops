include ./../lib_preferences.proc

file_dir_preferences$  = "./../../.preferences/preferences.txt"

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "phoneme_b_forms"
phoneme_b_forms$ = lib_preference.preferences_get_field_content_from.return$
@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "phoneme_d_forms"
phoneme_d_forms$ = lib_preference.preferences_get_field_content_from.return$
@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "phoneme_g_forms"
phoneme_g_forms$ = lib_preference.preferences_get_field_content_from.return$

writeInfoLine: "Phoneme b:'tab$'" + phoneme_b_forms$
appendInfoLine: "Phoneme d:'tab$'" + phoneme_d_forms$
appendInfoLine: "Phoneme g:'tab$'" + phoneme_g_forms$
