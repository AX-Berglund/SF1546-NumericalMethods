function [time_valu, indec] = find_t_between(zzval, ttval, step, h, tol)
    [~, index] = find_vector_zero(zzval);
    ftg = @(t) find_xy_val(zzval, ttval, t, step, index);
    t0 = ttval(index - 1) + h;
    t1 = ttval(index) - h;
    [time_valu, indec] = find_root_secant(ftg, t0, t1, tol);
end