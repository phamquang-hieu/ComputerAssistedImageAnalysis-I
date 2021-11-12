I = imread('brain1.png');
J = imread('brain2.png');
K = imread('brain3.png');

figure
imshow(I)
figure
imshow(J)
figure
imshow(K)

I = double(J)
L = (I+J)/2;

figure
imshow(L)