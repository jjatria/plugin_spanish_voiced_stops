@moveColumn: "start", 29
@moveColumn: "end", 29
@moveColumn: "tmid", 29
@moveColumn: "previous_pause", 13
@moveColumn: "phone_transcribed", 13
@moveColumn: "intensity_minimun", 13
@moveColumn: "intensity_maximun", 13
@moveColumn: "intensity_difference", 13
@moveColumn: "intensity_mean", 13
@moveColumn: "word_ocurrence", 17

procedure moveColumn: .columnName$, .column
    Insert column: .column, "temp"
    Formula: "temp", "self$[.columnName$]"
    Remove column: .columnName$
    .column = Get column index: "temp"
    Set column label (index): .column, .columnName$
endproc
