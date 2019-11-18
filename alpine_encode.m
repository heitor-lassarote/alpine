function raw_format = alpine_encode(input_img, quality = 100)
    pkg load image          % rgb2ycbcr
    pkg load signal         % dct2, idct2
    pkg load miscellaneous  % zigzag
    pkg load communications % dpcmenco, huffmandict, huffmanenco
    
    forelement = @(f, c) arrayfun(f, c);
    forcell = @(f, c) cellfun(f, c, "UniformOutput", false);
    
    [h w p] = size(input_img);
    
    img = chroma_subsampling(input_img);
    img = int8(img) - 128;
    
    [size_block_h size_block_w] = compute_block_size(h, w, 8, 8);
    
    blocks = mat2cell(img, size_block_h, size_block_w);
    dcts = forcell(@(b) forelement(@(a) dct2(a), b), blocks);
    thresholds = forcell(@(b) forelement(@(a) qconvolution(a, quality), b), dcts);
    zigzag_blocks = forcell(@(b) zigzagb(b), thresholds);
    rle_blocks = forcell(@(b) rle(b), zigzag_blocks);
    data = expand_blocks(rle_blocks)
    %[symbols, probabilities] = collapse_symbols(data);
    %dict = huffmandict(symbols, probabilities);
    %encoded_data = huffmanenco(data, dict);
    %raw_format = { [h w p], dict, encoded_data };
    
    %idcts = forcell(@(b) flatten_image(idct2(b)), rle_blocks);
    %img = cell2mat(idcts);
end