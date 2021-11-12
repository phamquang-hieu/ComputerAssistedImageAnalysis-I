function out = myhist(I)
%I = rgb2gray(I);
imtool(I)
sizeim = size(I);
frequenzy = zeros(1,256);
for i = 1:sizeim(1)
    for j = 1:sizeim(2)
        val = I(i,j) + 1;
        frequenzy(val) = frequenzy(val) + 1;
    end
end
plot(0:255,frequenzy,'*')
test = cumsum(frequenzy)/sum(frequenzy)*255;
plot(0:255,test)
for i = 1:sizeim(1)
    for j = 1:sizeim(2)
        val = I(i,j) + 1;
        I(i,j) = round(test(val));
    end
end
imtool(I)
out = I;
end