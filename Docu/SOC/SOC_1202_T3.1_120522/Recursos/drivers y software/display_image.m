function [I,indice_enfoque] = display_image(fileName,data,width,height,calibra)
L = width*height;
j=1;

I=zeros(1,L);
if (size(data,1)<L)
    for i=1:L
        if(data(j,1)==i-1)
            if(data(j,2)<255)
                I(i)=data(j,2);
            else
                if(j>1)
                    I(i)=data(j-1,2);
                else
                    I(i)=data(j+1,2);
                end
            end
            j=j+1;
        else
            if(j>1)
                I(i)=I(i-1);
            else
                I(i)=I(i+1);
            end
        end
    end
else
    I=data(:,2);
end


I=I(1:L);
for i=1:height
    for j=1:width
        img(i,j)=I((i-1)*width+j)/255;
    end
end
I=img;

% Transformación intensidad
I=imadjust(I,[0.3 0.6],[0 1]);

if calibra == 1
    % Compensación de los parametros de la camara
    kc=[-0.3955;0.2070;-0.0104;0.0055;0];
    fc = [144.25;144.2833];
    cc = [72.8881;59.9752];
    alpha_c=0;
    %KK_new = [fc(1) alpha_c*fc(1) cc(1);0 fc(2) cc(2);0 0 1];

    [I] = calibrate(I,fc,cc,kc);
end

% Filtrado imagen para eliminación puntos negros y blancos
se=[1 1;1 1];
I=imclose(I,se);
I=imopen(I,se);

%indice_enfoque = enfoque(I);
indice_enfoque = pseudo_enfoque(I);

%   close all
imshow(I);
title([fileName ' e=' num2str(indice_enfoque)]);% ' pse=' num2str(indice_pseudo_enfoque)]);
