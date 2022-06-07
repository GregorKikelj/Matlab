format long
%format short
format compact

bC = [-2.00     -1.08     0.00     1.04     0.00     3.00;     5.00     3.00     0.00     2.00     4.06     6.00];
bC;
%bCf = [bC(1,:); -bC(2, :)+10];
%bCf = rotiraj_bezier(bCf, .394791);

N = size(bC, 2);

bC = rotiraj_bezier(bC, 0.24746);
B = plotBezier(bC, 100, true);
%plotBezier(bCf, 100, true);



yLow = 100;
xLow = -10;
tLow = 0;
for t = linspace(0, 1, 100000)
    p = deCasteljau(bC, t);
    x = p(1);
    y = p(2);
    if y<yLow
        yLow=y;
        xLow=x;
        tLow=t;
    end
end
xLow
tLow
M = 0;
xprev = -2;
yprev =5;
for t = linspace(0, 1, 100000)
    p = deCasteljau(bC, t);
    x = p(1);
    y = p(2);    
    dl = sqrt((x-xprev)^2+(y-yprev)^2);

    M = M + dl*(x-xLow);

    xprev=x;
    yprev=y;
end
M


