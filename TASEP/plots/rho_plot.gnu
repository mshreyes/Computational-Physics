set title 'Average occupation vs postion'
set grid
set autoscale
set xtics auto 
set ytics 0.05
set xlabel 'I'
set ylabel 'rho_{avg}(i)'
y = 0.5

alpha = 0.2
beta = 0.8
a = 1
box = sprintf("Alpha = %f \n Beta = %f \n a = %f", alpha, beta, a)
set object 1 rect from 200,0.75 to 350,0.67 fc rgb "white" 
set label 1 at 230,0.74 box


plot 'TASEP.dat' using 1:2 with lines lc 'blue' title 'rho_{avg}(i)'

pause -1