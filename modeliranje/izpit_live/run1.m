format long
%format short
format compact

R = 2.00;
f=@(r) 1.97-r;

[lspace, u] = poves_opne(f, R, 40)
u(20)+2.6
u(21)+2.6