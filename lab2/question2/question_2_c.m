clc; clear; close all;

% Ursprunglig volym
V_original = computeVolume(4, 10, 'RK4', false);
V_target = 0.72 * V_original;

% Hitta rätt L
[L_new, last_diff] = find_L(V_target, 3, 4, 1e-4);
fprintf('\nLängd för 72%% volym: %.4f ± %.4f\n', L_new, last_diff);
