%close all;
%rosenbrock method for finding the minimum
syms x1 x2;
f(x1,x2) = (1 + (x1+x2+1).^2 .* (19-14*x1+3*x1.^2-13*x2+6*x1.*x2+3*x2.^2)) .* (30 + (2*x1-3*x2).^2 .* (18-32*x1+12*x1.^2+48*x2-36*x1.*x2+27*x2.^2));
%f(x1,x2) = (100*(x1^2-x2)^2 + (x1-1)^2);
%initial values
e = 0.01;
Ptt = [0 0];

for jj=1:100

P = [rand*4-2 rand*4-2];
P1 = [rand*4-2 rand*4-2];
d = [1 1;-1 1];
s = [2 3];
alpha = 3;
beta = -0.8;
k = 1;

%ezmesh(f);
hold all;
tic
while(norm(P-P1)>e)
    c = [0 0];
    o = 0;
    success = [0 0];
    fail = [0 0];
    while(o == 0)
        for i=1:2
            if(f(P(1) + s(i)*d(i,1),P(2) + s(2)*d(i,2)) <= f(P(1),P(2)))
                P1 = P;
                P = P + s(i)*d(i,:)
                %plot3(P(1),P(2),f(P(1),P(2)),'*');
                k = k + 1;
                success(i) = 1;
                c(i) = c(i) + s(i);
                s(i) = s(i)*alpha;
            else
                fail(i) = 1;
                s(i) = s(i)*beta;
            end
        end
        if(sum(success)==2 && sum(fail)==2)
            o = 1;
        end
    end
    a1 = c(1)*d(1,:) + c(2)*d(2,:);
    a2 = c(2)*d(2,:);
    
    b1 = a1;
    d(1,:) = b1/norm(b1);
    
    b2 = a2 - (((a2*b1')/(norm(b1)^2))*b1);
    d(2,:) = b2/norm(b2);
end
P
toc
Ptt=[Ptt;P];
end

Ptt=Ptt(2:end,:);
plot3(Ptt(:,1),Ptt(:,2),f(Ptt(:,1),Ptt(:,2)),'*');