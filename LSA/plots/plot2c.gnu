set title "Solution for Lorenz Equations (rho = 1.5)"
set autoscale
set grid
set xtics auto 
set ytics auto 
set xlabel 'x' 
set ylabel 'y'
set zlabel 'z'
set label 1 'P_1 (0,0,0)' at 0,0,0 tc rgb 'red' right
set label 2 'I_0 (0.5,0.5,0.5)' at 0.5,0.5,0.5 tc rgb 'blue' left
splot "leqn1.dat" using 2:3:4 with lines title "f(x,y,z)"
pause -1