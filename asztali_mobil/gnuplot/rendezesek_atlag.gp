set title "Rendezések átlagos esetben" font "Helvetica,16"
set xlabel "Elemek" font "Helvetica, 16"
set ylabel "Műveletek" font "Helvetica, 16"

set nokey

set tics font "Helvetica,16"
width = 3

set label "gyors\nθ(log n)" at first 12.5, first 30 font "Helvetica,14"
set label "shell\nθ((log n)²)" at first 8.5, first 37 font "Helvetica,14"
set label "buborék\nbeszúr\n θ(n²)" at first 0.3, first 37 font "Helvetica,14"

plot [0:40] [0:40] x*(log(x)) lw width, x*(log(x)**2) lw width, x**2 lw width
