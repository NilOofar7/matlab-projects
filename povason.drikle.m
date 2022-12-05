clear all
a=input('bande paiyn a=');
b=input('bande bala b=');
h=input('tole gam h=');
m=(b)./h;
n=(a)./h;
W=zeros((m-1),(m1));
P=zeros((m-1)+2);
A=zeros((m-1).*(n-1));
B=zeros(n-1);
s=zeros((n-1),1);
T=zeros((m-1)*(n-1),1);
for i=1:n-1
    B(i,i)=-4;
    s(i,1)=1;
    if i>1
        B(i,i-1)=1;
    end
       if i<n-1
            B(i,i+1)=1;
       end
end
A(1:n-1,1:n-1)=B;
A(1:n-1,n:2*n-2)=eye(n-1);
T(1:n-1,1)=s;
for j=2:m-2
    A((j-1)*(n-1)+1:j*(n-1),(j-2)*(n-1)+1:(j-1)*(n-1))=eye(n-1);
    A((j-1)*(n-1)+1:j*(n-1),(j-1)*(n-1)+1:j*(n-1))=B;
    A((j-1)*(n-1)+1:j*(n-1),j*(n-1)+1:(j+1)*(n-1))=eye(n-1);
    T((j-1)*(n-1)+1:j*(n-1),1)=s;
end
A((m-2)*(n-1)+1:(m-1)*(n-1),(m-3)*(n-1)+1:(m-2)*(n-1))=eye(n-1);
A((m-2)*(n-1)+1:(m-1)*(n-1),(m-2)*(n-1)+1:(m-1)*(n-1))=B;
T((m-2)*(n-1)+1:(m-1)*(n-1),1)=s;
U=A\-T;
for r=1:m-1
    for t=1:n-1
        W(r,t)=U((r-1)*(n-1)+t,1);
    end
end
        for z=2:m
            for k=2:m
                P(z,k)=W(z-1,k-1);
            end     
        end
disp(P);
surf(P);
        