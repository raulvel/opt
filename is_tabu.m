function yes = is_tabu(P, tl)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
radius = 0.3;%the radius in which it checks
yes = 1;
for i=1:size(tl,1)
    if(((P(1)-tl(i,1))^2 + (P(2)-tl(i,2))^2) > radius^2)
        yes = 0;
    else
        yes = 1;
        break;
    end
end

end

