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


if calibra == 1
    % Transformación intensidad
    I=imadjust(I,[0.3 0.6],[0 1]);

    % Compensación de los parametros de la camara
    kc=[-0.0866;-5.6139;-0.0643;-0.0056;0];
    fc = [494;1901.7];
    cc = [65.4378;186.9055];
    alpha_c=90;
    %KK_new = [fc(1) alpha_c*fc(1) cc(1);0 fc(2) cc(2);0 0 1];

    [I] = calibrate(I,fc,cc,kc);
    
    % Filtrado imagen para eliminación puntos negros y blancos
    se=[1 1;1 1];
    I=imclose(I,se);    
    I=imopen(I,se);

    %indice_enfoque = enfoque(I);
    %indice_enfoque = pseudo_enfoque(I);

end

close all
imshow(I);
%title([fileName ' e=' num2str(indice_enfoque)]);% ' pse=' num2str(indice_pseudo_enfoque)]);
