set title "Plot of x versus t (rho = 0.7)"
set autoscale
set grid
set xlabel 'time (t)'
set ylabel 'x'
set xtics auto
set ytics auto
plot "leqn1.dat" using 1:2 with lines title "x(t)"
pause -1


