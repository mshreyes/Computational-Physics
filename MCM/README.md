# Monte Carlo Methods

---

1. **Monte Carlo integration methods** 
    In the provided example, we find the area of an ellipse using MC integration. We make use of the simple fact that area of ellipse is four times the area in first quadrant.

    - *Approach 1*: Hit-and-Pass MCM ([code](/MCM/integral.f95))
        <!-- $$ 
        \int_{a}^{b} f(x) \ dx = \frac{N_s}{N} f_m(x) (b-a) 
        $$ --> 

        <div align="center"><img src="..\svg\CqpsQxX088.svg"/></div>

    - *Approach 2*: Averaging of function over N ([code](/MCM/integral2.f95))

        <!-- $$
        \int_{a}^{b} f(x) \ dx = (b-a) \frac{1}{N} \sum_{i=1}^N f(x_i) 
        $$ --> 

        <div align="center"><img src="..\svg\7aK4vE6DpA.svg"/></div>

2. **Gambler's Ruin problem** (WIP)

3. **2D random walk** ([code](/MCM/Rdwalk.f95)) 
    ![plot](/MCM/plots/Rdwalk2D.png)
