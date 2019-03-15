syms x
close all;
e = 0.001;
a = 0;
b = pi;
d = b - a;
hold all;
ezplot(sin(x),[a b]);

while((b-a)>=e)
    plot((a+b)/2,sin((a+b)/2),'*');
    d = 0.619 * d;
    x1 = b - d;
    x2 = a + d;
    if(sin(x1)<=sin(x2))
        b = x2;
    else
        a = x1;
    end
end
plot((a+b)/2,sin((a+b)/2),'*');

%%
syms x
close all;
e = 0.001;
a = 0;
b = pi;
d = b - a;
hold all;

f1 = 1;
f2 = 2;
c = 0;
ezplot(sin(x),[a b]);

while((b-a)>e)
    plot((a+b)/2,sin((a+b)/2),'*');
    d = f1/f2 * d;
    aux = f2;
    f2 = f1 + f2;
    f1 = aux;
    x1 = b - d;
    x2 = a + d;
    if(sin(x1)<sin(x2))
        b = x2;
    else
        a = x1;
    end
end

%%
close all;
syms x1 x2 s
f(x1,x2) = x1^3 + 4*x1*x2^2 + 5*x2^2 + x1^2;

[x,y] = meshgrid(linspace(-3,2),linspace(-3,2));
%mesh(x,y,@f(x1,x2) [x y]);
ezmesh(f(x1,x2));

figure;

c1(s) = 1*s + 2;
c2(s) = 1*s - 3;

g(s) = f(c1(s),c2(s));
ezplot(g(s));

%figure;

e = 0.001;
a = 0;
b = 20;
d = b - a;
hold all;
%ezplot(g(s),[a b]);

while((b-a)>=e)
    plot((a+b)/2,g((a+b)/2),'*');
    d = 0.619 * d;
    x1 = b - d;
    x2 = a + d;
    if(g(x1)<=g(x2))
        b = x2;
    else
        a = x1;
    end
end
plot((a+b)/2,g((a+b)/2),'*');