function y = horner(a, x)
    n = size(a,1);
    y = a(1);
    for i=2:n
        y=x*y+a(i);
    end
end