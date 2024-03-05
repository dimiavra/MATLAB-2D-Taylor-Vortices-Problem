function [r,r1,r2] = distance(ystr1,ystr2)
global Nx Ny dx dy x y x0
xstr=-1.5;
for i=1:Nx
    x(i)=x0+(i-1)*dx;
    for j=1:Ny
        y(j)=x0+dy*(j-1);
    end
end
for i=1:1:Ny
   for j=1:1:Nx
       r(i,j)=sqrt(x(j)^2+y(i)^2);
       r1(i,j)=sqrt((x(j)-xstr)^2+(y(i)-ystr1)^2);
       r2(i,j)=sqrt((x(j)-xstr)^2+(y(i)-ystr2)^2);
   end
end
