#Nombre del script: Interval renamer
#Creador: Rolando Muñoz
#Correo: rolando.muar@gmail.com
#Creación: noviembre-2016
#Última modificación: 22-dic-2016
#Descripción: Remplaza el contenido de los intervalos de un tier en específico tomando en cuenta la información proporcionada por una tabla
#Comentarios basado en Interval renamer

include lib_finder.proc
include ./../lib_preferences.proc

form Interval finder
    comment TextGrid info
    natural Segment_tier 1
    comment Segmental view
    real margin(s) 0.3
    comment Spectrogram settings
    real Dynamic_range 45
    real Max_range(Hz) 5500
endform

###################################################################################
#Lecturar variables

###Establecer direcciones de los archivos de la carpeta .preferences
folder_dir_preferences$ = "./../../.preferences/"
file_dir_preferences$ = folder_dir_preferences$ + "preferences.txt"
file_dir_index$ = folder_dir_preferences$ + "TextGrid_index.txt"


##Desde archivos temporales
@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "textGrid_folder_dir"
tg_folder$ = lib_preference.preferences_get_field_content_from.return$

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "sound_folder_dir"
sd_folder$ = lib_preference.preferences_get_field_content_from.return$

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "case"
case = number(lib_preference.preferences_get_field_content_from.return$)

@lib_preference.preferences_get_field_content_from: file_dir_preferences$, "transcriber_id"
transcriptorID$ = lib_preference.preferences_get_field_content_from.return$

@lib_preference.index_open: file_dir_index$
tableID_index= selected("Table")

##Pedir atrubitos de la tabla
n_cases = Object_'tableID_index'.nrow
file_name_column$ = "file"
time_column$ = "tmid"

break = 0
###################################################################################
#Navegar por la tabla usando un loop

while not break
    @lib_finder.check_number: case, 1, n_cases
    case = lib_finder.check_number.return
    @lib_finder.get_next_number: case , 1, n_cases 
    next_case = lib_finder.get_next_number.return

    #Los datos datos de la tabla TextGrid_index.txt proveen información sobre los TextGrids y el lugar(tiempo) en donde los segmentos se encuentran transcritos.
    
    ##Get data from TextGrid_index.txt
    row = case
    checked = Object_'tableID_index'[row, "checked"]
    time = Object_'tableID_index'[row, time_column$]
    tg_basename$ = Object_'tableID_index'$[row, file_name_column$]
    sd_basename$ = (tg_basename$ - ".TextGrid") + ".wav"
    tg_fullname$ = tg_folder$ + "/" + tg_basename$
    sd_fullname$ = sd_folder$ + "/" + sd_basename$
     
    ##Open the Sound y TextGrid objects 
    if fileReadable(tg_fullname$) and fileReadable(sd_fullname$)
        tgID = Read from file: tg_fullname$
        sdID = Read from file: sd_fullname$
    else
        if not fileReadable(tg_fullname$)
            file_name$ = tg_basename$
            dir$ = tg_folder$ - "/"
        elsif not fileReadable(sd_fullname$)
            file_name$ = sd_basename$
            dir$ = sd_folder$ - "/"
        endif
        exitScript: "The file 'file_name$' could not be found in 'dir$' folder." 
    endif
    
    ##Get intensity parameters. We will use this information when setting the TextGridEditor window.
    selectObject: tgID
    plusObject: sdID

    @lib_finder.get_maximum_intensity_from_segment: segment_tier, time, margin
    intensity_maximum = lib_finder.get_maximum_intensity_from_segment.return
    intensity_maximum += 10

    #This is the core of the script. 
    label CHECKED
    if checked = 0
        selectObject: tgID
        @lib_finder.erase_interval: segment_tier, time
    endif

    selectObject: tgID
    plusObject: sdID
    @lib_finder.TextGridEditor_open
    @lib_finder.TextGridEditor_settings: max_range, dynamic_range, intensity_maximum
    @lib_finder.TextGridEditor_zoom: time, margin
    @lib_finder.ask_user_checked: case, n_cases, next_case
    @lib_finder.TextGridEditor_close
    
    #Según las decisiones tomadas en @ask_user_unchecked:
    if lib_finder.ask_user_checked.return = 1
        selectObject: tgID

        #Check the modificatons done to the target interval.
        @lib_finder.check_interval_content: segment_tier, time
        interval_label$ = lib_finder.check_interval_content.interval_label$

        what_should_I_do$= lib_finder.check_interval_content.return$
        if  what_should_I_do$ == "erase_interval"
            @lib_finder.erase_interval: segment_tier, time
        elsif what_should_I_do$ == "go_back"
            goto CHECKED
        endif

        #Save_data
        @lib_finder.tg_save: tg_fullname$

        selectObject: tableID_index
        @lib_preference.index_set_case: row, 1, interval_label$
        @lib_preference.index_save: file_dir_index$
        @lib_preference.index_save: tg_folder$ + "/" + transcriptorID$ + "_TextGrid_index.txt"
        next_case = lib_finder.ask_user_checked.next_case

    elsif lib_finder.ask_user_checked.return = 2
        next_case = lib_finder.ask_user_checked.next_case
        
    elsif lib_finder.ask_user_checked.return = 3
        next_case = lib_finder.ask_user_checked.next_case
        break = 1
    endif

    removeObject: sdID, tgID
    case = next_case
    @lib_preference.preferences_set_field_content_from: file_dir_preferences$, "case", string$(case)
endwhile

removeObject: tableID_index
