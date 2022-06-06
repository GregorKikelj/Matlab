A = zeros(50, 50);
for i=1:50
    A(1, i)=(i/50)^.5;
    A(50, i)=(i/50)^2;
    A(i, 50)=1;
    A(i, 1) = 0;
end
gauss_seidl(A, 1000);
 