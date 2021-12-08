i = imread("bacteria.tif");

figure(1)
imshow(i)

% background correction
I_max = ordfilt2(i, 9, ones(3,3));
I_min = ordfilt2(i, 1, ones(3,3));
I = I_max - I_min;

figure(2)
imshow(I)

% removing noise after bg correction 

I = medfilt2(I,[5 5],'symmetric');

% transform to binary image
I = im2bw(i,0.3);

figure(3)
imshow(I)

% watershred segmentation
If = watershed(I);
If(I) = 0;

rgb = label2rgb(If,'jet',[.5 .5 .5]);

figure
imshow(rgb)
title('Watershed Transform')
