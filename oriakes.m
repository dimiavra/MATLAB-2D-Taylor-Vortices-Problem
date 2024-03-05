function [bd,bu,br,bl,btel,xx]= oriakes(w,M)
global Nx Ny dx dy x y
bd=zeros(Nx,1);
bu=zeros(Nx,1);
br=zeros(Ny,1);
bl=zeros(Ny,1);

for o=1:1:Nx
    for j=2:1:Nx-1
        for i=2:1:Ny-1
            bd(o)= bd(o)- (1/(2*pi))*log(sqrt((x(o)-x(i))^2+(y(1)-y(j))^2))*w(i,j)*dx*dy;
            bu(o)= bu(o)- (1/(2*pi))*log(sqrt((x(o)-x(i))^2+(y(Ny)-y(j))^2))*w(i,j)*dx*dy;
        end
    end
end

for oo=1:1:Nx
    for i=2:1:Nx-1
        for j=2:1:Ny-1
            br(oo)= br(oo)- (1/(2*pi))*log(sqrt((x(Nx)-x(i))^2+(y(oo)-y(j))^2))*w(i,j)*dx*dy;
            bl(oo)= bl(oo)- (1/(2*pi))*log(sqrt((x(1)-x(i))^2+(y(oo)-y(j))^2))*w(i,j)*dx*dy;
        end
    end
end
btel=-w(:);
btel(1:Nx)=bd;
btel(Nx*Ny-Nx+1:1:Nx*Ny)=bu;


deiktis=0;
for i=1:Nx
    btel(1+deiktis)=bl(i);
    btel(Nx+deiktis)=br(i);
    deiktis=deiktis+Nx;
end
xx=M\btel;
end
