function [u,v]=taxytita(xx)
global Nx Ny dx dy
u=zeros(Nx,Ny);
v=zeros(Nx,Ny);
deiktis=0;
for i=1:1:Nx
    for j=2:1:Ny-1
        v(i,j)=-(xx(deiktis+j+1)-xx(deiktis+j-1))/(2*dx);
    end
    deiktis=deiktis+Nx;
end
deiktis=0;
for j=1:1:Nx
   for i=2:1:Ny-1
       u(i,j)=(xx(i*Nx+j)-xx((i-2)*Nx+j))/(2*dy);
    end
    deiktis=deiktis+Nx;
end

%εμπρός διαφόριση
deiktis1=0;
for i=1:Nx
    u(Nx,i)=(xx((Nx-1)*Nx+i)-xx((Nx-2)*Nx+i))/dy;
    v(i,1)=-(xx(deiktis1+2)-xx(deiktis1+1))/dx;
    deiktis1=deiktis1+Nx;
end

%πίσω διαφόριση
deiktis2=0;
for i=1:Nx
    u(1,i)=(xx(Nx+i)-xx(i))/dy;
    v(i,Nx)=-(xx(deiktis2+Nx)-xx(deiktis2+Nx-1))/dx;
    deiktis2=deiktis2+Nx;
end

