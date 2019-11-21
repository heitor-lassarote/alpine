function output = dct2_channels(input)
    [h c p] = size(input);
    output = zeros(h, c, p);
    for i = 1:p
        output(:, :, i) = dct2(input(:, :, i));
    end
end
