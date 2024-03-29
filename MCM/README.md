# Monte Carlo Methods

---

1. **Monte Carlo integration methods** 
    In the provided example, we find the area of an ellipse using MC integration. We make use of the simple fact that area of ellipse is four times the area in first quadrant.

    - *Approach 1*: Hit-and-Pass MCM ([code](/MCM/integral.f95))

        $$ \int_a^b f(x) dx  = \frac{N_s}{N}f_m(x)(b-a)$$

    - *Approach 2*: Averaging of function over N ([code](/MCM/integral2.f95))

        $$ \int_a^b f(x) dx  = \frac{(b-a)}{N}\sum_{i=1}^Nf(x_i)$$

2. **Gambler's Ruin problem** ([code](/MCM/gambler.f95)) ([analysis](/MCM/gambler.pdf))  

    Consider a gambler, say A, playing with an initial capital of i (in some unit of currency) and with a total capital N on the table. A random event such as a coin toss will decide whether A wins or not. If A wins, i increases by one and if he loses, i is reduced by 1. The game ends when either A loses all of his money i.e. i = 0 or wins enough rounds so that i = N. 


     If p is the probability that A wins a round, and q = 1 - p is the probability that A loses a round, then the probability that A wins the whole game (i = N) is given by following probability distribution functions:

    - **Analytical solution**:  

        $$P(i) = \frac{1 - (\frac{q}{p})^i}{1 - (\frac{q}{p})^N}, \quad \text{if } p \neq 0.5 $$
        
        $$P(i) = \frac{i}{N}, \quad \text{if } p = 0.5$$

        Analytical solution i.e. probability distribution obtained analytically (using above formula) can be found [here](/MCM/plots/plotb.pdf)
    

    -  **Numerical solution**: 
 

        $$P(i) = \frac{\text{Number of games won}}{\text{Number of games played}} = \frac{n_{wins}}{n_{games}}$$

        Numerical solution i.e. probability distribution obtained numerically (using above formula) can be found [here](/MCM/plots/plota.pdf).

    - A comparison between both the methods is [here](/MCM/plots/plotc.pdf)


3. **2D random walk** ([code](/MCM/Rdwalk.f95)) ([plot](/MCM/plots/Rdwalk2D.png))

---

##### Note:

- **RAND()** implements *a simple modulo generator* (or what's called a linear congruential pseudorandom number generator (PRNG))and unless one is working with legacy code (f77) it is advisible to use a different PRNG implementation. The reason being higher auto-correlation and a short period. ( see [documentation](https://gcc.gnu.org/onlinedocs/gfortran/RAND.html))

- Instead it is advisable to use **RANDOM_NUMBER** subroutine which implements *xoshiro256\*\* PRNG*. (see [documentation](https://gcc.gnu.org/onlinedocs/gfortran/RANDOM_005fNUMBER.html#RANDOM_005fNUMBER)). 

- Summary:

    ```
    ! If you are working with FORTRAN 77 (legacy code) use:
    r = rand()

    ! If you are working with FORTRAN 90/95/03 use:
    call random_number(r)
    ```
  
