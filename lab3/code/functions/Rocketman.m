

function [z1, z2, z3, t_vals1, t_vals2, t_vals3, Error] = Rocketman(t1, t2, tend, h, F, v_yx, nr1)
    teta = 81*(pi/180);
    x0 = 0; y0 = 0;
    halvering = [1,2,4];
    steg = zeros(3,1);
    [xv, yv] = velocity(v_yx, teta);

    for i = 1:3
        hi = h / halvering(i);
        steg(i) = hi;
        [zd11, t_vals11] = RungeKutta(t1, t2, 0, hi, F, x0, y0, xv, yv);
        zpart1{i} = zd11;
        tpart1{i} = t_vals11;
    end

    [E1, pp1] = error_calc(zpart1, nr1);
    initial = zpart1{3};

    for j = 1:3
        hj = h / halvering(j);
        [zd21, t_vals21] = RungeKutta(t2, tend, 0, hj, 0, ...
            initial(1,end), initial(2,end), initial(3,end), initial(4,end));
        zpart2{j} = zd21;
        tpart2{j} = t_vals21;
    end

    [E2, pp2] = error_calc(zpart2, nr1);
    ordning = zeros(3,1); ordning(2) = pp1; ordning(3) = pp2;

    z1 = [zpart1{1}, zpart2{1}(:,2:end)];
    z2 = [zpart1{2}, zpart2{2}(:,2:end)];
    z3 = [zpart1{3}, zpart2{3}(:,2:end)];
    t_vals1 = [tpart1{1}, tpart2{1}(2:end)];
    t_vals2 = [tpart1{2}, tpart2{2}(2:end)];
    t_vals3 = [tpart1{3}, tpart2{3}(2:end)];
    Error = [steg, E1, E2, ordning];
end
