function [z_val, t_vals] = RungeKutta(a, b, N, h, v, x0, y0, xdot0, ydot0)
    t_vals = a:h:b;
    N = length(t_vals);
    z = zeros(4,N);
    z(:,1) = [x0; y0; xdot0; ydot0];

    for i = 1:N-1
        t = t_vals(i);
        z_i = z(:,i);
        k1 = funcsolve(t, z_i, v);
        k2 = funcsolve(t + h/2 , z_i + (h/2)*k1, v);
        k3 = funcsolve(t + h/2 , z_i + (h/2)*k2, v);
        k4 = funcsolve(t + h , z_i + h*k3, v);
        z(:,i+1) = z_i + (k1 + 2*k2 + 2*k3 + k4)*(h/6);
    end

    z_val = z;
end
