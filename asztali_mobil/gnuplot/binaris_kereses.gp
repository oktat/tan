set label "legrosszabb, átlagos" at first 14, first 8 font "Helvetica,14"
set label "O(log(n))  θ(log(n)) " at first 14, first 5 font "Helvetica,14"

set label "legjobb esetben" at first 20, first -5 font "Helvetica,14"
set label "Ω(log n)" at first 20, first -2 font "Helvetica,14"

set nokey

set tics font "Helvetica,16"
width = 3

set title "Bináris keresés" font "Helvetica,16"
set xlabel "Elemek" font "Helvetica, 16"
set ylabel "Műveletek" font "Helvetica, 16"

plot [0:40] [-8:40] log(x) lw width, 1 lw width
                   