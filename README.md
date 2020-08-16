# numerical-analysis-algorithms

Some numerical analysis algorithms, written from scratch in Octave.

## Contents

### Root finding in continuous non linear functions

* `bisection.m`  a [bisection method](https://en.wikipedia.org/wiki/Bisection_method) implementation. The bisection method converges lineary.

* `newrton_raphson.m` an implementation of the [Newton-Ramphson's method](https://en.wikipedia.org/wiki/Newton%27s_method). The Newton-Raphson's method converges quadraticly, if certain criteria are met.

* `b_nr.m`  a combination of the Newton-Raphson's method. The algorithm, intilally, finds a solution using the Newton-Raphson's method (which is a heavely computational task) and then enchanches the solution's estimation using (the much simpler) bisection method.

### Linear algebra methods

* `gauss_partial_pivoting.m` an implementaion of the [Gauss elimination]( https://en.wikipedia.org/wiki/Gaussian_elimination) using [partial pivoting](https://web.mit.edu/10.001/Web/Course_Notes/GaussElimPivoting.html) in order to avoid rounding errors. 

* `gaussian_solve.m` after using the `gauss_partial_pivoting`  to transform a matrix in an upper triangular, you may use this method to solve the linear system.

* `gaussina_inv.m` this algorithm uses the `gauss_partial_pivoting`  and the `gaussian_solve` methods to calculate the invert of a given matrix.

### Ιnterpolation

* `@newton_dd_interpolation` a class implementing [Newton's interpolation method](https://en.wikipedia.org/wiki/Newton_polynomial), using [divided differences](https://en.wikipedia.org/wiki/Finite_difference). The class provides the method `@newton_dd_interpolation/estimate.m` to estimate the value of a function in a given point. To calculate the divided differences, we use the algorithm `divided_differences.m`.  Also the user may add a new known point of the estimated function via the classes method `@newton_dd_interpolation/add_point.m`. In order to recalculate the interpolation polynomial more efficiently, we use the `divided_differences_incrimental.m`.

* `@newton_fd_interpolation` a class implementing [Newton's interpolation method](https://en.wikipedia.org/wiki/Newton_polynomial), using [forward differences](https://en.wikipedia.org/wiki/Finite_difference). The class provides the method `@newton_fd_interpolation/estimate.m` to estimate the value of a function in a given point. To calculate the divided differences, we use the algorithm `forward_differences.m`. Also the user may add a new known point of the estimated function via the classes method `@newton_fd_interpolation/add_point.m`. In order to recalculate the interpolation polynomial more efficiently, we use the `forward_differences_incrimental.m`.

### Eigenvalues

* `power_iteration.m`  an implemantation of the [power iteration method](https://en.wikipedia.org/wiki/Power_iteration) for finding the greatest (in absolute value) eigenvalue.  The user may use different iteration steps to calculate the gretest eigenvalue:
  
  * **modified step**: uses the [supremum norm](https://en.wikipedia.org/wiki/Norm_(mathematics)#Maximum_norm_(special_case_of:_infinity_norm,_uniform_norm,_or_supremum_norm)) to normalize the eigen vector in each step.
  
  * **reyleigh step**: uses the [euclidean norm](https://en.wikipedia.org/wiki/Norm_(mathematics)#Euclidean_norm) to normalize the eigen vector in each step. This method makes use of the [rayleigh quotient](https://en.wikipedia.org/wiki/Rayleigh_quotient).
  
  * **aitikens step**: uses the modified step above, but also makes use of the [Aitiken's delta-squared process](https://en.wikipedia.org/wiki/Aitken%27s_delta-squared_process) for accelerating the rate of convergence.
  
  The preffered variant of the algorithm is passed as last parameter. The default iteration step is the **modified step**.

### Numerical quadrature (integration)

* `midpoint_integral.m` an implementation of the [midpoint rule](https://en.wikipedia.org/wiki/Riemann_sum#Midpoint_rule).

* `simpsons_integral.m`  an implementation of the [Simpson's rule](https://en.wikipedia.org/wiki/Simpson%27s_rule).

* `trapezodial_integral.m` an implementation of the [trapezoidal rule](https://en.wikipedia.org/wiki/Trapezoidal_rule).

## Notes

The code above has been tested in GNU Octave, version 5.1.0.
