function [min,n,d] =eliminare_gs(func, range, e)
%ELIMINARE Summary of this function goes here
%   Detailed explanation goes here
    a=range(1);
    b=range(2);
    d = b-a;
    phi = 144/89-1;
    n = 2;
    while abs(b-a) > e
        d = d*phi;
        x1 = b-d;
        x2 = a+d;
        if func(x1)<=func(x2)
            b=x2;
        else
            a=x1;
        end
        n = n+1;
    end
    min = mean([a,b]);
end