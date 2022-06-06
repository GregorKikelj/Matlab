function A = blocna(n)
    I = eye(n);
    T = -4*diag(ones(n,1)) + diag(ones(n-1,1),1) + diag(ones(n-1,1),-1);
    modT = eye(n);
    modI = diag(ones(n-1,1),1)+diag(ones(n-1,1),-1);
    A = kron(modT, T) + kron(modI, I);
end

