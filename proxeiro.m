clear all
close all
global Nx Ny dx dy x y x0
x0=-5;xf=5;dx=.2;dy=.2;
Nx=ceil((xf-x0)/dx)+1;
Ny=ceil((xf-x0)/dy)+1;
ystr1=1.5; ystr2=-1.5;
dt=.01;
kinim=1.5*exp(-5);
M=stathmhtrwo();
[r,r1,r2]= distance(ystr1,ystr2);
wstr=strobilothta(r1,r2);

fh = figure;
vid=VideoWriter('lol.avi');
open(vid);
for t=0:dt:15
[bd,bu,br,bl,btel,xx]= oriakes(wstr,M);
xx_array=reshape(xx',[Nx,Ny]);
figure(fh)
%contourf(x,y,xx_array)
[u,v]=taxytita(xx_array');
[wx,wy]=ormi(wstr);
[w2x,w2y]=deyteresparagwgoi(wstr);
contourf(x,y,wstr)
title('Vorticity Field, FD & Forward Euler time-stepping')
colorbar
frame=getframe(gcf);
writeVideo(vid,frame);
wstr=wstr-dt*(u.*wx+v.*wy)+kinim*(w2x+w2y);
end
close(vid);