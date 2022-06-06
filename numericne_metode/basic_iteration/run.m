format compact
f = @(x) x^3-5*x+1;

x = linspace(-3, 3, 1000);
y = zeros(1, 1000);
for i = 1:1000
    y(1, i)=f(x(1, i));
end

f_it = @(x) (x.^3+1)/5;
[xi, yi] = iteracija(f, f_it, 1, 10);
clf;
hold on
plot(x, y)
plot(x, zeros(1, 1000))
plot(xi, yi)
hold off
