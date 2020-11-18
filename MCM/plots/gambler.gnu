set title 'Numerical solution: Plot of P(i) versus i'
set grid
set xtics 2 
set ytics auto
set xrange [0:20]
set yrange [-0.1:1]
set xlabel 'i: Initial capital'
set ylabel 'P(i): Probability of A winning the game'
plot 'gambler.dat' using 1:2 with linespoint lc 'red' title 'P(i)_{numerical}'

pause -1