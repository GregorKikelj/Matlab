function [p, a] = vander_interp(x, y)
    %vrne funkcijo in koeficiente
    
    V = fliplr(vander(x));
    a = V\y;
    p = @(x) a(1)+a(2)*x+a(3)*(x.^2)+a(4)*(x.^3)+a(5)*(x.^4);
end

