function force = F_lyft(t, s)
    if t <= 0.08
        force = s;
    else
        force = 0;
    end
end
