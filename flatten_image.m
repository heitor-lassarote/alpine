function img = flatten_image(input_img)
    [h w p] = size(input_img);
    w = fix(w / 3);
    imgR = uint8(input_img(:, 0 * w + 1:1 * w));
    imgG = uint8(input_img(:, 1 * w + 1:2 * w));
    imgB = uint8(input_img(:, 2 * w + 1:3 * w));
    img = zeros(h, w, p, "uint8");
    img(:, :, 1) = imgR;
    img(:, :, 2) = imgG;
    img(:, :, 3) = imgB;
end
