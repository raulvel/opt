%% setup
% domain
a = -2;
b = 2;
dmn = [a b];

% values for the variables
[x,y] = meshgrid(linspace(a,b), linspace(a,b));

% the function
%z = (1 + ((x+y+1).^2) .* (19-14.*x+3.*x.^2-13.*y+6.*x.*y+3.*(y.^2))) .* (30 + ((2.*x-3.*y).^2) .* (18-32.*x+12.*(x.^2)+48.*y-36.*x.*y+27.*(y.^2)));
%using the function to get z
z = x;
for i=1:size(x,1)
    for j=1:size(x,1)
        z(i,j) = goldstein_price([x(i,j) y(i,j)]);
    end
end

% plot the function
surf(x,y,z);

%% partitioning
% N - no. of partitions
N = 4; %chose 5 because idk

% n - no. of input variables
n = 2;

% domain of each input varialbe???dunno what e is for sure
e = round(nthroot(N,n)); 

% TODO a function for this
% P1 = [R(1,dmn) R(1,dmn)];
% P2 = [R(2,dmn) R(1,dmn)];
% P3 = [R(1,dmn) R(2,dmn)];
% P4 = [R(2,dmn) R(2,dmn)];

%function/script
clear P;
P = [R(1,dmn,e) R(1,dmn,e)];
for j=1:e
    for i=1:e
        if(~(i==1 && j ==1))%condition so we don't generate P1 again
            P = [P; R(i,dmn,e) R(j,dmn,e)];
        end
    end
end

% best partition???
bestz = goldstein_price(P(1,:));
bestay = P(1,:);
for i=2:size(P,1)
    if(bestz > goldstein_price(P(i,:)))
        bestz = goldstein_price(P(i,:));
        bestay = P(i,:);
    end
end



