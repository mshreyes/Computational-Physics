set title 'Plot of z versus y (sigma = 10, beta = 8/3, rho = 28)'
set autoscale
set grid
set xtics auto 
set ytics auto
set xlabel 'y'
set ylabel 'z'
plot 'leqn1.dat' using 3:4 with lines title 'z(y)'
pause -1