clear all
a=input('bande paiyn a=');
b=input('bande bala b=');
h=input('tole gam h=');
x=input('enter number landa x=');
m=(2.*b)./h;
n=(2.*a)./h;
W=zeros(m+1,n+1);
A=zeros((m-1)*(m-1));
B=zeros(n-1);
U=zeros((m-1).*(n-1));
R=zeros((m-1).*(n-1));
for i=1:n-1
    B(i,i)=-4;
    if i>1
        B(i,i-1)=1;
    end
       if i<n-1
            B(i,i+1)=1;
       end
end
A(1:n-1,1:n-1)=B;
A(1:n-1,n:2*n-2)=eye(n-1);
for j=2:m-2
    A((j-1)*(n-1)+1:j*(n-1),(j-2)*(n-1)+1:(j-1)*(n-1))=eye(n-1);
    A((j-1)*(n-1)+1:j*(n-1),(j-1)*(n-1)+1:j*(n-1))=B;
    A((j-1)*(n-1)+1:j*(n-1),j*(n-1)+1:(j+1)*(n-1))=eye(n-1);
end
A((m-2)*(n-1)+1:(m-1)*(n-1),(m-3)*(n-1)+1:(m-2)*(n-1))=eye(n-1);
A((m-2)*(n-1)+1:(m-1)*(n-1),(m-2)*(n-1)+1:(m-1)*(n-1))=B;
A=(1/h.^2)*A;
[U,R]=eig(-A);
for z=1:(m-1)*(n-1)
    if z==x
        for r=2:m
        for t=2:n
            W(r,t)=U((r-2)*(n-1)+(t-1),z);
        end
        end
    end
end
disp('landa=x');
disp(R(x,x));
disp(W);
surf(W);
