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
