function I = trapetsRegel(x, f)
    % Numerisk integration med trapetsmetoden
    % x: x-värden
    % f: f(x)-värden

    h = diff(x); % Steglängd
    I = sum((f(1:end-1) + f(2:end)) .* h / 2); % addera första med andra, andra med tredje osv
    
end
