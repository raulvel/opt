function points = gen_crowns(P, k )
%gen_crowns Generatte k points in a circle around point P
%   Detailed explanation goes here
rup = 0.01;
rdown = 0;

r = (rup-rdown)*rand + rdown;
rr = rand;
x = r*cos(rr*2*pi) + P(1);
y = r*sin(rr*2*pi) + P(2);
rup = rup+0.3;
rdown = rdown + 0.3;
points = [x, y];
for i=2:k
    %generate a random radius in crown interval
    r = (rup-rdown)*rand + rdown;
    %generate a random point on the circle w/ radius r
    rr = rand;
    x = r*cos(rr*2*pi) + P(1);
    y = r*sin(rr*2*pi) + P(2);
    points = [points; x, y];
    rup = rup+0.3;
    rdown = rdown + 0.3;
end
end
