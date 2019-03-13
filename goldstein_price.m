function out = goldstein_price( x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

x1 = x(1);
x2 = x(2);

out = (1 + (x1+x2+1).^2 .* (19-14*x1+3*x1.^2-13*x2+6*x1.*x2+3*x2.^2)) .* (30 + (2*x1-3*x2).^2 .* (18-32*x1+12*x1.^2+48*x2-36*x1.*x2+27*x2.^2));

end

