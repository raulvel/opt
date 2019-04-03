clc;clear all;close all;

syms x1 x2 s;
f(x1,x2) = 5*x1^4 + x1^2*x2 + x2^2 - 3*x2 + 1;

P = [14;16];
e = 0.001;

hess = hessian(f);
grad = gradient(f);
k=0;
beta = eye(2);
d = -eval(grad(P(1),P(2)));

while eval(norm(grad(P(1),P(2)))) > e 
    d = beta*(-eval(grad(P(1),P(2))));
    l(s) = f((P(1) + s*d(1)),(P(2) + s*d(2)));
    Sk = eliminare_gs(l,[0, 20], e*0.01);
    P_old = P;
    P = P + (Sk*d)
    deltaP = P - P_old;    
    deltaG = eval(grad(P(1),P(2)) - grad(P_old(1),P_old(2)))';
    beta = beta + (deltaP*deltaP')/(deltaP'*deltaG') - (beta*deltaG'*(beta*deltaG')')/(deltaG*beta*deltaG');
    k=k+1;
end

ezmesh(f);hold on;
plot(P(1),P(2), 'r*')