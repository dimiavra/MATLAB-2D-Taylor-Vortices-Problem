function [wx,wy]=ormi(w)
global Nx Ny dx dy
wx=zeros(Nx,Ny);
wy=zeros(Nx,Ny);
for i=1:Nx
    for j=2:1:Nx-1
        wx(i,j)=(w(i,j+1)-w(i,j-1))/(2*dx);
    end
    wx(i,1)=(w(i,2)-w(i,1))/dx;
    wx(i,Nx)=(w(i,Nx)-w(i,Nx-1))/dx;
end

for j=1:Nx
    for i=2:1:Nx-1
        wy(i,j)=(w(i+1,j)-w(i-1,j))/(2*dy);
    end
    wy(1,j)=(w(2,j)-w(1,j))/dy;
    wy(Nx,j)=(w(Nx,j)-w(Nx-1,j))/dy;
end
