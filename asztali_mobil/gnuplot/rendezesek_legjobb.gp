set title "Rendezések legjobb esetben" font "Helvetica,16"
set xlabel "Elemek" font "Helvetica, 16"
set ylabel "Műveletek" font "Helvetica, 16"

set nokey

set tics font "Helvetica,16"
width = 3

set label "gyors\nshell\nΩ(n log(n))" at first 14, first 35 font "Helvetica,14"
set label "buborék\nbeszúrásos\nΩ(n)" at first 17, first 15 font "Helvetica,14"


plot [0:40] [0:40] x*log(x) lw width, x lw width