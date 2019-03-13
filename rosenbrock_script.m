[x,y] = meshgrid(linspace(-5,10), linspace(0,15));

for i=1:(length(x)-1)
    z = z +(100*(x(i)^2-x(i+1))^2 + (x(i)-1)^2);
end
mesh(x,y,z);
