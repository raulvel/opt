%close all;
hold all;
tot = [0 0];
for i=1:100
point = [rand*4-2 rand*4-2];
goldstein_price(point);
%plot3(point(1),point(2),goldstein_price(point),'*');
%hold;
tic
pointts = sts(point,STTL);
toc
tot=[tot;nm(pointts)];
%goldstein_price(pointts)
%plot3(pointts(1),pointts(2),goldstein_price(pointts),'*');
end
corect = 0;
incorect = 0;
for i=2:101
    if((-.01<tot(i,1) && tot(i,1)<.01) && (-1.1<tot(i,2) && tot(i,2)<-0.9))
        corect = corect + 1;
    else
        incorect = incorect + 1;
    end
end
tot = tot(2:end,:);
for i=2:101
    plot3(tot(i,1),tot(i,2),goldstein_price([tot(i,1),tot(i,2)]),'*')
end
