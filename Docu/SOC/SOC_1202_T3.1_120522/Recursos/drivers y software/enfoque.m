function [powH] = enfoque(image)

%FFT de la image
L = length(image(:));
Fs=100;
NFFT = 2^nextpow2(L);
IFFT=fft(image(:),NFFT)/L;

% f=Fs/2*linspace(0,1,NFFT/2+1);
% close all
% plot(f,2*abs(IFFT(1:NFFT/2+1)))


powH = log10(sum(abs(IFFT(NFFT/4+1:NFFT/2+1))));
