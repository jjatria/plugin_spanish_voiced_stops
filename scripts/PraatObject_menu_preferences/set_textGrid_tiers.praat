include ./../lib_preferences.proc

file_dir_preferences$  = "./../../.preferences/preferences.txt"

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "phone_tier"
phone_tier = number(lib_preference.preferences_get_field_content_from.return$)
@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "word_tier"
word_tier = number(lib_preference.preferences_get_field_content_from.return$)
@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "code_tier"
code_tier = number(lib_preference.preferences_get_field_content_from.return$)

beginPause: "Spanish Voiced Stops Project - Preferences"
    comment: "TextGrid info"
    natural: "Phone tier", phone_tier
    natural: "Word tier", word_tier
    natural: "Code tier", code_tier
clicked = endPause: "Continue", "Quit", 1

if clicked = 1
    @lib_preference.preferences_set_field_content_from: file_dir_preferences$, "phone_tier", string$(phone_tier)
    @lib_preference.preferences_set_field_content_from: file_dir_preferences$, "word_tier", string$(word_tier)
    @lib_preference.preferences_set_field_content_from: file_dir_preferences$, "code_tier", string$(code_tier)
endif
