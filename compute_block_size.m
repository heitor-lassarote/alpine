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
        size_block_h(size(size_block_h) + 1) = rh;
    end
    
    if rw > 0
        size_block_w(size(size_block_w) + 1) = rw;
    end
end