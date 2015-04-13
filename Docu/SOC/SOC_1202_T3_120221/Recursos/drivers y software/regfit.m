
function [a,b,sigdat,chi2]=regfit(x,y)

plot(x,y,'.');

btmp = 0;
sx = 0;
sy = 0;
for i=0:length(x)-1
    sx = sx + x(i+1);
    sy = sy + y(i+1);
end
ss = length(x);
sxoss = sx/ss;
st2 = 0;
for i=0:length(x)-1
    t = x(i+1)-sxoss;
    st2 = st2 + t*t;
    btmp = btmp + t*y(i+1);
end

b = btmp/st2;
a = (sy-sx*b)/ss;
    
siga=sqrt((1+sx*sx/(ss*st2))/ss);
sigb=sqrt(1/st2);
chi2=0;
for i=0:length(x)-1
    chi2 = chi2 + (y(i+1)-a-b*x(i+1))^2;
end

sigdat = sqrt(chi2/(length(x)-2));
siga = siga*sigdat;
sigb = sigb*sigdat;

hold on
plot(x,b*x+a,'r')
hold off
