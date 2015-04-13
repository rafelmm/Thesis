B = eye(5);
close all
figure
subplot(1,3,1)
SI00 = read_image('SI00.txt',25,125,1);
subplot(1,3,2)
SI00bin = read_image('SI00bin.txt',25,125,2);

Iclose = dilation(SI00bin,B);
Iclose = erosion(Iclose,B);
Iopen = erosion(Iclose,B);
Iopen = dilation(Iopen,B);
subplot(1,3,3)
imshow(Iopen)

title('SI00')


figure
subplot(1,3,1)
SD00 = read_image('SD00.txt',25,125,1);
subplot(1,3,2)
SD00bin = read_image('SD00bin.txt',25,125,2);

Iclose = dilation(SD00bin,B);
Iclose = erosion(Iclose,B);
Iopen = erosion(Iclose,B);
Iopen = dilation(Iopen,B);
subplot(1,3,3)
imshow(Iopen)

title('SD00')

figure
subplot(1,3,1)
SI01 = read_image('SI01.txt',25,125,1);
subplot(1,3,2)
SI01bin = read_image('SI01bin.txt',25,125,2);

Iclose = dilation(SI01bin,B);
Iclose = erosion(Iclose,B);
Iopen = erosion(Iclose,B);
Iopen = dilation(Iopen,B);
subplot(1,3,3)
imshow(Iopen)

title('SI01')

figure
subplot(1,3,1)
SD01 = read_image('SD01.txt',25,125,1);
subplot(1,3,2)
SD01bin = read_image('SD01bin.txt',25,125,2);

Iclose = dilation(SD01bin,B);
Iclose = erosion(Iclose,B);
Iopen = erosion(Iclose,B);
Iopen = dilation(Iopen,B);
subplot(1,3,3)
imshow(Iopen)
title('SD01')

figure
subplot(1,3,1)
SI02 = read_image('SI02.txt',25,125,1);
subplot(1,3,2)
SI02bin = read_image('SI02bin.txt',25,125,2);
Iclose = dilation(SI02bin,B);
Iclose = erosion(Iclose,B);
Iopen = erosion(Iclose,B);
Iopen = dilation(Iopen,B);
subplot(1,3,3)
imshow(Iopen)
imwrite(Iopen,'SI02bin.png')
title('SI02')

figure
subplot(1,3,1)
SD02 = read_image('SD02.txt',25,125,1);
subplot(1,3,2)
SD02bin = read_image('SD02bin.txt',25,125,2);
Iclose = dilation(SD02bin,B);
Iclose = erosion(Iclose,B);
Iopen = erosion(Iclose,B);
Iopen = dilation(Iopen,B);
subplot(1,3,3)
imshow(Iopen)
title('SD02')
