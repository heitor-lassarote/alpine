function rle_zip = rle(v)
    [h w] = size(v);
    if w == 0
        rle_zip = [];
    else
        [count, value] = runlength(v);
        rle_zip = zip(count, value);
    end
end
