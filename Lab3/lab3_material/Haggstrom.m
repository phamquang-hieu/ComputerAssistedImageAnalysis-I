i = imread("coins.tif");
figure
imshow(255./i)
is = imfilter(i, fspecial('average', [15 15]));
i2 = i+is;
imshow(i2)
I = im2bw(i,0.4);
figure
imshow(I)
I = medfilt2(I,[5 5],'symmetric');
figure
imshow(I)
Idist=bwdist(I);
figure
imshow(Idist,[]);
maxima = imextendedmax(Idist, 1, 8);
figure
imshow(maxima)
If = watershed(Idist);
If(I) = 0;
rgb = label2rgb(If,'jet',[.5 .5 .5]);
figure
imshow(rgb)
title('Watershed Transform')
Ilabel=bwlabel(If);
Ilabel2 =bwlabel(maxima);

F=regionprops(Ilabel, 'Area');
F2=regionprops(Ilabel2, 'PixelList');

areas = zeros(length(F2),1);

for j = 1:length(F2)
    tempF2 = F2(j).PixelList;
    radius = max(Idist(tempF2));
    areas(j) = radius^2 * pi;
end
    