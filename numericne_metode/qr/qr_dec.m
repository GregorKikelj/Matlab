function [Q, R] = qr_dec(A)
    [m, n] = size(A);
    Q = zeros(m, n);
    R = zeros(n, n);
    for k=1:n
        for j=1:k-1
            R(j, k) = Q(:, j)' * A(:, k);
        end
        vec = A(:, k);
        for j=1:k-1
            vec = vec - Q(:, j) * R(j, k);
        end
        R(k, k) = norm(vec);
        Q(:, k) = vec/norm(vec);
    end
end

