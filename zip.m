function out = zip(v1, v2)
    out_size = min(numel(v1), numel(v2));
    for i = 1:out_size
        out(i, :) = [v1(i) v2(i)];
    end
end
