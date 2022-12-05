clear all
M=input('tedade marahel M=');
a=input('bande paiyne D a=');
b=input('bande balaye D b=');
h=input('enter tole gameX h=');
r=input('enter r=');
U=input('uper bound U=');
T(1,1)=0;
X(1,1)=0;
k=r.*(h.^2);
N=(b-a)./h;
x(N+1)=1;
u=0;
for s=1:N+1
    q=(h.*(s-1));
    if (q<=0.5)
        u(s)=2.*q;
    else
        u(s)=2.*(1-q);
    end
end
        
for i=2:M
    u(i,N+1)=U;
    for j=2:N
        u(i,j)=r.*u(i-1,j-1)+(1-2.*r).*u(i-1,j)+r.*u(i-1,j+1);
        X(j)=h.*(j-1);
    end
    u(i,1)=-(u(i,2)/(1-h));
    T(i)=k.*(i-1);
    
end
disp(X);
disp(T);
disp(u);
surf(u); 