format long
%format short
format compact

T0 = [1.00; 5.75];
T1 = [6.65; 3.5];
b1 = [1.00; 4.75];
d = 0.355964228003948;
n = sqrt(1+d^2);
x2=T1(1)-1/n;
y2=T1(2)-d/n;
bC = [1.00, 1.00, x2, 6.65; 5.75, 4.75, y2, 3.5];
bC;
plotBezier(bC, 100, true);
%bezier_der(bC, 1, 1);

g=9.81;

N=1000;
[px, py] = risi_brah(T0, T1, N);
[px; py]';

%(py(N-1)-py(N))/(px(N-1)-px(N))

t = deCasteljau(bC, 0.5)
sqrt(t(1)^2+t(2)^2)




