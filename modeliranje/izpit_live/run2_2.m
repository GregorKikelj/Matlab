format long
%format short
format compact

A = [0.04, 1];
B = [3.5, 0.03];
l = 5.55;

w = risi_ver(A, B, l, 1e-15);

xmin = fminbnd(w, 0.04 ,3.5)
ymin = w(xmin)

for n=1:200
    W0 = [-1, -1];
    ans = ver_uv(W0, [0.04 3.5; 1 0.03], ones(1, n)*(l/n), ones(1, n))
    
    mDist = 10000;
    lowest = 100;
    for i=1:size(ans, 2)
        xa = ans(1, i);
        ya = ans(2, i);
        if ya<lowest
            lowest = ya;
            mDist = sqrt((xa-xmin)^2+(ya-ymin)^2);
        end
    end
    mDist
    if mDist<2*1e-3
        n
        break
    end
end


