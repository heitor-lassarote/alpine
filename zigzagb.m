function output_block = zigzagb(input_block)
    output_block = [];
    block_size = size(input_block);
    
    for i = 1 : block_size(3)
        output_block(:, :, i) = reshape(zigzag(input_block(:, :, i)), block_size(1:2));
    end
end
