clear all
n=input('enter tedade jomleha n=');
a=input('enter bast hole a=');
b=input('enter bande bala b=');
X(t)=input('enter javabe daghighe moadele X(t)=');
k(t,s)=input('enter cernl k(t,s)=');
h=input('enter tole gam j=');
L=input('enter landa L=');
q=0;
p=0;
syms t
y(t)=L.*X(t)-int(y(t),a,b);
for i=1:n
    g=diff(k,t,i-1);
    p(i)=subs(g,t,a);
    q(i)=(t-a).^(i-1)/factorial(i-1);
end
A=zeros(n);;
d=zeros(n);
for j=1:n
    w(s)=subs(q(j),t,s);
    u(s)='w(j).*p(j)';
    A(j,j)=L-quad(u(s),a,b);
    Y(s)=subs(y(t),t,s);
    v(s)='Y(s).*p(j)';
    d(j,1)=quad(v(s),a,b);
    for r=1:n
        if r~=j
            W(s)=subs(q(r),a,b);
            U(s)='W(s).*p(j)';
            A(j,r)=-quad(U(s),a,b);
        end
    end
end
c=A\d;
x(t)=(1/z)y(t);
for u=1:n
    x(t)=x(t)+c(u)*q(u);
end
disp(x(t));