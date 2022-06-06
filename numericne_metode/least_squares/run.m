format compact

A = [1 0 0;
     0 1 0;
     0 0 1;
     -1 1 0;
     -1 0 1;
      0 -1 1];

A'*b 

b = [620; 970; 1107; 349; 492; 135];

x = least_sq_chol(A, b)

norm(A*x-b)

x = A\b

