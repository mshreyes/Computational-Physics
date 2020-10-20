set title "Plot of y versus x (sigma = 10, beta = 2, rho = 21.42)"
set autoscale
set grid
set xlabel 'x'
set ylabel 'y'
set xtics auto
set ytics auto
set label 1 'P_2' at 6.39,6.39,20.42 tc rgb 'red' 
plot "leqn1.dat" using 2:3 with lines title "y(x)"
pause -1
