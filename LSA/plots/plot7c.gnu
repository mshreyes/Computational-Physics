set title "Solution for Lorenz Equations (sigma = 10, beta = 2, rho = 10)"
set autoscale
set grid
set xtics auto 
set ytics auto 
set xlabel 'x' 
set ylabel 'y'
set zlabel 'z'
set label 1 'P_2' at -4.24,-4.24,9 tc rgb 'red' 
set label 2 'I_0' at -6,-6,20 tc rgb 'blue' 
splot "leqn1.dat" using 2:3:4 with lines title "f(x,y,z)"
pause -1