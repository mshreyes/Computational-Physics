set title "Plot of y versus x (rho = 1)"
set autoscale
set grid
set xlabel 'x'
set ylabel 'y'
set xtics auto
set ytics auto
plot "leqn1.dat" using 2:3 with lines title "y(x)"
pause -1
