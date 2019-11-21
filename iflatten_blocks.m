function blocks = iflatten_blocks(data, size_block_h, size_block_w, channels)
    [~, d_size] = size(data);
    
    sz0 = size(size_block_h);
    sz1 = size(size_block_w);
    
    size_h = sz0(2) * sz1(2);
    
    current_channel = 0;
    blocks = {};
    was_end = 0;
    for i = 1:2:d_size
        c = data(i);
        v = data(i + 1);
        
        if c == 0
            current_channel = current_channel + 1;
            was_end = 1;
            blocks{current_channel} = {[v]};
            current_channel = current_channel + 1;
        else
            if was_end
                blocks{current_channel} = {[c v]};
                was_end = 0;
            else
                blocks{current_channel} = {[cell2mat(blocks{current_channel}) c v]};
            end
        end
    end
    
    channels = channels * 2;
    for i = 1:channels * size_h
        blocks{i} = blocks{i}{1};
    end
    
    blocks_ = {};
    j = 1;
    for i = 1:channels:channels * size_h
        blocks_(j) = {blocks(i:i + channels - 1)};
        j = j + 1;
    end
    
    blocks = blocks_;
end
