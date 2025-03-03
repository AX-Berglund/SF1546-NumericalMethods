function V = computeVolume(L, N, method, useRichardson)
    % Beräknar volymen av luren numeriskt
    % L = axellängd
    % N = antal delintervall
    % method = 'Euler' eller 'RK4'
    % useRichardson = true/false (använd extrapolation eller inte)

    h = L / N; % Steglängd
    [x_vals, y_vals] = solveODE(method, h, L);

    % Beräkna integral V = pi * ∫ y^2 dx
    I1 = trapetsRegel(x_vals, y_vals.^2);

    if useRichardson
        % Använd en finare steglängd h/2
        [x_fine, y_fine] = solveODE(method, h/2, L);
        I2 = trapetsRegel(x_fine, y_fine.^2);
        V = pi * richardsonEx(I1, I2, 2);
    else
        V = pi * I1;
    end
end
