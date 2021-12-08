function res = highpass(img, radius)
    height = size(img, 1);
    width = size(img, 2);
   
    res = img;
    if rem(height, 2) == 0
       res = padarray(res, [1, 0], 'circular', 'post');
    end
   
    if rem(width, 2) == 0 
       res = padarray(res, [0, 1], 'circular', 'post');
    end

    center = [int64(size(res, 1)/2), int64(size(res, 2)/2)];
    
    
    rangeX = center(1)-radius: center(1) + radius;
    rangeY = center(2) - radius: center(2) + radius;
    centerRegion = img(rangeX, rangeY);
    meanCenter = mean(centerRegion, "all");
    for x = rangeX
        for y = rangeY 
            if (x-center(1))^2 + (y-center(2))^2 < radius^2
                res(x, y) = meanCenter;
            end
        end
    end
    
end