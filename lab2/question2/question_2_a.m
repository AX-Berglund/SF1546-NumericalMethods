clc; clear; close all;

% Parametrar
L = 4;
step_sizes = [0.5, 0.25, 0.1, 0.01];

fprintf("\nVolymberäkning för olika steglängder:\n");

for h = step_sizes
    V = computeVolume(L, round(L/h), 'RK4', false);
    fprintf("h = %.3f, Volym = %.6f\n", h, V);
end
