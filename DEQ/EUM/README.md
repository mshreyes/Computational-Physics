## Euler's method to solve differential equations:

#### Recursion formula for Euler's method 

For a given differential equation along with an initial condition,
\[
\frac{dy}{dx} = f(x,y) \ ; \qquad y(x=x_0) = y_0 \\
\]

we can write the recussion equation as,
\[
y_{i+1} = y_i + h f(x_i, y_i)
\]

where <img src="/DEQ/EUM/tex/2ad9d098b937e46f9f58968551adac57.svg?invert_in_darkmode&sanitize=true" align=middle width=9.47111549999999pt height=22.831056599999986pt/> is the step size or small interval defined as,
\[
    h = x_{i+1} - x_i \quad \text{where} \quad i \ \epsilon \ \mathbb{Z^+} 
\]

##### Example
Given differential equation and corresponding initial condition are 
\[
\frac{dy}{dx} = 2xy \ ; \qquad y(x=0) = 0.5 \\
\]

##### Analytical solution

Rearranging above equation
\[
\frac{dy}{y} \ = \ 2x{dx} \\
\] 
Now, integrating on both sides we get,
\[
\int \frac{dy}{y} \ = \ \int 2x{dx} 
\] 

\[
    \ln{y} \ = \ x^2 + C
\]
Simplifying and using given initial condition, we get,
\[
y(x) \ = \ \frac{1}{2} \exp(x^2) \\
\]

![Analytical Solution](analytical.png)

![Solution for step size h = 0.1](euler1.png)

![Solution for step size h = 0.01](euler2.png)


**Note**: The graphical representation of solutions obtained using Euler's method have been restricted to the interval <img src="/DEQ/EUM/tex/acf5ce819219b95070be2dbeb8a671e9.svg?invert_in_darkmode&sanitize=true" align=middle width=32.87674994999999pt height=24.65753399999998pt/>


![Comparision of analytical solution and solutions obtained by Euler's method](euler_comparision.png)
