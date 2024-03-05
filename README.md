# MATLAB-2D-Taylor-Vortices-Problem

## This poject describes the development of a 2D computational code for solving the coupling problem of two Taylor vortices.

# Problem Description

After considering a steady, 2D, incompressible and viscous flow and a grid to describe the 2D space(x,y),
the Poisson equation for the interior points:

$V^2ψ=-ω$

And the boundary condition expressed for each external point $x_o$:

$ψ_Β = -\int\mathrm{\frac{1}{2π}}\ln(|r-r_o|) \mathrm{ω}(x_o)\mathrm{d}V$

Are sufficient to describe the problem.

# Step 1 - Analytical Solution

Taking into account that for a Taylor vortex:

$ω_Τ = (2-r^2)e^(\frac{1-r^2}{2})$

$ω_Τ = e^(\frac{1-r^2}{2})$

where “r” is the Euclidean distance from the center of the vortices, the analytical
solution is implemented in the file ...


The distance vectors r1 και r2 of the nodes from the 2 vortices are calculated by the
following function:

The results we obtain for the stream function and the vorticity field are shown in the
following graphs:



# Step 2 - Space discretization

The field [-5, 5] x [-5, 5] is discretized into a square grid of Nx = Ny = N = 51 points of
equidistance: Δx = Δy = 0.2.
The index i =1, 2, …, 51 runs through the points along the x-direction, while the index j = 1,2, …, 51 in the vertical direction. The aforementioned equations are now expressed in the discrete domain using a central finite differences scheme for each partial derivative:


$\frac{ψ_(i+1,j) + ψ_(i-1,j) - 4ψ_(i,j) + ψ_(i,j-1) + ψ_(i,j+1)}{Δx^2} = -ω_(i,j)$    (1)

$ψ_Β = - \sum_{2}^{N-1} \sum_{2}^{N-1} \frac{1}{2π} ln(|r-r_j|)ω_(i,j)Δx^2$           (2)









