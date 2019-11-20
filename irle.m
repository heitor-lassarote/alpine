function output_block = irle(input_block)
    output_block = {};
    channels = size(input_block)(3);
    
    for i = 1 : channels
        [count, value] = runlength(input_block(:, :, i)(:));
        output_block(i) = zip(count, value);
    end
end