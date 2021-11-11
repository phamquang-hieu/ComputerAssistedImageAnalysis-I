I = imread('wrench.png');

tic()
J = imrotate(I,20);
toc()
tic()
K = imrotate(I,45);
toc()
tic()
L = imrotate(I,90);
toc()