clear all
close all

x = linspace(0,24,25);
m = -3;
o = 510;
y = m*x+o+3*randn(1,25);
m2 = -3;
o2 = 230;
y2 = m2*x+o2+5*randn(1,25);

[a,b,sigdat,chi] = regfit(x,y);
hold on
[a2,b2,sigdat2] = regfit(x,y2);

delta_real = o2-o;
delta = a2-a+0.5*(x(25)*(b2-b));
delta2 = a2-a;

