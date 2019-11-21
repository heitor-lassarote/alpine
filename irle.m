function output_block = irle(input_block)
    index = input_block(1);
    rles = input_block(2:2:end);
    output_block = cellfun(@(c) irunlength(c), rles, "UniformOutput", false);
    output_block = {output_block index};
end
