% Source: https://stackoverflow.com/a/28375839/10213577
function y = zigzag(X)
    [r, c] = size(X);
    M = bsxfun(@plus, (1:r).', 0:c-1);
    M = M + bsxfun(@times, (1:r).'/(r+c), (-1).^M);
    [~, ind] = sort(M(:));
    y = X(ind).';
end
