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
N = 9; %chose 5 because idk
hold all;
% n - no. of input variables
n = 2;

% domain of each input varialbe???dunno what e is for sure
e = round(nthroot(N,n)); 

clear P;
dmn2 = [a a+((b-a)/e)];
dmn3 = [a a+((b-a)/e)];
%a+rand*(b-a)
P = [dmn2(1)+rand*(dmn2(2)-dmn2(1)) dmn3(1)+rand*(dmn3(2)-dmn3(1))];
for j=1:(e)
    dmn2 = [a a+((b-a)/e)];
    for i=1:(e)
        if(~(i==1 && j ==1))%condition so we don't generate P1 again
            P = [P;dmn2(1)+rand*(dmn2(2)-dmn2(1)) dmn3(1)+rand*(dmn3(2)-dmn3(1))];
        end
        dmn2 = dmn2+1.333333;
    end
    dmn3 = dmn3+1.333333;
end
%short tabu list - all of the initial partitions 
STTL = P;

%plot points
for i=1:N
    plot3(P(i,1),P(i,2),goldstein_price([P(i,1),P(i,2)]),'*');
end
    
% best partition
bestz = goldstein_price(P(1,:));
bestxy = P(1,:);
for i=2:size(P,1)
    if(bestz > goldstein_price(P(i,:)))
        bestz = goldstein_price(P(i,:));
        bestxy = P(i,:);
    end
end

% neighbour search strateg

%current best solution
C = [bestxy bestz];
%step percentage
alpha = .2;
%direcion percentage
beta = .2;
%no. of neighbours
nn = 7;
%no. of crowns
P = alpha*nn;
Q = beta*nn;
M = round(nn - (P+Q));




%% obsolete
%function/script
clear P;
P = [R(1,dmn,e) R(1,dmn,e)];
for j=1:(e)
    for i=1:(e)
        if(~(i==1 && j ==1))%condition so we don't generate P1 again
            P = [P; R(i,dmn,e) R(j,dmn,e)];
        end
    end
end
