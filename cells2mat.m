function mat = cells2mat(cells, size_block_h, size_block_w)
    [~, h] = size(size_block_h);
    [~, w] = size(size_block_w);
    mat = cell2mat(reshape(cells, h, w));
end
