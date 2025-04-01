function degrevector = getdegvec(tvalue, h, hasv)
    deg = zeros(1, length(tvalue));
    for i = 1:length(tvalue)
        deg(i) = 180 * anglecal(tvalue(i), hasv(3,i), hasv(4,i)) / pi;
    end
    degrevector = deg;
end
