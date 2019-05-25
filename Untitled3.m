%close all;
syms x1 x2 s;
f(x1,x2) = (1 + (x1+x2+1).^2 .* (19-14*x1+3*x1.^2-13*x2+6*x1.*x2+3*x2.^2)) .* (30 + (2*x1-3*x2).^2 .* (18-32*x1+12*x1.^2+48*x2-36*x1.*x2+27*x2.^2));
%f(x1,x2) = goldstein_price([x1 x2])
P = [rand*4-2; rand*4-2];

h = hessian(f);
g = gradient(f);

%ezmesh(f);
hold all;

while eval((norm(g(P(1),P(2)))))>0.01
    plot3(P(1),P(2),f(P(1),P(2)),'*');
    d = -g(P(1),P(2))/norm(g(P(1),P(2)))*s +P;
    l(s) = f(d(1),d(2));
    sk = eliminare_gs(l,[0 10],0.01*0.01);
    P = P - eval(min(sk)* g(P(1),P(2))/norm(g(P(1),P(2))));
end
