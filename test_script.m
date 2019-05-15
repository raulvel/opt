close all;
point = [2 -1.5];
goldstein_price(point)
%plot3(point(1),point(2),goldstein_price(point),'*');
%hold;
pointts = sts(point)
nm(pointts)
%goldstein_price(pointts)
%plot3(pointts(1),pointts(2),goldstein_price(pointts),'*');