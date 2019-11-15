function img = chroma_subsampling(input_img, scaling=0.5)
    img = rgb2ycbcr(input_img);
    y  = img(:, :, 1);
    cb = img(:, :, 2);
    cr = img(:, :, 3);
    cb_reduced = imresize(cb, scaling, 'bicubic');
    cr_reduced = imresize(cr, scaling, 'bicubic');
    cb_enlarged = imresize(cb_reduced, 1.0 / scaling, 'bicubic');
    cr_enlarged = imresize(cr_reduced, 1.0 / scaling, 'bicubic');
    img = cat(3, y, cb_enlarged, cr_enlarged);
end
