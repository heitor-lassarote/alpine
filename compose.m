function h = compose(g, f)
    h = @(x) g(f(x));
end
