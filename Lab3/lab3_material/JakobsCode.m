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



% Ilabel=bwlabel(If);
% F=regionprops(Ilabel, 'Centroid');
% F2 = regionprops(Ilabel,'PixelList');

















% Area = [];
% for j = 1:length(F)
%     A = F(j).Centroid;
%     x = A(1);
%     y = A(2);
%     Lmax = 0;
%     CurrentReg = F2(j).PixelList;
%     sizereg = size(CurrentReg);
%     for k = 1:length(sizereg(2))
%         Cur = CurrentReg(k,:);
%         dx = (x-Cur(1));
%         dy = (y-Cur(2));
%             radi = sqrt((dx)^2+(dy)^2);
%             if radi > Lmax
%                 Lmax = radi;
%             end
%     end
%     Lmax
%     Area = [Area (pi*Lmax^2)];
% end
% 
% figure
% hist(Area)
