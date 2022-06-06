format compact
U = [4, 2, 5; 0, 3, 4; 0, 0, 2];
U
D = zeros(3);
M = zeros(3);
for i=1:3
    D(i,i)=U(i,i);
    M(i, :) = U(i, :)/D(i,i);
end
D
M
D*M
% tested that upper triangular matrix is actually a product of a diagonal
% and upper triangular with a diagonal of ones. 

