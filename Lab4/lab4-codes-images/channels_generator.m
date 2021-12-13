function res = channels_generator(img, Csize)
    combos = combntns(1:length(img(0, 0,:)),Csize);
    res = [];
    for i= length(combos)
        res = [res img(:, :, combos(i))];
    end
end