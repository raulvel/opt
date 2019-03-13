[x,y] = meshgrid(linspace(-5,10), linspace(0,15));

z = (y - (5./4.*pi.^2).*x.^2 + (5./pi).*x - 6).^2 + 10.*(1-((1./8).*pi)).*cos(x) + 10;

surf(x,y,z);
