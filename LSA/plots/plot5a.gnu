set title "Plot of x versus t (sigma = 10, beta = 5, rho = 49)"
set autoscale
set grid
set xlabel 'time (t)'
set ylabel 'x'
set xtics auto
set ytics auto
plot "leqn1.dat" using 1:2 with lines title "x(t)"
pause -1
