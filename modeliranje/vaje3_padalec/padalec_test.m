% vhodni podatki
m = 105;
c = 1;
S = 1.2;
zac = [40000;0];
t_konec = 10;
n = 10000;

[y,v,t] = padalec([m, c, S],zac,t_konec,n);

plot(t, v)

