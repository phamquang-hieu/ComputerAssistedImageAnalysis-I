I = double(imread("freqdist.png"));
f = fftshift(fft2(I));
img = log(abs(f));
picAvg = mean(img, "all");
padded_img = ones(257, 257)*picAvg;
padded_img(1:256, 1:256) = img;
figure(1);
imagesc(padded_img);
filter_1 = notch_filter(257, picAvg, 93, 101, 10);
padded_img = padded_img * filter_1;

figure(1);
imagesc(padded_img);

figure(2);
imagesc(padded_img);





