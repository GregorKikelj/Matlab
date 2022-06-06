function [X, Y] = iteracija(f, f_it, x0, n)
% iteracija po x_n+1=f_it(x_n). f je za debugganje samo. 
    X = zeros(1, n);
    Y = zeros(1, n);
    for i=1:n
        if abs(x0) > 10
            X = X(1, 1:i-1);
            Y = Y(1, 1:i-1);
            return
        end
        X(i)=x0;
        Y(i)=f(x0);
        x0 = f_it(x0);
    end
end

