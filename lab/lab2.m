syms x1 x2 l;

f(x1,x2) = x1^2 + 2*x1*x2 + x2^2;

g = gradient(f);
h = hessian(f);
s = solve(g);
for i=1:length(s.x1)
    hff = h(s.x1(i),s.x2(i));
    a = eval(eig(hff));
    min(i)=all(a>0);
    max(i)=all(a<0);
    if(min(i) == 0 && max(i) == 0)
        saddle(i) = 1;
    else
        saddle(i) = 0;
    end
end