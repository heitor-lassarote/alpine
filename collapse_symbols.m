function [symbols, probabilities] = collapse_symbols(data)
    data = sort(data);
    symbols = unique(data);
    
    probabilities = histcount(data) ./ numel(data);
end