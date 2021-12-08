i = imread("coins.tif");

is = imfilter(i, fspecial('average', [40 40]));
i = i+is;

i =  im2bw(i, 0.95);
i = medfilt2(i);

D = bwdist(i, "chessboard");
D = -D;

figure(1)
imshow(mat2gray(D));

fun = watershed(D);
fun(i) = 0;

rgb = label2rgb(fun, 'jet',[.5 .5 .5]);

figure(2)
imshow(rgb)
title('Watershed Transform')

Ilabel= bwlabel(fun,8);
F = regionprops(Ilabel, 'Area');
figure(3)

% figure(3)
% imshow(label2rgb(Ilabel, 'spring'));




% 
% figure(2)
% imshow(i);
% 
% I = im2bw(i,0.95);
% figure(3)
% imshow(I);
% 
% Idist = -bwdist(i);
% 
% If = watershed(I);
% If(Idist) = 0;
% 
% figure(4)
% imshow(Idist);

% figure
% imshow(i)

% iTransfromed = fftshift(fft2(i));
% iTransfromed = highpass(iTransfromed, 5);
% iRevert = ifft2(ifftshift(iTransfromed));
% 
% figure(1)
% imshow(med)
% 
% figure(2)
% imshow(edge)
% 
% figure(3)
% imshow(i)
% 
% figure(4)
% imshow(iRevert)

