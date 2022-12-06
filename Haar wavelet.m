function [h] = har(xp,M)  %%% vector h_(m)(xp)
J=(log (M)/log (2))-1;
h(1)=1;
for j=0:J
    m=2^j;
    for k=0:(m-1)
        i=(m+k+1);
        a=k/m;
        b=(k+0.5)/m;
        c=(k+1)/m;
                   
        if a<=xp && xp<b
            h(i)=1;
        elseif b<=xp && xp<c
            h(i)=-1;
        else
            h(i)=0;
        end   
    end
end    %for
 
h=h';