format long

T_0 = [0, 5];
T_1 = [5, 3];

l = 19;

w = risi_ver(T_0, T_1, l, 1e-9);
fminbnd(w, 0, 5) %x s.t. w(x) is min

z = @(x) w(x)-x;
fzero(z, 0) % x where z(x)==x

x0 = fzero(@(x) w(x)-4, 0);

l = 0
xprev = x0
yprev = 5
for x=linspace(x0, 5, 100000)
    y = w(x);
    l = l + sqrt((xprev-x)^2+(yprev-y)^2);
    xprev = x;
    yprev = y;
end
l

fminbnd(risi_ver([0, 3], T_1, l, 1e-9), 0, 5)