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


$\frac{ψ_{i+1,j} + ψ_{i-1,j} - 4ψ_{i,j} + ψ_{i,j-1} + ψ_{i,j+1}}{Δx^2} = -ω_{i,j}$    (1)

$ψ_Β = - \sum_{2}^{N-1} \sum_{2}^{N-1} \frac{1}{2π} ln(|r-r_j|)ω_{i,j}Δx^2$           (2)


The following function calculates the vorticity at each point (I,j) by taking the addition of the vorticity of the two Taylor vortices. It takes the distance of each node from the 2
vortices as arguments:


# Step 3 - Solving the linear system

The linear problem is expressed on the following form:

$A*ψ = b$

where ψ, b are vectors of $N^2$ dimension while A is a $N^2$ x $N^2$ matrix.

Observing the equation (1) we deduce that for all internal points of 𝜜, the following would
apply:

$A(k,k) = - \frac{4}{Δx^2}$

And the (-N, -1, 1, N)-th diagonals (main diagonal is 0) would be equal to $\frac{1}\{Δx^2}$.
When k takes a value corresponding to an external point, due to equation (2), the
corresponding k-th line of A is overwritten with zeros in all places except for the element
of the main diagonal which takes a unit value.
Taking into account the aforementioned observations, we construct the matrix A (denoted
as M in the code) using the following function:

For the k values that correspond to interior points:

$b_k = -ω_(i,j)$

When k refers to a boundary point, 𝑏𝑘 will take the corresponding value of the stream
function. Exploiting the principle above, the following function forms the vector b and
then solves the linear system with respect to ψ (denoted as xx in the code):


Since $𝑢 = \frac{\partial ψ}{\partial y}$ , and $v =  - \frac{\partial ψ}{\partial x}$ the calculation of the velocities uses, the central finite
differences scheme regarding the internal points, while at the boundary points backward
or forward difference approximation is implemented. The calculations were carried out
via the following section of code:


# Step 4 - Solving the Time-dependent problem

The following equation:


$\frac{\partial ω}{\partial t} + u \nabla ω = ν_α \nabla ^2ω$ 


is solved using the Forward Euler method.

The first-order spatial derivatives were computed using the central finite differences
scheme and forward/backward difference approximation at the boundary points,

while the second-order spatial derivatives were calculated only at the internal points
using a central finite differences scheme:

The change of the vorticity value over time implies a change in boundary conditions and
the value of the stream function. 
Therefore, at each time step the boundary conditions must be recalculated, the system must be re-solved and new velocities must be
calculated.
This is achieved via the following main section of code (here for the viscous
case, similarly for the non-viscous case):


*For the viscous case, a time step dt=0.1 was selected while for the non-viscous case
dt=0.01 was selected.




