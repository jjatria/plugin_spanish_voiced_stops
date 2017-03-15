#Nombre del script: Interval renamer
#Creador: Rolando Muñoz
#Correo: rolando.muar@gmail.com
#Creación: noviembre-2016
#Última modificación: 10-diciembre-2016
#Descripción: Indexa la info de un TextGrid
include lib_indexer.proc

form Indexer
    comment Directories info:
    sentence TextGrid_fullpath A:\Spanish oral stops\data\data_test\AAB_S01_T05_R01.TextGrid
    sentence Table_key A:\Spanish oral stops\scripts\.info\target_stops.txt
    sentence List_of_phrases ./../../.preferences/target_phrases.txt
    comment TextGrid info:
    natural Phones_tier 1
    natural Word_tier 4
    natural Code_tier 6
    comment Target info:
    word b b|B
    word d d|D
    word g g|G
endform

#Abrir un archivo .txt donde se contienen las oraciones target y crear un WordListID para filtrar las frases target
stringsID = Read Strings from raw text file: list_of_phrases$
@lib_indexer.string2wordList
wordListID = lib_indexer.string2wordList.wordListID
removeObject: stringsID

tableID_key = Read Table from tab-separated file: table_key$
tgID = Read from file: textGrid_fullpath$

selectObject: tgID
@lib_indexer.get_code_info: code_tier
tableID_code = lib_indexer.get_code_info.tableID_code
@lib_indexer.filter_table_by_wordList: wordListID, tableID_code, "code"

selectObject: tgID
@lib_indexer.get_word_info: word_tier, tableID_code, tableID_key
tableID_word = lib_indexer.get_word_info.tableID_return

selectObject: tgID
@lib_indexer.get_phones_info: phones_tier, tableID_word, tableID_key
removeObject: wordListID, tableID_key, tableID_code, tableID_word, tgID
selectObject: lib_indexer.get_phones_info.tableID_return
