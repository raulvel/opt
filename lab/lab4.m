close all;
syms x1 x2;
f(x1,x2) = 18*x1^2 + 20*x2^4 + x1*x2 + x2^2;

P = [6; 6];

h = hessian(f);
g = gradient(f);

ezmesh(f);
hold all;

while(norm(g(P(1),P(2)))>0.01)
    plot3(P(1),P(2),f(P(1),P(2)),'*');
    P = P - eval(inv(h(P(1),P(2))) * g(P(1),P(2)));
end

%% 
close all;
syms x1 x2 s;
f(x1,x2) = 18*x1^2 + 20*x2^4 + x1*x2 + x2^2;

P = [6; 6];

h = hessian(f);
g = gradient(f);

ezmesh(f);
hold all;

while eval((norm(g(P(1),P(2)))))>0.01
    plot3(P(1),P(2),f(P(1),P(2)),'*');
    %g1 = g(P(1),P(2));
   % d1(s) = -g1(1)*s + P(1);
   % d2(s) = -g1(2)*s + P(2);
    d = -g(P(1),P(2))/norm(g(P(1),P(2)))*s +P;
    l(s) = f(d(1),d(2));
    sk = eliminare_gs(l,[0 10],0.01*0.01,-1);
    P = P - eval(min(sk)* g(P(1),P(2))/norm(g(P(1),P(2))));
end
