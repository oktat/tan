
set label "O(x!)" at first -5, first 950 font "Helvetica,14"
set label "O(e^x)" at first 7, first 900 font "Helvetica,14"
set label "O(x^3)" at first 10, first 800 font "Helvetica,14"
set label "O(x^2)" at first 29, first 750 font "Helvetica,14"


set key font ",16"

set tics font "Helvetica,16"
width = 3
plot [0:140] [0:1000] gamma(x+1) lw width,exp(x) lw width,x**3 lw width, x**2 lw width

