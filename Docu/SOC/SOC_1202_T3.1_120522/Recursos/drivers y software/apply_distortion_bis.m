function [xd] = apply_distortion_bis(x,k)


M=size(x,2);
xd=zeros(2,M);
for m=1:M
    r2=x(1,m)^2+x(2,m)^2;
    r4=r2^2;
    cdist = 1+k(1)*r2+k(2)*r4;
    a1=2*x(1,m)*x(2,m);
    xd(1,m)=x(1,m)*cdist+k(3)*a1+k(4)*(r2+2*x(1,m)^2);
    xd(2,m)=x(2,m)*cdist+k(3)*(r2+2*x(2,m)^2)+k(4)*a1;
end