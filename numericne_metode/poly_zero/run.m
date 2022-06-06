format compact

% (x-2)^2*(x-3)=x^3-x^2-8x+12
coeffs = [1, -1, -8, 12];

n = size(coeffs, 2)-1;
Cp = zeros(n);

for i=1:n-1
 Cp(i, i+1)=1;
end

for i=1:n
 Cp(n, i) = -coeffs(n+2-i)/coeffs(1);
end

Cp
poly(Cp)
eig(Cp)

