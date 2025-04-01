function dzdt = funcsolve(t, z, v)
    x = z(1); y = z(2);
    x_dot = z(3); y_dot = z(4);
    g = 9.82; m0 = 0.05;
    k_x = 0.001; k_y = 0.001;

    V = sqrt(x_dot^2 + y_dot^2);
    phi = anglecal(t, x_dot, y_dot);
    m = M(m0, t);

    dzdt = zeros(4,1);
    dzdt(1) = x_dot;
    dzdt(2) = y_dot;
    dzdt(3) = (F_lyft(t, v)*cos(phi) - k_x * x_dot * V) / m;
    dzdt(4) = (F_lyft(t, v)*sin(phi) - k_y * y_dot * V) / m - g;
end
