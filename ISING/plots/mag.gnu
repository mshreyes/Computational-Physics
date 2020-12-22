set title 'Average magnetization vs KbT/J (N = 10, J = 10)'
set grid
set yrange [0:1]
set xtics auto
set ytics auto 
set xlabel 'KbT/J'
set ylabel '<M> per spin'

plot 'ising.dat' using 1:3 with lines lc 'blue' t '<M> per spin'

pause -1