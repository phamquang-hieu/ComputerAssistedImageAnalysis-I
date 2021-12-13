function res = uniformity_entropy(img, offSet)
    coMat = graycomatrix(img, "Offset", offSet, "GrayLimits", [], "NumLevels", 256);
    coMat = coMat/sum(coMat, "all");
    coMatSize = size(coMat);
    uniformity = 0;
    entropy = 0;
    for i=1:(coMatSize(1))
        for j=1:(coMatSize(2))
            if (coMat(i, j) ~= 0)
                entropy = entropy - coMat(i, j)*log2(coMat(i, j));
                uniformity = uniformity + coMat(i, j).^2;
            end
        end
    end
    res = [uniformity entropy];
end

