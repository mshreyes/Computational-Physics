set title 'Plot of z versus x (sigma = 10, beta = 8/3, rho = 28)'
set autoscale
set grid
set xtics auto 
set ytics auto
set xlabel 'x'
set ylabel 'z'
plot 'leqn1.dat' using 2:4 with lines title 'z(x)'
pause -1