function d = odvod(p)
    n = size(p, 1);
    d = zeros(1, n-1);
    for i=1:n-1
        d(i) = (n-i)*p(i);
    end
end