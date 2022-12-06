clear all
syms t s
N1=input('enter noghate gereh N1=');
N=input('enter tedade marahel N=');
n=input('enter tedade jomleha n=');
a=input('enter bast hole a=');
b=input('enter bande bala b=');
X=exp(-t).*cos(t);
k=exp(s.*t);
L=input('enter landa L=');
X1=subs(X,t,s);
y=L.*X-int(k.*X1,s,a,b);
h=(b-a)/N1;
V=zeros(1,2);
max1=zeros(N,2);
for r=1:N
    w=0;
    W=0;
    A=zeros(n(r));
    d=zeros(n(r),1);
    q=zeros(1,n(r));
    p=zeros(1,n(r));
for i=1:n(r)
    g=diff(k,t,i-1);
    p=subs(g,t,a);
    q=((t-a).^(i-1))/factorial(i-1);
    w=subs(q,t,s);
    u=w.*p;
    A(i,i)=L-int(u,a,b);
    Y=subs(y,t,s);
    v=Y.*p;
    d(i,1)=int(v,a,b);
    for Z=1:n(r)
        if Z~=i
            Q=((t-a).^(Z-1))/factorial(Z-1);
            W=subs(Q,t,s);
            U=W.*p;
            A(i,Z)=-int(U,a,b);
        end
    end
end
c=A\d;
x=(1/L).*y;
for u=1:n(r)
    q=(t-a).^(u-1)/factorial(u-1);
    x=x+(1/L).*c(u,1).*q;
end
f=0;
m=0;
M=0;
R=0;
max=0;
for j=1:N1
    %h=(b-a)/n(r);
    f=a+(j-1).*h;
    m=eval(subs(x,t,f));
    M=eval(subs(X,t,f));
    R=abs(m-M);
    if R>max
        max=R;
    end
end
%disp(max);
max1(r,2)=abs(n(r));
max1(r,1)=max;
end
F='n';
E='E';
V(1,1)=F;
V(1,2)=E;
disp(V)
disp(max1);
    