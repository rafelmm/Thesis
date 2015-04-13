function [Iout]=erosion(Iin,B)
%EROSION: function that computes an erosion
%
% iout=erosion(Iin,B) It applies an erosion to Iin with the
%                     structuring element B.
%                     The structuring element B is a flat vector or
%                     matrix, all the elements are 1. Dimensions of
%                     the structuring element must be odd.
%
% erosion(Iin, B)     Shows directly the result
if (nargin~=2)
    error 'Input arguments are the image Iin and the structuring element B'
end

Bw = size(B,2);
Bh = size(B,1);
if (mod(Bw,2)==0 || mod(Bh,2)==0)
    error 'Dimensions of structuring element must be odd'
end

W=size(Iin,2);
H=size(Iin,1);

Iout = zeros(size(Iin));

B=-256*(B-1);
for m=1:H
    for n=1:W
        k=1;
        tmp = 256*ones(Bh*Bw,1);
        for i=m-floor(Bh/2):m+floor(Bh/2)
            for j=n-floor(Bw/2):n+floor(Bw/2)
                if(i>0 && j>0 && i<=H && j<=W)
                    tmp(k) = Iin(i,j)+B(i+1-m+floor(Bh/2),j+1-n+floor(Bw/2));
                    k=k+1;
                end
            end
        end
        Iout(m,n)=min(tmp);
    end
end

if (nargout==0)
    close all
    subplot(1,2,1)
    imshow(Iin);
    title('Original image')
    subplot(1,2,2)
    axis off
    imshow(Iout);
    title('Erosion')
    axis off
end
