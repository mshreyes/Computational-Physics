 
# Lorenz Equations

The dynamics of a Lorenz system is described by the following differential equations, 

<!-- $$
\dot{x} \ = \ \sigma (y - x) 
$$ --> 

<div align="center"><img src="https://render.githubusercontent.com/render/math?math=%5Cdot%7Bx%7D%20%5C%20%3D%20%5C%20%5Csigma%20(y%20-%20x)%20%0D"></div>
	
<!-- $$
\dot{y} \ = \ x(\rho - z) - y 
$$ --> 

<div align="center"><img src="https://render.githubusercontent.com/render/math?math=%5Cdot%7By%7D%20%5C%20%3D%20%5C%20x(%5Crho%20-%20z)%20-%20y%20%0D"></div>
	
<!-- $$
\dot{z} \ = \ xy - \beta z
$$ --> 

<div align="center"><img src="https://render.githubusercontent.com/render/math?math=%5Cdot%7Bz%7D%20%5C%20%3D%20%5C%20xy%20-%20%5Cbeta%20z%0D"></div>
	where <!-- $\sigma, \rho, \beta \ \epsilon \ \mathbb{R}$ --> <img src="https://render.githubusercontent.com/render/math?math=%5Csigma%2C%20%5Crho%2C%20%5Cbeta%20%5C%20%5Cepsilon%20%5C%20%5Cmathbb%7BR%7D">


Read more about physical interpretations of these equation on [Wikipedia](https://en.wikipedia.org/wiki/Lorenz_system)



### Numerical Analysis
For <!-- $\sigma = 10, \rho = 28, \beta = 8/3$ --> <img src="https://render.githubusercontent.com/render/math?math=%5Csigma%20%3D%2010%2C%20%5Crho%20%3D%2028%2C%20%5Cbeta%20%3D%208%2F3">, we get the following solution, using Euler's method (h=0.01),

![Plot of z vs x](LEa.png)
![Plot of z vs y](LEb.png)
![Plot of x vs t](LEc.png)
![Plot of y vs t](LEd.png)
Data file for above plots can be found [here](/LSA/plots/leqn1.dat)
Fortran code (using Euler's method)  [source file](/LSA/lorenz1.f95)
Fortran code (using Runge-Kutta 4th order method)  [source file](/LSA/lorenz2.f95)

### Scripts and Plots
Plots and Gnuplot scripts can be found [*here*](/LSA/plots)

A thorough analysis of these equations can be read [*here*](Lorenz_analysis.pdf)

All the plots for above analysis are compiled [*here*](Lorenz_plots.pdf)

