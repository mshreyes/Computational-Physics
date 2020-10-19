set title 'Plot of y versus time (sigma = 10, beta = 8/3, rho = 28)'
set autoscale
set grid
set xtics auto 
set ytics auto
set xlabel 'time'
set ylabel 'y'
plot 'leqn1.dat' using 1:3 with lines title 'y(t)'
pause -1