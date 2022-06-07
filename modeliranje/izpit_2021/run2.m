format long
%format short
format compact

c = 61;
T1 = [-2, 1];
T2 = [2, 4+c/100];
g=9.81;

l=12.61;

w = risi_ver(T1, T2, l, 1e-9);

xprev = -2;
yprev = 1;
area = 0;

for x=linspace(-2, 2, 1000000)
    y = w(x);
    if y>1
        break
    end
    dx = x-xprev;
    dy = y-yprev;
    dl = sqrt(dx^2+dy^2);
    
    l = l + dl;
    area = area + dx*((1-y)+(1-yprev))/2;

    xprev = x;
    yprev = y;
end
area


