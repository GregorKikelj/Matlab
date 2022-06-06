format short

H = hilb(10);
A = H(:,1:5)

[Q, R] = qr_dec(A)
sum(Q(:, 1).*Q(:, 5))

