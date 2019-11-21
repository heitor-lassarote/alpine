% https://github.com/lostpfg/Huffman-Matlab

function raw_format = alpine_encode(input_img, quality)
    if nargin == 1
        quality = 100;
    end
    
    forcell = @(f, c) cellfun(f, c, 'UniformOutput', false);
    
    [h w p] = size(input_img);
    
    img = chroma_subsampling(input_img);
    img = double(img) - 128;
    
    [size_block_h size_block_w] = compute_block_size(h, w, 8, 8);
    
    blocks = mat2cell(img, size_block_h, size_block_w, 3);
    dcts = forcell(@(b) dct2_channels(b), blocks);
    thresholds = forcell(@(b) qconvolution(b, quality), dcts);
    zigzag_blocks = forcell(@(b) zigzagb(b), thresholds);
    rle_blocks = forcell(@(b) rle(b), zigzag_blocks);
    data = flatten_blocks(rle_blocks);
    [symbols, probabilities] = collapse_symbols(data);
    dict = huffmandict(symbols, probabilities);
    encoded_data = huffmanenco(data, dict);
    raw_format = { [h w p], quality, dict, encoded_data };
end
