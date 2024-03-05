clear all
close all

global Nx Ny dx dy x y x0
x0=-5;xf=5;dx=.2;dy=.2;
Nx=ceil((xf-x0)/dx)+1;
Ny=ceil((xf-x0)/dy)+1;
ystr1=1.5; ystr2=-1.5;
kinim=1.5*exp(-5);
[r,r1,r2]= distance(ystr1,ystr2);
 psi = exp((1-r1.^2)/2) - exp((1-r2.^2)/2);
 vort = (2-r1.^2).*exp((1-r1.^2)/2) - (2-r2.^2).*exp((1-r2.^2)/2);
contourf (x,y,vort)
colorbar
title('Analytical vorticity field')
xlabel('X')
ylabel('Y')
figure
contourf(x,y,psi)
colorbar
title('Analytical stream function')
xlabel('X')
ylabel('Y')