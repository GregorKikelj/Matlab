function t = curv_bez(b,t)
    d = bezier_der(b, t, 1);
    dd = bezier_der(b, t, 2);
    t = (d(1)*dd(2)-dd(1)*d(2))/ ((d(1)^2+d(2)^2)^(3/2));
end

