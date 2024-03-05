function [w,w1,w2]=strobilothta(r1,r2)
global Nx Ny  
w1=(2-r1.^2).*exp((1-r1.^2)/2);
w2=-(2-r2.^2).*exp((1-r2.^2)/2);
for i=1:1:Nx
    for j=1:1:Ny
        w(i,j)= w1(i,j)+w2(i,j);
    end
end

