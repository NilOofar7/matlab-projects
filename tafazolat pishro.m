clear all
r=input('zarib r=');
h=input('tole gamx h=');
k=input('tole gamt k=');
M=input('tedade gamha M=');
N=1/h;
u=zeros(M,(N+1));
u(1,:)=1;
for j=2:M
    u(j,2)=8/11.*u(j-1,2)+1/4.*u(j-1,3);
    u(j,1)=10/11.*u(j,2);
    for i=3:N
        u(j,i)=1/4.*(u(j-1,i-1)+2.*u(j-1,i)+u(j-1,i+1));
    end
    u(j,N+1)=u(j-1,N+1)+r.*(u(j-1,N)-(1+h).*u(j-1,N+1));
end
syms x
alpha=fzero('x.*tan(x)-1/2',0);
U=0;
t=0;
R=0;
for z=1:M+1
    t(z)=k.*(z+1);
    syms n
    A=symsum((sec(alpha(n))/(3+4.*alpha(n)^2)).*cos(2.*alpla(n)).*(0.3),1,inf);
    U(z)=4.*A;
    R(z)=u(z,3)-U(z);
end
disp(u);
surf(u);