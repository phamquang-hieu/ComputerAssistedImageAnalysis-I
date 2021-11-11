I = imread('napoleon.png');
Better = myhist(I);
J = histeq(I);
imtool(J)