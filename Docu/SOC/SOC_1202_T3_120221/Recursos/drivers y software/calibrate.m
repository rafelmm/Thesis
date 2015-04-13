function [Irec] = calibrate(I,f,c,k)

[nr,nc] = size(I);

Irec = 255*ones(nr,nc);

% Apply the distortion
M=nc*nr;
for m=1:M
    x2(1)=mod(m-1,nc)/f(1)-c(1)/f(1);
    x2(2)=floor((m-1)/nc)/f(2)-c(2)/f(2);
   
    r2=x2(1)^2+x2(2)^2;
    r4=r2^2;
    cdist = 1+k(1)*r2+k(2)*r4;
    a1=2*x2(1)*x2(2);
    
    xd(1)=x2(1)*cdist+k(3)*a1+k(4)*(r2+2*x2(1)^2);
    xd(2)=x2(2)*cdist+k(3)*(r2+2*x2(2)^2)+k(4)*a1;
    
    px2=f(1)*xd(1)+c(1);
    py2=f(2)*xd(2)+c(2);
    
    px_0 = floor(px2);
    py_0 = floor(py2);
    
    if ((px_0 >= 0) && (px_0 <= (nc-2)) && (py_0 >= 0) && (py_0 <= (nr-2))) %Good point
        alpha_x = px2-px_0;
        alpha_y = py2 - py_0;
        
        a1 = (1 - alpha_y)*(1 - alpha_x);
        a2 = (1 - alpha_y)*alpha_x;
        a3 = alpha_y * (1 - alpha_x);
        a4 = alpha_y * alpha_x;
        
        ind_lu = px_0 * nr + py_0 + 1;
        ind_ru = (px_0 + 1) * nr + py_0 + 1;
        ind_ld = px_0 * nr + (py_0 + 1) + 1;
        ind_rd = (px_0 + 1) * nr + (py_0 + 1) + 1;
        
        ind_new = (mod(m-1,nc))*nr+floor((m-1)/nc)+1;
        Irec(ind_new) = a1 * I(ind_lu) + a2 * I(ind_ru) + a3 * I(ind_ld) + a4 * I(ind_rd);
    end
    
end
