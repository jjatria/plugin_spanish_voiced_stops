Add menu command: "Objects", "Goodies", "-", "", 0, ""
Add menu command: "Objects", "Goodies", "Plug-in Spanish Voiced Stops", "", 0, ""

Add menu command: "Objects", "Goodies", "Preferences", "Plug-in Spanish Voiced Stops", 1, ""
Add menu command: "Objects", "Goodies", "Query", "Preferences", 2, ""
Add menu command: "Objects", "Goodies", "Modify", "Preferences", 2, ""


preferences_menu$ = "./scripts/PraatObject_menu_preferences/"
Add menu command: "Objects", "Goodies", "Get working directory", "Query", 3, preferences_menu$ + "get_working_directory.praat"
Add menu command: "Objects", "Goodies", "Get TextGrid tiers", "Query", 3, preferences_menu$ + "get_textGrid_tiers.praat"
Add menu command: "Objects", "Goodies", "Get target forms", "Query", 3, preferences_menu$ + "get_phoneme_forms.praat"
Add menu command: "Objects", "Goodies", "Get transcriber ID", "Query", 3, preferences_menu$ + "get_transcriber_id.praat"

Add menu command: "Objects", "Goodies", "Set working directory...", "Modify", 3, preferences_menu$ + "set_working_directory.praat"
Add menu command: "Objects", "Goodies", "Set TextGrid tiers...", "Modify", 3, preferences_menu$ + "set_textGrid_tiers.praat"
Add menu command: "Objects", "Goodies", "Set target forms...", "Modify", 3, preferences_menu$ + "set_phoneme_forms.praat"
Add menu command: "Objects", "Goodies", "Set transcriber ID...", "Modify", 3, preferences_menu$ + "set_transcriber_id.praat"

index_menu$ = "./scripts/PraatObject_menu_index/"
indexer_script$ = "./scripts/PraatObject_indexer/"
Add menu command: "Objects", "Goodies", "Index", "Plug-in Spanish Voiced Stops", 1, ""
Add menu command: "Objects", "Goodies", "Scan TextGrids", "Index", 2, indexer_script$ + "main.praat"
Add menu command: "Objects", "Goodies", "-", "Index", 2, ""
Add menu command: "Objects", "Goodies", "Export index to", "Index", 2, index_menu$ + "export_index_to.praat"
Add menu command: "Objects", "Goodies", "Import index from", "Index", 2, index_menu$ + "import_index_from.praat"

indexer_script$ = "./scripts/PraatObject_indexer/"
finder_script$ = "./scripts/PraatObject_finder/"
Add menu command: "Objects", "Goodies", "-", "Plug-in Spanish Voiced Stops", 1, ""
Add menu command: "Objects", "Goodies", "Run plug-in...", "Plug-in Spanish Voiced Stops", 1, finder_script$ + "main.praat"

Add menu command: "Objects", "Goodies", "-", "Plug-in Spanish Voiced Stops", 1, ""
Add menu command: "Objects", "Goodies", "About", "Plug-in Spanish Voiced Stops", 1, "./scripts/about.praat"

