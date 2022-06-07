format long
%format short
format compact
c=41;
n=21+2*mod(c, 21);
%n=61
%n=n-n+10;
f = @(x) (x<=0)*(x+1+c/100) + (x>0)*(-x+1+c/100);
%f = @(x) 1;

x = linspace(-1, 1, n+2);
y = arrayfun(f, x);
hold off;
hold on;
plot(x, y);

h=2/(n+1);

xmid = x(2:n+1)';
b = arrayfun(f, xmid);

A = zeros(n, n);

A(1,1)=-20;
A(1,2)=6;
A(1,3)=4;
A(1,4)=-1;

A(2,1)=16;
A(2,2)=-30;
A(2,3)=16;
A(2,4)=-1;

for i=3:n-2
    A(i, i-2)=-1;
    A(i, i-1)=16;
    A(i, i)=-30;
    A(i, i+1)=16;
    A(i, i+2)=-1;
end

A(n-1, n-3)=-1;
A(n-1, n-2)=16;
A(n-1, n-1)=-30;
A(n-1, n)=16;

A(n, n-3)=-1;
A(n, n-2)=4;
A(n, n-1)=6;
A(n, n)=-20;


A=A/(12*h^2);
norm(A, 'fro')
u = A\b;

u;
plot(xmid, u);
u(31)










