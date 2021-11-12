I = imread('napoleon.png');

figure
imhist(I);

g = 2;
figure
imhist(I);
L = double(I).^g;
out = uint8(L .* (255/max(max(L))));
imhist(out);

g = 1/2;
figure
imhist(I);
L = double(I).^g;
out = uint8(L .* (255/max(max(L))));
imhist(out);
