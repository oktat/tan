set title "Az első elem a keresett érték" font "Helvetica,16"
set xlabel "Elemek" font "Helvetica, 16"
set ylabel "Műveletek" font "Helvetica, 16"


set label "legjobb eset" at first 20, first 6 font "Helvetica,14"
set label "Ω(1)" at first 20, first 3 font "Helvetica,14"

set nokey

set tics font "Helvetica,16"
width = 3


plot [0:40] [-2:40] 1 lw width
