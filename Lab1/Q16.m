I = imread('craw.jpg');
I = rgb2gray(I);
imtool(I)
frequenzy = zeros(1,256);
for i = 1:707
    for j = 1:707
        val = I(i,j) + 1;
        frequenzy(val) = frequenzy(val) + 1;
    end
end
plot(0:255,frequenzy,'*')
test = cumsum(frequenzy)/sum(frequenzy)*255;
plot(0:255,test)
for i = 1:707
    for j = 1:707
        val = I(i,j) + 1;
        I(i,j) = round(test(val));
    end
end

imtool(I)