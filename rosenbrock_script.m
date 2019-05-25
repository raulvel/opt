%% setup

% values for the variables
[x,y] = meshgrid(linspace(-5,10), linspace(0,15));

% the function
%z = (1 + ((x+y+1).^2) .* (19-14.*x+3.*x.^2-13.*y+6.*x.*y+3.*(y.^2))) .* (30 + ((2.*x-3.*y).^2) .* (18-32.*x+12.*(x.^2)+48.*y-36.*x.*y+27.*(y.^2)));
%using the function to get z
z = x;
for i=1:size(x,1)
    for j=1:size(x,1)
        z(i,j) = rosenbrock([x(i,j) y(i,j)]);
    end
end

% plot the function
surf(x,y,z);