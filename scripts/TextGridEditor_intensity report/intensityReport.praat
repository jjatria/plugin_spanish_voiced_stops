intensity_min = Get minimum intensity
intensity_max= Get maximum intensity
intensity_differrence = intensity_max - intensity_min
intensity_mean = Get intensity

clearinfo
appendInfoLine: "Intensity Report (Db)" + newline$
appendInfoLine: "Intensity mean: ", round(intensity_mean)
appendInfoLine: "Minimun intensity: ", round(intensity_min)
appendInfoLine: "Maximun intensity: ", round(intensity_max)
appendInfoLine: "Intensity difference: ", round(intensity_differrence)
