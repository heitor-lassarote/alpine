%TODO

function [symbols, probabilities] = collapse_symbols(data)
    count = numel(data);
    
    map = [];
    
    for i = 1:count
        key = data(i);
        map(key) = map(key) + 1;
    end
    
    map = map ./ count;
end