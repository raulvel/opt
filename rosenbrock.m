function out = rosenbrock( x )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

out = 0;

for i=1:(length(x)-1)
    out = out +(100*(x(i)^2-x(i+1))^2 + (x(i)-1)^2);
end

end

