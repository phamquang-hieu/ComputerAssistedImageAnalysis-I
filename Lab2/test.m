I = imread("cameraman.png");

sizes = [3 3; 7 7; 31 31];
h = fspecial('average', sizes(1));
h_1 = fspecial('sobel');

I_final = imfilter(I, h);