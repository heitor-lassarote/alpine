function output_block = rle(input_block)
    output_block = {};
    channels = size(input_block);
    ch = channels(3);
    
    for i = 1 : ch
        ib = input_block(:, :, i);
        [count, value] = runlength(ib(:));
        output_block{i} = zip(count, value);
    end
end