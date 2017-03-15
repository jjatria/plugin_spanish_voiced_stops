include ./../lib_preferences.proc

file_dir_preferences$  = "./../../.preferences/preferences.txt"

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "phoneme_b_forms"
phoneme_b_forms$ = lib_preference.preferences_get_field_content_from.return$
@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "phoneme_d_forms"
phoneme_d_forms$ = lib_preference.preferences_get_field_content_from.return$
@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "phoneme_g_forms"
phoneme_g_forms$ = lib_preference.preferences_get_field_content_from.return$


beginPause: "Spanish Voiced Stops Project - Preferences"
    comment: "Do not leave any white space"
    sentence: "Phoneme b", phoneme_b_forms$
    sentence: "Phoneme d", phoneme_d_forms$
    sentence: "Phoneme g", phoneme_g_forms$
clicked = endPause: "Continue", "Quit", 1

if clicked = 1
    @lib_preference.preferences_set_field_content_from: file_dir_preferences$, "phoneme_b_forms", phoneme_b$
    @lib_preference.preferences_set_field_content_from: file_dir_preferences$, "phoneme_d_forms", phoneme_d$
    @lib_preference.preferences_set_field_content_from: file_dir_preferences$, "phoneme_g_forms", phoneme_g$
endif
