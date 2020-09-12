## Euler's method to solve differential equations:

#### Recursion formula for Euler's method 

For a given differential equation along with an initial condition,
<p align="center"><img src="/DEQ/EUM/tex/054908681de2467556fc61948104977c.svg?invert_in_darkmode&sanitize=true" align=middle width=241.50246284999997pt height=33.81208709999999pt/></p>

we can write the recussion equation as,
<p align="center"><img src="/DEQ/EUM/tex/c586f9728dbf09571df281187035e279.svg?invert_in_darkmode&sanitize=true" align=middle width=153.4970448pt height=16.438356pt/></p>

where _h_ is the step size or small interval defined as,
<p align="center"><img src="/DEQ/EUM/tex/3b5d068f9cbd98226faf7e1c9a02318e.svg?invert_in_darkmode&sanitize=true" align=middle width=217.1358354pt height=17.74618065pt/></p>

#### Example
Given differential equation and corresponding initial condition are 
<p align="center"><img src="/DEQ/EUM/tex/81c3242907286b19801e96f9c0484ff0.svg?invert_in_darkmode&sanitize=true" align=middle width=217.65536924999998pt height=33.81208709999999pt/></p>

#### Analytical solution

Rearranging above equation
<p align="center"><img src="/DEQ/EUM/tex/9425c8cf313e2892186a0901e6389fa5.svg?invert_in_darkmode&sanitize=true" align=middle width=87.6194055pt height=37.0084374pt/></p> 
Now, integrating on both sides we get,
<p align="center"><img src="/DEQ/EUM/tex/91678741fe654c9ce87fafac692480fd.svg?invert_in_darkmode&sanitize=true" align=middle width=127.94808509999999pt height=37.0084374pt/></p> 

<p align="center"><img src="/DEQ/EUM/tex/e96d89a99aafe81b4deaf2b6c4fb503c.svg?invert_in_darkmode&sanitize=true" align=middle width=107.74933784999999pt height=17.399144399999997pt/></p>
Simplifying and using given initial condition, we get,
<p align="center"><img src="/DEQ/EUM/tex/3cc3f3e52689e0786a120f012a7264b1.svg?invert_in_darkmode&sanitize=true" align=middle width=133.27930439999997pt height=32.990165999999995pt/></p>

![Analytical Solution](analytical.png)

![Solution for step size h = 0.1](euler1.png)

![Solution for step size h = 0.01](euler2.png)


**Note**: The graphical representation of solutions obtained using Euler's method have been restricted to the interval <img src="/DEQ/EUM/tex/acf5ce819219b95070be2dbeb8a671e9.svg?invert_in_darkmode&sanitize=true" align=middle width=32.87674994999999pt height=24.65753399999998pt/>


![Comparision of analytical solution and solutions obtained by Euler's method](euler_comparision.png)
