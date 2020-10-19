set title 'Plot of x versus time (sigma = 10, beta = 8/3, rho = 28)'
set autoscale
set grid
set xtics auto 
set ytics auto
set xlabel 'time'
set ylabel 'x'
plot 'leqn1.dat' using 1:2 with lines title 'x(t)'
pause -1