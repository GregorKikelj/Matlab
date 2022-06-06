function x = least_sq_chol(A, b)
    %Solves for x s.t. |Ax-b| is min.
    n = size(A, 2);

    l = A'*A;
    r = A'*b;
    %l*x=r
    
    V = chol(l)';
    %V*V'*x=r

    %1.) V*y=r
    y = zeros(n, 1);
    for i=1:n
        rem = V(i, 1:i-1)*y(1:i-1);
        y(i) = (r(i)-rem)/V(i, i);
    end
    U=V';
    %2.) V'*x=y
    x = zeros(n, 1);
    for i=1:n
        rem = U(n+1-i, n+1-i:n)*x(n+1-i:n);
        x(n+1-i) = (y(n+1-i)-rem)/U(n+1-i, n+1-i);
    end
    


end

