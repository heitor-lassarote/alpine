function blocks = iflatten_blocks(data, size_block_h, size_block_w)
    output_data = [];
    
    for i = 1:length(blocks)
        b = blocks{i};
        channels = size(b)(2);
        
        for j = 1:channels
             c = cell2mat(b(j));
             
             sz = size(c);
             c = reshape(c', sz(1) * sz(2), 1)';
             
             output_data = [output_data 0 0 c];
        end
    end
end