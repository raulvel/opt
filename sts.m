function best_point = sts(P,tl)
%sts This function does the algorithm for tabu search
%   Detailed explanation goes here
s = P;
best_point = s;

stop = 0;
while(stop<4)
    %generate neighbours
    neigh = gen_crowns(s,4);
    %best neighbour
    %bn = neigh(1,:);
    bn = [20 20];
    for i=1:size(neigh,1)
        if(~(is_tabu(neigh(i,:),tl))&&(goldstein_price([neigh(i,1),neigh(i,2)]) < goldstein_price([bn(1),bn(2)])))
            bn = neigh(i,:);
        end
    end
    if(isequal(bn,[20 20]))
        %nothing happens
        %because each neighbour is from the tabu list
        stop = stop + 1;
    else
        s = bn;
        if(goldstein_price([s(1),s(2)]) < goldstein_price([best_point(1),best_point(2)]))
            best_point = s;
        end
        tl = [tl; s];
    end
end
best_point = [best_point];
end

