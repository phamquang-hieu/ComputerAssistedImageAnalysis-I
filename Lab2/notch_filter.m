function res = notch_filter(picSize, picAvg, notchCenterX, notchCenterY, notchSize)
    %picSize should be odd
    res  = ones(picSize);
    rangeX = notchCenterX - notchSize: notchCenterX + notchSize;
    rangeY = notchCenterY - notchSize: notchCenterY + notchSize;
    for x = rangeX
        for y = rangeY
            if (x - notchCenterX)^2 + (y - notchCenterY)^2 < notchSize^2
                res(x, y) = 0;
                res(picSize-x, picSize -y) = picAvg;
            end
        end
    end

end
    