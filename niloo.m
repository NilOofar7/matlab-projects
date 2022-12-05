clc
clear all
x=input('enter x=');
t=input('enter t=');
   
    for j=1:4
     s=0;   
     u=0;
    for i=1:1000
        s=s+(1/i.^2).*((sin(1/2.*i.*pi)).*(sin(i.*pi.*x)).*(exp((-i.^2).*(pi.*2).*t(j))));
    end
    
    u=s.*(8/pi.^2);
    r(j)=u;
    disp(r(j));  
    end
 
        