set title "Rendezések legrosszabb esetben" font "Helvetica,16"
set xlabel "Elemek" font "Helvetica, 16"
set ylabel "Műveletek" font "Helvetica, 16"

set nokey

set tics font "Helvetica,16"
width = 3

set label "shell\nΩ(n log(n))" at first 8.5, first 35 font "Helvetica,14"
set label "buborék\nbeszúr\ngyors\nΩ(n)" at first 1, first 38 font "Helvetica,14"


plot [0:40] [0:40] x**2 lw width, x*log(x)**2 lw width