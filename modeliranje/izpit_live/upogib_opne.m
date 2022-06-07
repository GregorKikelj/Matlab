function [u, r] = upogib_opne(f,R,n)
% upogib_opne racuna obliko prereza opne, napete na krozno zanko
% u je vektor priblizkov za resitev
% r je delitev v radialni smeri
% f je desna stran enacbe u''+1/r u' = f(r)
% R je radij krozne zanke
% n je stevilo delilnih intervalov (indeksi: 0,1,2,...,n)

    r = linspace(0, R, n)';
    u = zeros(n,1);
    fi = arrayfun(f, r);
    s = zeros(n, n);
    h = R/n;
    for i=2:n-1
        s(i, i-1) = 1-h/(2*r(i));
        s(i, i) = -2;
        s(i, i+1) = 1+h/(2*r(i));
    end
    s(1, 1) = -2;
    s(1, 2) = 2;
    s(n, n-1) = 1-h/(2*r(n));
    s(n,n) = -2;
    u = h^2*(s\fi);
end