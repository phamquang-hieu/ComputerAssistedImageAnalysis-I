im = double(imread('cameraman.png'));
imagesc(im)
pad = zeros(257);
pad(1:256, 1:256) = im;
f = fftshift(fft2(pad));
figure; imagesc(log(abs(f)));
radi = 50;
thesize = size(f);
center = [round(thesize(1)/2) round(thesize(1)/2)];

for i = 1:thesize(1)
    for j = 1:thesize(2)
        if sqrt((i-center(1))^2 + (j-center(2))^2) > radi
            f(i,j) = 0;
        end
    end
end

figure; imagesc(log(abs(f)));
g = ifft2(ifftshift(f));
figure; imagesc(g/255)