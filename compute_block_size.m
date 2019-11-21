function [size_block_h size_block_w] = compute_block_size(h, w, bh, bw)
    size_block_h = [];
    size_block_w = [];
    
    ch = floor(h / bh);
    cw = floor(w / bw);
    
    if ch > 0
        size_block_h = repmat(bh, 1, ch);
    end
    
    if cw > 0
        size_block_w = repmat(bw, 1, cw);
    end
    
    rh = rem(h, bh);
    rw = rem(w, bw);
    
    if rh > 0
        [h w] = size(size_block_h);
        size_block_h(w + 1) = rh;
    end
    
    if rw > 0
        [h w] = size(size_block_w);
        size_block_w(w + 1) = rw;
    end
end