I = imread('wagon_shot_noise.png');
imtool(I)
L = uint8(mean2(I) * ones([262 396]));
L(2:261,2:395) = I;
Inew = zeros([260 394]);
for i = 2:261
    for j = 2:395
        B = L(i-1:i+1,j-1:j+1);
        Inew(i-1,j-1) = round(median(B,'all'));
    end
end

Inew = single(Inew);
imtool(Inew/255)