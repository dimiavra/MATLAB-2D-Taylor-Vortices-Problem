function [w2x,w2y]=deyteresparagwgoi(w)
global Nx Ny dx dy
w2x=zeros(Nx,Ny);
w2y=zeros(Nx,Ny);
for i=1:Ny
    for j=2:1:Nx-1
        w2x(i,j)=(w(i,j+1)-2*w(i,j)+w(i,j-1))/(dx^2);
    end
end

for j=1:Ny
    for i=2:1:Nx-1
    w2y(i,j)=(w(i+1,j)-2*w(i,j)+w(i-1,j))/(dy^2);
    end
end