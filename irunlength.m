function output = irunlength(input)
    [h w] = size(input);
    output = [];
    for i = 1:2:w
        for j = 1:input(i)
            output(end + 1) = input(i + 1);
        end
    end
end
