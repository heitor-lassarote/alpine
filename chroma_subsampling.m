function img = chroma_subsampling(input_img)
    if nargin == 1
        scaling = 0.5;
    end
    
    img = rgb2ycbcr(input_img);
    y  = img(:, :, 1);
    cb = img(:, :, 2);
    cr = img(:, :, 3);
    cb_reduced = imresize(cb, scaling, 'nearest');
    cr_reduced = imresize(cr, scaling, 'nearest');
    cb_enlarged = imresize(cb_reduced, 1.0 / scaling, 'nearest');
    cr_enlarged = imresize(cr_reduced, 1.0 / scaling, 'nearest');
    %cb_enlarged = cb;
    %cr_enlarged = cr;
    img = cat(3, y, cb_enlarged, cr_enlarged);
end
