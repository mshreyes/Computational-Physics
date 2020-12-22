set title 'Average energy vs KbT/J (N = 10, J = 1)'
set grid
set yrange [0:1]
set xtics auto
set ytics auto 
set xlabel 'KbT/J'
set ylabel '<E> per spin'

plot 'ising.dat' using 1:2 with lines lc 'blue' t '<E> per spin'

pause -1