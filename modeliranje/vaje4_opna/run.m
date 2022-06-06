f = @(x) (x<.1)*4+(0.2<x & x<0.3)*-1;
r = 1;
n = 40;

[sol, lspace] = upogib_opne(f, r, n);
%plot(lspace, sol);
t = zeros(2*n-1, 1);
for i = 1:n
    t(i) = -lspace(n+1-i);
    t(i+n-1)=lspace(i);
end
[x, y] = meshgrid(t, t);
z = zeros(2*n-1, 2*n-1);
for px=1:2*n-1
    for py=1:2*n-1
        R = sqrt(t(px)^2+t(py)^2);
        if R<=r-1e-6
            z(px, py) = interp1(lspace, sol, R);
        end
    end
end
plot = surf(x, y, z);
%set(plot,'LineStyle','none')



