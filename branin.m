function out = branin( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x1 = x(1);
x2 = x(2);

%out = (x2 - (5/4*pi^2)*x1^2 + (5/pi)*x1 - 6)^2 + 10*(1-(1/8*pi))*cos(x1) + 10;
out = (x2 - 5./(4.*pi.^2).*x1.^2 + (5./pi).*x1 - 6).^2 + 10.*(1-1./(8.*pi)).*cos(x1) + 10;
end

