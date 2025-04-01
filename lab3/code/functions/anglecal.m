function phi = anglecal(t, vvx, vvy)
    if t <= 0
        phi = deg2rad(81);
    else
        phi = atan(vvy / vvx);
    end
end
