function output_block = izigzagb(input_block, size_block_h, size_block_w)
    [a b] = meshgrid(size_block_w, size_block_h);
    m = [a(:) b(:)];
    h = m(input_block{2}{1}, :)(1);
    w = m(input_block{2}{1}, :)(2);
    if h == w
        output_block = cellfun(@(c) izigzag(c, w, h)', input_block{1}, "UniformOutput", false);
    else
        output_block = cellfun(@(c) izigzag(c, w, h), input_block{1}, "UniformOutput", false);
    end
end
