close all;
syms x1 x2;
f(x1,x2) = 3*x1^2 + 2*x1^4 - x2 + x2^2 + 1;

%initial values
e = 0.01;
v1 = [3 3]*rand;
v2 = [6 3]*rand;
v3 = [3 6]*rand;
v = [v1; v2; v3];

%compute function values
while ((norm(v1-v2)+norm(v1-v3)) > e)
    vals = [f(v1(1),v1(2)) f(v2(1),v2(2)) f(v3(1),v3(2))];
    eval(vals);
    [a, b] = sort(vals);
    B = v(b(1),:);
    G = v(b(2),:);
    W = v(b(3),:);
    M = (B+G)/2;
    R = (2*M)-W;
    if(f(R(1),R(2)) < f(W(1),W(2)))
        E = 2*R - M;
        fE = f(E(1),E(2));
        if(fE < f(R(1),R(2)))
            W = E;
        else
            W = R;
        end
    else
        C1 = (M+W)/2;
        C2 = (M+R)/2;
        if(f(C1(1),C1(2)) < f(C2(1),C2(2)))
            C = C1;
        else 
            C = C2;
        end
        if(f(C(1),C(2)) < f(W(1),W(2)))
            W = C;
        else
            S = (B+W)/2;
            W = S;
            G = M;
        end
    end
    v1 = B;
    v2 = G;
    v3 = W;
    v = [v1; v2; v3];
end

%plot
ezmesh(f);
hold all;
plot3(v1(1),v1(2),f(v1(1),v1(2)),'*')
plot3(v2(1),v2(2),f(v2(1),v2(2)),'*')
plot3(v3(1),v3(2),f(v3(1),v3(2)),'*')

g = gradient(f);
eval(g(v1(1),v1(2)))
