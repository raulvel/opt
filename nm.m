function best = nm(P )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%initial values
e = 0.0001;
v1 = P;
v2 = P + [0 1];
v3 = P + [1 1];
v = [v1; v2; v3];

%compute function values
while ((norm(v1-v2)+norm(v1-v3)) > e)
    vals = [goldstein_price([v1(1),v1(2)]) goldstein_price([v2(1),v2(2)]) goldstein_price([v3(1),v3(2)])];
    %eval(vals);
    [a, b] = sort(vals);
    B = v(b(1),:);
    G = v(b(2),:);
    W = v(b(3),:);
    M = (B+G)/2;
    R = (2*M)-W;
    if(goldstein_price([R(1),R(2)]) < goldstein_price([W(1),W(2)]))
        E = 2*R - M;
        fE = goldstein_price([E(1),E(2)]);
        if(fE < goldstein_price([R(1),R(2)]))
            W = E;
        else
            W = R;
        end
    else
        C1 = (M+W)/2;
        C2 = (M+R)/2;
        if(goldstein_price([C1(1),C1(2)]) < goldstein_price([C2(1),C2(2)]))
            C = C1;
        else 
            C = C2;
        end
        if(goldstein_price([C(1),C(2)]) < goldstein_price([W(1),W(2)]))
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

best = B;
end

