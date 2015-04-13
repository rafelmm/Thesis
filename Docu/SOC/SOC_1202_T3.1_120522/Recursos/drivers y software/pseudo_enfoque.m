function [indice] = pseudo_enfoque(image)

M = length(image(:));

kini = floor(M/4);
kfin = floor(M/2);
indice = 0;

for k=kini:kfin
    indice_re = 0;
    indice_im = 0;
    for m=1:M
        indice_re = indice_re + image(m)*cos(2*pi*m*k/M);
        indice_im = indice_im + image(m)*sin(2*pi*m*k/M);
    end
    indice = indice + abs(indice_re)+abs(indice_im);
end

indice = log10(indice);