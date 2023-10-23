
set label "legrosszabb esetben" at first 14, first 28 font "Helvetica,14"
set label "O(n)" at first 20, first 25 font "Helvetica,14"

set label "átlagos esetben" at first 20, first 16 font "Helvetica,14"
set label "θ(log n)" at first 20, first 19 font "Helvetica,14"

set nokey

set tics font "Helvetica,16"
width = 3

set title "Szekvenciális keresés" font "Helvetica,16"
set xlabel "Elemek" font "Helvetica, 16"
set ylabel "Műveletek" font "Helvetica, 16"

plot [0:40] [0:40] x lw width
