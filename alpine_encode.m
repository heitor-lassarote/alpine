function rle_blocks = alpine_encode(input_img, quality)
    pkg load image          % rgb2ycbcr
    pkg load signal         % dct2, idct2
    pkg load communications % dpcmenco, huffmandict, huffmanenco 
    
    cellfunnu = @(f, c) cellfun(f, c, "UniformOutput", false);
    
    threshold = 101 - quality;
    
    [h w p] = size(input_img);
    
    img = chroma_subsampling(input_img);
    img = int8(img) - 128;
    
    size_block_h = [repmat(8, 1, h / 8) rem(h, 8)];
    size_block_w = [repmat(8, 1, w / 8) rem(w, 8)];
    
    blocks = mat2cell(img, size_block_h, size_block_w);
    dcts = cellfunnu(@(b) dct2(b), blocks);
    thresholds = cellfunnu(@(b) min(255, round(b ./ threshold) .* threshold), dcts);
    zigzag_blocks = cellfunnu(@(b) zigzag(b), thresholds);
    rle_blocks = cellfunnu(@(b) rle(b), zigzag_blocks);
    
    %idcts = cellfunnu(@(b) flatten_image(idct2(b)), rle_blocks);
    %img = cell2mat(idcts);
end
