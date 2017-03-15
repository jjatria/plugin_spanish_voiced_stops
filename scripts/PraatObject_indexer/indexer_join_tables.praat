#Nombre del script: Interval renamer
#Creador: Rolando Muñoz
#Correo: rolando.muar@gmail.com
#Creación: noviembre-2016
#Última modificación: 10-diciembre-2016
#Descripción: Junta el contenido de dos tablas

form Join_tables
    comment Input:
    sentence Table_a_dir A:\Spanish oral stops\scripts\query_indexer\TextGrid_index.txt
    sentence Table_b_dir A:\Spanish oral stops\scripts\.info\target_stops.txt
    comment Output:
    word match_column key_value
endform

tableID_a = Read Table from tab-separated file: table_a_dir$
tableID_b = Read Table from tab-separated file: table_b_dir$

#Agregar las columnas de tableID_b a tableID_a
selectObject: tableID_b
nColumns =Get number of columns
for iColumn to nColumns
    selectObject: tableID_b
    column_name$= Get column label: iColumn
    if column_name$ != match_column$
        selectObject: tableID_a
        Append column: column_name$
    endif
endfor

#Agregar la información de TableID_b a tableID_a
for table_a_row to Object_'tableID_a'.nrow
    key_value = Object_'tableID_a'[table_a_row, "key_value"]
    selectObject: tableID_b
    table_b_row= Search column: "key_value",string$(key_value)
    nColumns =Get number of columns
    for iColumn to nColumns
        selectObject: tableID_b
        column_name$= Get column label: iColumn
        value$ = Get value: table_b_row, column_name$
        selectObject: tableID_a
        if column_name$ != match_column$
            Set string value: table_a_row, column_name$, value$
        endif
    endfor
endfor

removeObject: tableID_b
selectObject: tableID_a

