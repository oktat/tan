set title "Ismétlődés keresése" font "Helvetica,16"
set xlabel "Elemek" font "Helvetica, 16"
set ylabel "Műveletek" font "Helvetica, 16"


set label "átlagos eset" at first 6, first 32 font "Helvetica,14"
set label "θ(n²)" at first 7, first 35 font "Helvetica,14"

set nokey

set tics font "Helvetica,16"
width = 3


plot [0:40] [0:40] x**2 lw width
