I = imread('wagon_shot_noise.png');

L = uint8(mean2(I) * ones(132));
L(3:262,3:396) = I;
% imtool(L)
Inew = zeros(128);
for i = 3:260
    for j = 3:394
        B = L(i-2:i+2,j-2:j+2);
        Inew(i-2,j-2) = round(median(B,'all'));
    end
end

Inew = single(Inew);
imtool(Inew/255)