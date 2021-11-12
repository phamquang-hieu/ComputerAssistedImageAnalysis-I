I = imread('craw.jpg');
J = rgb2gray(I);
K = imresize(J,[128 128]);
L = uint8(mean2(J) * ones(132));
L(3:130,3:130) = K;
% imtool(L)
Inew = zeros(128);
for i = 3:130
    for j = 3:130
        B = L(i-2:i+2,j-2:j+2);
        Inew(i-2,j-2) = round(mean(B,'all'));
    end
end

Inew = single(Inew);
imtool(Inew/255)

I_final = single((Inew - single(K)) / 255);

I6 = single(-(Inew - single(K)) / 255);

imtool(I_final)


