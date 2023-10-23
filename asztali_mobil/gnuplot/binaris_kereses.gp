set label "legrosszabb esetben" at first 14, first 28 font "Helvetica,14"
set label "O(n)" at first 20, first 25 font "Helvetica,14"

set label "átlagos esetben" at first 20, first 10 font "Helvetica,14"
set label "θ(log n)" at first 20, first 7 font "Helvetica,14"

set nokey

set tics font "Helvetica,16"
width = 3

set title "Bináris keresés" font "Helvetica,16"
set xlabel "Elemek" font "Helvetica, 16"
set ylabel "Műveletek" font "Helvetica, 16"

plot [0:40] [0:40] log(x)/log(2) lw width, x lw width
                   