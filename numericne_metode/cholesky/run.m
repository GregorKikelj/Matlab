A = [1 3 4; 2 2 1; 5 6 6; 1 4 9; 1 0 0; 0 1 0; 0 0 1]
spd = A'*A

V = cholesky(spd)
V*V'