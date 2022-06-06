function [y,v,t] = padalec(parametri,zac,tk,n)
% function [y,v,t] = padalec(parametri,zac,tk,n)
% 
% Simulacija vertikalnega padanja padalca v odvisnosti od zacetne hitrosti
% in zracnega upora.
%
% Vhod:
% parametri = [m,c,S], m je masa, c je koeficient upora (prib. 1 za
% obicajen skok in skakalca), S presek padalca pravokotno na smer padanja
% zac = [y0;v0] sta zacetna visina in zacetna hitrost
% tk je koncni cas, do katerega gledamo padanje (pred odprtjem padala!!!)
% n je stevilo enakomerno razporejenih casovnih trenutkov opazovanja
%
%
% Izhod:
% y so visine padalca ob casih t (vektor dolzine n)
% v so hitrosti padalca ob casih t (vektor dolzine n)
% t je vektor casovnih trenutkov

t = linspace(0,tk,n);
dY = @(t,Y) diferencialniSistem(t,Y,parametri);
[~,Yres] = ode45(dY,t,zac);

% visine in hitrosti padalca
y = Yres(:,1);
v = Yres(:,2);

function dY = diferencialniSistem(t,Y,parametri)
% function dY = diferencialniSistem(t,Y,parametri)
% 
% Opisuje sistem dif. enacb za padalca pri navpicnem padu.
%
% Vhod:
% t je cas, Y = [y1;y2]
% Prva komponenta Y(1) predstavlja visino.
% Druga komponenta Y(2) predstavlja hitrost.
% parametri = [m,c,S]
% 
% Izhod:
% dY je sistem NDE, vrnemo desno stran sistema dY = F(t,Y)

ro = @(y) 1.225;
g = @(y) 9.81;



m = parametri(1);
c = parametri(2);
S = parametri(3);

% Opomba: Ce je hitrost pozitivna, je sila upora negativna in obratno.
%         Zato namesto y(2).^2 uporabimo -abs(y(2)).*y(2).
dY = [Y(2); -g(Y(1))-(1/2*ro(Y(1))*c*S)/m*abs(Y(2)).*Y(2)];
end

end

% aproksimacija s polinomom
function koef = mnk()

    x = [0:2000:10000, 15000, 20000, 25000, 30000, 40000]';
    y = [1.225 1.007 0.8194 0.6601 0.5258 0.4135 0.1948 0.08891 0.04008 0.01841 0.003996]';
    
    f1 = @(h) ones(size(h));
    f2 = @(h) ((h - 40000)/40000).^2;
    f3 = @(h) ((h - 40000)/40000).^4;
    
    A = [f1(x) f2(x) f3(x)];
    koef = A\y;

end



