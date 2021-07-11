set title 'Probability curve'
set grid
set autoscale 
set xtics auto 
set ytics auto
set xlabel 'X'
set ylabel 'P(X)'

plot 'rdwalk1.dat' using 1:2 with lines lc 'blue' title 'P(X)'

pause -1