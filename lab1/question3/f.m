function y = f(x)
    y = 61*x - ((x.^2 + x + 0.03) ./ (3*x + 1)).^7 - 20*x.*exp(-x);
end
