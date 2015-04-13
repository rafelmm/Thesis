close all
clear all

x = 0:255;

ini_compression = 100;
fin_compression = 150;
y(1:ini_compression-1)=x(1:ini_compression-1);
m = (255-ini_compression-1)/(fin_compression-ini_compression-1);
b = (ini_compression-1)*(1-(255-ini_compression-1)/(fin_compression-ini_compression-1));

y(ini_compression:fin_compression)=m*x(ini_compression:fin_compression)+b;

y(fin_compression:256)=255;


plot(x,y)
grid on


