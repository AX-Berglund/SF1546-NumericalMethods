clc;
clear;
close all;

% Parametrar
L = 4;
num_steps = 4; % Number of step sizes
N_values = round(logspace(log10(100), log10(100 * 2^(num_steps-1)), num_steps)); % Geometric sequence for N
method = 'RK4';

fprintf("\nVolymberäkning för olika antal delintervall (N):\n");

V_values = zeros(1, num_steps); % Store volume results

for i = 1:num_steps
    N = N_values(i);
    V_values(i) = computeVolume(L, N, method, false);
    fprintf("N = %d, Volym = %.6f\n", N, V_values(i));
end

% Compute the second-to-last result and the difference
V_2nd_last = V_values(end-1);
V_last = V_values(end);
difference = abs(V_2nd_last - V_last);

% Print the final result with uncertainty
fprintf("\nAndra sista värdet: %.6f ± %.6f\n", V_2nd_last, difference);

% Function Definitions (same as before)
function V = computeVolume(L, N, method, useRichardson)
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

function [x_vals, y_vals] = solveODE(method, h, L)
    f = @(x, y) -((1/6) + (pi * sin(pi * x) / (1.6 - cos(pi * x)))) * y;
    x0 = 0;
    y0 = 2.5;
    
    n_steps = round(L / h); 
    x_vals = linspace(x0, L, n_steps + 1);
    y_vals = zeros(size(x_vals));
    y_vals(1) = y0;

    for i = 1:n_steps
        x_n = x_vals(i);
        y_n = y_vals(i);

        if strcmp(method, 'Euler')
            y_vals(i + 1) = y_n + h * f(x_n, y_n);
        elseif strcmp(method, 'RK4')
            k1 = h * f(x_n, y_n);
            k2 = h * f(x_n + h/2, y_n + k1/2);
            k3 = h * f(x_n + h/2, y_n + k2/2);
            k4 = h * f(x_n + h, y_n + k3);
            y_vals(i + 1) = y_n + (k1 + 2*k2 + 2*k3 + k4)/6;
        else
            error('Okänd metod. Välj "Euler" eller "RK4".');
        end
    end
end

function I = trapetsRegel(x, f)
    h = diff(x);
    I = sum((f(1:end-1) + f(2:end)) .* h / 2);
end
