% https://github.com/lostpfg/Huffman-Matlab

function output_img = alpine_decode(raw_format)
    pkg load image          % rgb2ycbcr
    pkg load signal         % dct2, idct2
    pkg load miscellaneous  % zigzag
    pkg load communications % dpcmenco, huffmandict, huffmanenco
    
    forcell = @(f, c) cellfun(f, c, "UniformOutput", false);
    
    img_size = raw_format{1};
    quality = raw_format{2};
    dict = raw_format{3};
    encoded_data = raw_format{4};
    
    [size_block_h size_block_w] = compute_block_size(img_size(1), img_size(2), 8, 8);
    
    data = huffmandeco_(encoded_data, dict);
    
    rle_blocks = iflatten_blocks(data, size_block_h, size_block_w, img_size(3));
    zigzag_blocks = forcell(@(b) irle(b), rle_blocks);
    thresholds = forcell(@(b) izigzagb(b, size_block_h, size_block_w), zigzag_blocks);
    dcts = forcell(@(b) forcell(@(a) iqconvolution(a, quality), b), thresholds);
    blocks = forcell(@(b) forcell(@(a) idct2(a), b), dcts);
    merged_blocks = forcell(@(c) merge_blocks(c), blocks);
    img = cells2mat(merged_blocks, size_block_h, size_block_w) + 128
    output_img = ycbcr2rgb(uint8(img));
end
