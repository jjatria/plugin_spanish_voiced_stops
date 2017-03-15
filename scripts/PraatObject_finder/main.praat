form Interval finder
    comment TextGrid info
    natural Segment_tier 1
    comment Segmental view
    real margin(s) 0.3
    comment Spectrogram settings
    real Dynamic_range 45
    real Max_range(Hz) 5500
endform

runScript: "finder_unchecked_cases.praat", segment_tier, margin, dynamic_range, max_range

beginPause: ""
    comment: "Would you like to review the transcriptions?"
clicked = endPause: "Yes", "No", 1
if clicked = 1
    runScript: "finder_checked_cases.praat", segment_tier, margin, dynamic_range, max_range
endif
