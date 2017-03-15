include ./../lib_preferences.proc

file_dir_preferences$  = "./../../.preferences/preferences.txt"

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "phone_tier"
phone_tier = number(lib_preference.preferences_get_field_content_from.return$)
@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "word_tier"
word_tier = number(lib_preference.preferences_get_field_content_from.return$)
@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "code_tier"
code_tier = number(lib_preference.preferences_get_field_content_from.return$)

writeInfoLine: "Phone tier:'tab$'" + string$(phone_tier)
appendInfoLine: "Word tier:'tab$'" + string$(word_tier)
appendInfoLine: "Code tier:'tab$'" + string$(code_tier)
