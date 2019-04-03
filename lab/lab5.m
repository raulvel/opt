close all;
syms x1 x2 s;
f(x1,x2) = 18*x1^2 + 20*x2^4 + x1*x2 + x2^2;
%f(x1,x2) = goldstein_price([x1 x2])
P = [6; 6];

h = hessian(f);
g = gradient(f);

ezmesh(f);
hold all;

beta = 0;
d = 7;
while eval((norm(g(P(1),P(2)))))>0.01
    plot3(P(1),P(2),f(P(1),P(2)),'*');
    %add
    d = eval(-g(P(1),P(2))/norm(g(P(1),P(2)))) + beta*d;
    l(s) = f(P(1)+s*d(1),P(2)+s*d(2));
    sk = eliminare_gs(l,[0 20],0.01*0.01);
    P1 = P;
    P = P + sk*d;
    beta = eval(norm(g(P(1),P(2)))^2 / norm(g(P1(1),P1(2)))^2);
end

%% 
close all;
syms x1 x2 s;
% f(x1,x2) = 18*x1^2 + 20*x2^4 + x1*x2 + x2^2;
f(x1,x2)= x1^2+x2^2;
%f(x1,x2) = goldstein_price([x1 x2])
P = [6; 6];

h = hessian(f);
grad = gradient(f);

ezmesh(f);
hold all;

beta = eye(2);
P1 = P;
x = P - P1;
while eval((norm(grad(P(1),P(2)))))>0.01
    plot3(P(1),P(2),f(P(1),P(2)),'*');
    %add
%     d = -B * eval(g(P(1),P(2))/norm(g(P(1),P(2)))) * P';
%     l(s) = f(P(1)+s*d(1),P(2)+s*d(2));
%     sk = eliminare_gs(l,[0 20],0.01*0.01);
%     P1 = P;
%     P = P + sk*d';
%     G = (eval(g(P(1),P(2)) - g(P1(1),P1(2))))';
%     x = (P - P1);
%     B = B + ((G'*G)/(G*x)) - (((B*x)*(B*x)')/(x'*B*x));
    d = beta*(-eval(grad(P(1),P(2))));
    l(s) = f((P(1) + s*d(1)),(P(2) + s*d(2)));
    Sk = eliminare_gs(l,[0, 20], e*0.01, -1);
    P_old = P;
    P = P + (Sk*d)
    deltaP = P - P_old;    
    deltaG = eval(grad(P(1),P(2)) - grad(P_old(1),P_old(2)))';

    %beta = beta + (deltaG'*deltaG/deltaG*deltaP) - (beta*deltaP*(beta*deltaP)'/deltaP'*beta*deltaP);
    beta = beta + (deltaP*deltaP')/(deltaP'*deltaG') - (beta*deltaG'*(beta*deltaG')')/(deltaG*beta*deltaG');
    k=k+1;
end