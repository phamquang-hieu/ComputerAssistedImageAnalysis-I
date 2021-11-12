I = imread('napoleon.png');
J = imread('napoleon_dark.png');
K = imread('napoleon_light.png');

X = histeq(I);
Y = histeq(J);
Z = histeq(K);

figure
hist = histogram(I);
x = 1:255;
a = histogram(I(:),255,'Normalization','cdf');
figure
hist = histogram(J);
x = 1:255;
a = histogram(J(:),255,'Normalization','cdf');
figure
hist = histogram(K);
x = 1:255;
a = histogram(K(:),255,'Normalization','cdf');