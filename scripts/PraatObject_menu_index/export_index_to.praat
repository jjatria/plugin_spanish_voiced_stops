include ./../lib_preferences.proc

folder_dir_preferences$ = "./../../.preferences/" 
file_dir_preferences$ = folder_dir_preferences$ + "preferences.txt" 
file_dir_index$ = folder_dir_preferences$ + "TextGrid_index.txt"

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "transcriber_id"
transcriber_id$ = lib_preference.preferences_get_field_content_from.return$


if fileReadable(file_dir_index$)
    tableID = Read from file: file_dir_index$
else
    exitScript: "No report has been found"
endif

filename$ = chooseWriteFile$: "Export Index as" , "'transcriber_id$'_TextGrid_index.txt"
if filename$ <> ""
    Save as tab-separated file: filename$
endif
removeObject: tableID
