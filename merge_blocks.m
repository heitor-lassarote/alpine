function img = merge_blocks(block)
    y  = block{1};
    cb = block{2};
    cr = block{3};
    img = cat(3, y, cb, cr);
end
