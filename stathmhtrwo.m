function M =stathmhtrwo()
global Nx Ny dx dy
N=Nx*Ny;
a=1/(dx^2);b=(-2/(dx^2)-2/(dy^2));c =1/(dy^2);
M=zeros(N,N);
M( 1:1+N:N*N) = b;
M( N+1:1+N:N*N) = a;
M(2:1+N:N*N-N) = a; 
M( 1:1+N:Nx*N) = 1;
M(Nx*(N+1)+1:Nx*(N+1):N*N)=1;
M((Nx-1)*N+Nx:Nx*(N+1):N*N)=1;
M(N+1:N+1:(Nx+1)*(N+1))=0;%Πρωτα 8 μηδενικα πανω σειρα
M(2:1+N:(Nx)*(N+1)) =0;%Πρώτα 8 μηδενικα κατω σειρα
M((Nx+1)*(N+1):Nx*(N+1):N*N)=0;%κομβος 8,15 μηδενικα
M((Nx)*(N+1):Nx*(N+1):N*N)=0;
M(2:1+N:(Nx)*(N+1)) =0;
M((Nx-1)*N+Nx+1:(N+1)*Nx:N*N)=0;
M((Nx-2)*N+Nx:(N+1)*Nx:N*N)=0;
M(N*N-(N+1)*Nx:N+1:N*N)=1;
M(N*N -(Nx-1)*N-Nx+2:N+1:N*N)=0;
M(N*N-(Nx-1)*N-Nx:N+1:N*N)=0;
[row,column]=find(M==b);
for i=1:size(column)
    M(column(i),column(i)+Nx)=1/(dy^2);
    M(column(i),column(i)-Nx)=1/(dy^2);
end
end








