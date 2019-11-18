function output_block = qconvolution(input_block, quality)
    factor = (100 - quality) / 25 + 1;
    
    quality_kernel = [16 11 10 16 24  40  51  61;
                      12 12 14 19 26  58  60  55;
                      14 13 16 24 40  57  69  56;
                      14 17 22 29 51  87  80  62;
                      18 22 37 56 68  109 103 77;
                      24 35 55 64 81  104 113 92;
                      49 64 78 87 103 121 120 101;
                      72 92 95 98 112 100 103 99];
    
    block_size = size(input_block);
    quality_kernel = factor * quality_kernel(1:block_size(1), 1:block_size(2));
    
    output_block = round(input_block ./ quality_kernel);
end