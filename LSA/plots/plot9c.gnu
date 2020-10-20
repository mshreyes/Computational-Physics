set title "Solution for Lorenz Equations (sigma = 10, beta = 2, rho = 21.42)"
set autoscale
set grid
set xtics auto 
set ytics auto 
set xlabel 'x' 
set ylabel 'y'
set zlabel 'z'
set label 1 'P_2' at -6.39,-6.39,20.42 tc rgb 'red' 
set label 2 'I_0' at -6,-6,20 tc rgb 'blue' 
splot "leqn1.dat" using 2:3:4 with lines title "f(x,y,z)"
pause -1