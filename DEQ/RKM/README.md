# Runge-Kutta methods to solve differential equations:

## 1. Runge-Kutta 2nd order method (RK2M):
#### Recursion formula for RK2M

For a given differential equation along with an initial condition,
<p align="center"><img src="/DEQ/RKM/tex/054908681de2467556fc61948104977c.svg?invert_in_darkmode&sanitize=true" align=middle width=241.50246284999997pt height=33.81208709999999pt/></p>

we can write the recussion equation as,
<p align="center"><img src="/DEQ/RKM/tex/ce4da55fc720cbad77b18da95c1dffa0.svg?invert_in_darkmode&sanitize=true" align=middle width=166.9188708pt height=33.81208709999999pt/></p>
where 
<p align="center"><img src="/DEQ/RKM/tex/0afe3f5efbf90cb9a77d2b669fbc5f55.svg?invert_in_darkmode&sanitize=true" align=middle width=97.68075735pt height=16.438356pt/></p> 
<p align="center"><img src="/DEQ/RKM/tex/05cf2f150ee29d1b49b11fddd1410ce2.svg?invert_in_darkmode&sanitize=true" align=middle width=215.11411019999997pt height=16.438356pt/></p>
and <img src="/DEQ/RKM/tex/2ad9d098b937e46f9f58968551adac57.svg?invert_in_darkmode&sanitize=true" align=middle width=9.47111549999999pt height=22.831056599999986pt/> is the step size or small interval defined as,
<p align="center"><img src="/DEQ/RKM/tex/3b5d068f9cbd98226faf7e1c9a02318e.svg?invert_in_darkmode&sanitize=true" align=middle width=217.1358354pt height=17.74618065pt/></p>

#### Example
Given differential equation and corresponding initial condition are 
<p align="center"><img src="/DEQ/RKM/tex/81c3242907286b19801e96f9c0484ff0.svg?invert_in_darkmode&sanitize=true" align=middle width=217.65536924999998pt height=33.81208709999999pt/></p>

Above differential equation has the following solution
<p align="center"><img src="/DEQ/RKM/tex/3cc3f3e52689e0786a120f012a7264b1.svg?invert_in_darkmode&sanitize=true" align=middle width=133.27930439999997pt height=32.990165999999995pt/></p>

![Analytical Solution](analytical.png)

![Solution for step size h = 0.1 and anlytical solution](rkm21.png)

![Solution for step size h = 0.01 and anlytical solution](rkm22.png)

![Comparision of solution for different values of h](rkm2_comparision.png)

![Solution for h = 0.01](rkm2.png)


**Note**: The graphical representation of solutions obtained using RK2M have been restricted to the interval <img src="/DEQ/RKM/tex/acf5ce819219b95070be2dbeb8a671e9.svg?invert_in_darkmode&sanitize=true" align=middle width=32.87674994999999pt height=24.65753399999998pt/>

---

## 2. Runge-Kutta 4th order method (RK4M):
#### Recursion formula for RK4M

For a given differential equation along with an initial condition,
<p align="center"><img src="/DEQ/RKM/tex/59fe0e93f16ee5561686b0b60bd218ee.svg?invert_in_darkmode&sanitize=true" align=middle width=241.50246284999997pt height=33.81208709999999pt/></p>

we can write the recussion equation as,
<p align="center"><img src="/DEQ/RKM/tex/7dd6cfb61f6b7782273dac807ecb77e5.svg?invert_in_darkmode&sanitize=true" align=middle width=260.24064825pt height=33.81208709999999pt/></p>

where 
<p align="center"><img src="/DEQ/RKM/tex/bcbc63e759f8bd6e493188c1233c0f24.svg?invert_in_darkmode&sanitize=true" align=middle width=97.68075735pt height=16.438356pt/></p>
<p align="center"><img src="/DEQ/RKM/tex/b5035f05dbcaf347f41ad144fdf5abf7.svg?invert_in_darkmode&sanitize=true" align=middle width=178.2049269pt height=33.81208709999999pt/></p>
<p align="center"><img src="/DEQ/RKM/tex/0af32fd340829a352e67320e5ced20cf.svg?invert_in_darkmode&sanitize=true" align=middle width=178.2049269pt height=33.81208709999999pt/></p>
<p align="center"><img src="/DEQ/RKM/tex/96ab6f263b32059420f30c5d9472e95e.svg?invert_in_darkmode&sanitize=true" align=middle width=174.25975379999997pt height=16.438356pt/></p>

and <img src="/DEQ/RKM/tex/2ad9d098b937e46f9f58968551adac57.svg?invert_in_darkmode&sanitize=true" align=middle width=9.47111549999999pt height=22.831056599999986pt/> is the step size or small interval defined as,
<p align="center"><img src="/DEQ/RKM/tex/3b5d068f9cbd98226faf7e1c9a02318e.svg?invert_in_darkmode&sanitize=true" align=middle width=217.1358354pt height=17.74618065pt/></p>

#### Example 
For the same example above, using RK4M we obtain,

![Solution for step size h = 0.1 and anlytical solution](rkm41.png)

![Solution for step size h = 0.01 and anlytical solution](rkm42.png)

![Comparision of solution for different values of h](rkm4_comparision.png)

![Solution for h = 0.01](rkm4.png)

**Note**: The graphical representation of solutions obtained using RK4M have been restricted to the interval <img src="/DEQ/RKM/tex/acf5ce819219b95070be2dbeb8a671e9.svg?invert_in_darkmode&sanitize=true" align=middle width=32.87674994999999pt height=24.65753399999998pt/>

---

###### Data files:
- RK2M
    - For h = 0.1 [here](rkm21.txt)
    - For h = 0.01 [here](rkm22.txt)
- RK4M
    - For h = 0.1 [here](rkm41.txt)
    - For h = 0.01 [here](rkm42.txt)

---

###### Additional note:
The interval <img src="/DEQ/RKM/tex/acf5ce819219b95070be2dbeb8a671e9.svg?invert_in_darkmode&sanitize=true" align=middle width=32.87674994999999pt height=24.65753399999998pt/> is quite large to observe the difference between the analytical and the numerical solution. I've kept it that way because though by changing the graph parameters we can see the difference, the graph so obtained will look like a straight line and won't serve any purpose.