function [I] = display_image(data,width,height)
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
imshow(I);
