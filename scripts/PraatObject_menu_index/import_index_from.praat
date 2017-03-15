folder_dir_preferences$ = "./../../.preferences/" 
file_dir_index$ = folder_dir_preferences$ + "TextGrid_index.txt"
file_dir_index_backup$ = folder_dir_preferences$ + "TextGrid_index_backup.txt"

deleteFile(file_dir_index$)
deleteFile(file_dir_index_backup$)

file_dir_index_src$ = chooseReadFile$: "Import Index from"
if file_dir_index_src$ <> ""
    tableID = Read Table from tab-separated file: file_dir_index_src$
    Save as tab-separated file: file_dir_index$
    removeObject: tableID
endif
