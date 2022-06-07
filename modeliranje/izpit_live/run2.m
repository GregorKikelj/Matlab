format long
%format short
format compact

A = [0.04, 1];
B = [3.5, 0.03];
l = 5.55;

w = risi_ver(A, B, l, 1e-15);


xLow=1.9725;

xprev = 0.04;
yprev = 1;
l_left=0;
for x=linspace(0.04, 3.5, 1000000)
    if x>xLow
        break
    end
    y=w(x);
    
    dy = y-yprev;
    dx = x-xprev;
    dl = sqrt(dx^2+dy^2);
    l_left = l_left+dl;

    xprev=x;
    yprev=y;
end
l_left;
l_right = l-l_left;

M = [xLow, 0];

wl = risi_ver(A, M, l_left, 1e-15);

wr = risi_ver(M, B, l_right, 1e-15);

xl = fminbnd(wl, A(1), M(1))
xr = fminbnd(wr, M(1), B(1))

wl(xl)
wr(xr)

wl(xl)-wr(xr)


