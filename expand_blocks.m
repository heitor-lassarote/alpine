function output_data = expand_blocks(blocks)
    output_data = [];
    
    for i = 1:length(blocks)
        b = blocks{i};
        channels = size(b)(2);
        
        for j = 1:channels
             c = cell2mat(b(j));
             c = int32(reshape(c', 1, numel(c)));
             c = dec2bin(typecast(c, 'uint32'));
             
             output_data = [output_data ; c];
        end
    end
end