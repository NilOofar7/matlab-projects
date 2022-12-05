clear all
a=input('bande paiyn a=');
b=input('bande bala b=');
h=input('tole gam h=');
x=input('enter number landa x=');
m=(2.*b)./h;
n=(2.*a)./h;
W=zeros(m+1,n+1);
A=zeros(m-1);
B=zeros(n-1);
U=zeros(m.*n);
R=zeros(m.*n);
for i=1:n-1
    B(i,i)=-4;
    if i>1
        B(i,i-1)=1;
    end
       if i<n
        if i==1
        B(i,i+1)=2;
        else
            B(i,i+1)=1;
        end
       end
end
for j=1:m
    A((j-1).*n+1:j.*n,(j-1).*n+1:j.*n)=B;
    if j>1
        if j~=m
        A((j-1).*n+1:j.*n,(j-2).*n+1:(j-1).*n)=eye(n);
        else
        A((j-1).*n+1:j.*n,(j-2).*n+1:(j-1).*n)=2.*eye(n);
        end
    end
        if j<m
            A((j-1).*n+1:j.*n,j.*n+1:(j+1).*n)=eye(n);
        end
end
[U,R]=eig(A);
for z=1:m.*n
    if z==x
        for r=2:m+1
        for t=1:n
            W(r,t)=U(t+(r-2).*n,z);
        end
        end
    end
end
disp('landa=x')
disp(R(x,x));
disp(W);
surf(W);
