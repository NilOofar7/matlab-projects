clear all
syms t s
N1=input('enter noghate gereh N1=');
N=input('enter tedade marahel N=');
n=input('enter tedade jomleha n=');
a=input('enter bast hole a=');
b=input('enter bande bala b=');
X=exp(-t).*cos(t);
k=exp(sin(t));
L=input('enter landa L=');
X1=subs(X,t,s);
y=L.*X-int(k.*X1,s,a,b);
H=(2.*pi)/N1;
max1=zeros(N,2);
for r=1:N
    w=0;
    W=0;
    A=zeros((2.*n(r))+1);
    d=zeros((2.*n(r))+1,1);
    h=(2.*pi)/(2.*n(r))+1;
for i=1:(2.*n(r))+1
    for Z=1:(2.*n(r))+1
        w=subs(k,t,a+(i-1).*h);
        q=2/((2.*n(r))+1).*(sin((2.*n(r)+3).*(s-((Z-1).*h)))/2.*sin(s-((Z-1).*h)/2));
        u=w.*q;
        if Z==i
            A(i,Z)=L-int(u,a,b); 
        else
            A(i,Z)=-int(u,a,b);
        end
    end
    d(i,1)=subs(y,t,(i-1).*h);
end
c=A\d;
x=c(1).*(2/((2.*n(r))+1).*(sin((2.*n(r)).*t))/2.*sin(t/2));
for g=1:2.*n(r)
    G=2/((2.*n(r))+1).*(sin((2.*n(r)+1).*(t-(g.*h)))/2.*sin(t-(g.*h)/2));
    x=x+c(g+1,1).*G;
end
f=0;
m=0;
M=0;
R=0;
max=0;
for j=1:N1
    f=a+(j-1).*H;
    m=eval(subs(x,t,f));
    M=eval(subs(X,t,f));
    R=abs(m-M);
    if R>max
        max=R;
    end
end
%disp(max);
max1(r,1)=max;
max1(r,2)=n(r);
end
%disp(n);
disp(max1);
    